//
//  TableViewController.swift
//  Vk
//
//  Created by Александр Чигрин on 28.11.2021.
//

import UIKit

class FriendsTableController: UITableViewController {
    
    var friends = FriendsLoader.iNeedFriends()
    var lettersOfNames = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.showsVerticalScrollIndicator = false
        loadLetters()
    }
    
    func loadLetters() {
        for user in friends {
            lettersOfNames.append(String(user.key))
        }
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        friends.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends[section].data.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = friends[section]
        
        return String(section.key)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? FriendsCell else {
            return UITableViewCell()
        }
        let section = friends[indexPath.section]
        let name = section.data[indexPath.row].name + " " + section.data[indexPath.row].surname
        let image = section.data[indexPath.row].avatar
        
        cell .configure(name: name, image: UIImage(named: image)!)
        
        return cell
    }

    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return lettersOfNames
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = .gray
        
        let letter = UILabel(frame: CGRect(x: 30, y: 5, width: 20, height: 20))
        letter.textColor = .white
        letter.text = lettersOfNames[section]
        letter.font = UIFont.systemFont(ofSize: 14)
        header.addSubview(letter)
        return header
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
