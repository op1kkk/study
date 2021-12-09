//
//  GroupTableController.swift
//  Vk
//
//  Created by Александр Чигрин on 03.12.2021.
//

import UIKit

class GroupTableController: UITableViewController {
    
    var groups: [GroupModel] =
    [GroupModel(avatar: "g1", name: "Cats & Dogs"),
    GroupModel(avatar: "g2", name: "Best dance music"),
    GroupModel(avatar: "g3", name: "Iphones")]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GCell", for: indexPath) as? GroupCell else {
            return UITableViewCell()
        }
        cell.configure(model: groups[indexPath.row])
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

}
