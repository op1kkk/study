//
//  GroupTableController.swift
//  Vk
//
//  Created by Александр Чигрин on 03.12.2021.
//

import UIKit

class GroupTableController: UITableViewController {
    
   
    @IBOutlet weak var searchGroup: UISearchBar!
    
    private var groups: [GroupModel] =
    [GroupModel(avatar: "g1", name: "Cats & Dogs"),
    GroupModel(avatar: "g2", name: "Best dance music"),
    GroupModel(avatar: "g3", name: "Iphones")]
    
    private var filteredGroups = [GroupModel]()
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup search controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        

//        let tapOnGroup = UITapGestureRecognizer(target: groupLabel, action: #selector(GroupTableController.runAnimate()))
//        tableView.addGestureRecognizer(tapOnGroup)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredGroups.count
        }
        return groups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GCell", for: indexPath) as? GroupCell else {
            return UITableViewCell()
        }
        
        var group: GroupModel
        
        if isFiltering {
            group = filteredGroups[indexPath.row]
        } else {
            group = groups[indexPath.row]
        }
        
        cell.groupName.text = group.name
        cell.groupAvatar.image = UIImage(named: group.avatar)
        
        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        if segue.identifier == "addGroup" {
            guard let newGroupsController = segue.source as? NewGroupTableController
            else { return }
            if let indexPath = newGroupsController.tableView.indexPathForSelectedRow {
                let group = newGroupsController.groups[indexPath.row]
                if !groups.contains(group) {
                groups.append(group)
                tableView.reloadData()
                }
            }
        }
    }
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Animation
    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.5) {
                    if let cell = tableView.cellForRow(at: indexPath) as? GroupCell {
                        cell.groupAvatar.transform = .init(scaleX: 0.66, y: 0.66)
                        cell.contentView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
                    }
                }
    }
    
    override func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.5) {
            if let cell = tableView.cellForRow(at: indexPath) as? GroupCell {
                cell.groupAvatar.transform = .identity
                cell.contentView.backgroundColor = .clear
            }
        }
    }

}

extension GroupTableController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        
        filteredGroups = groups.filter({ (group: GroupModel) -> Bool in
            return group.name.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
}
