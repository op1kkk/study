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
        let name = section.data[indexPath.row].surname + " " + section.data[indexPath.row].name
        let image = section.data[indexPath.row].avatar
        
        cell .configure(name: name, image: UIImage(named: image)!)
        
        return cell
    }

    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return lettersOfNames
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = GradientView()
        header.startColor = .systemCyan
        header.endColor = .white
        
        let letter = UILabel(frame: CGRect(x: 25, y: 5, width: 20, height: 20))
        letter.textColor = .black
        letter.text = lettersOfNames[section]
        letter.font = UIFont.systemFont(ofSize: 16)
        header.addSubview(letter)
        return header
    }

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.destination is FriendsCollectionController {
			guard
				let vc = segue.destination as? FriendsCollectionController,
				let indexPathSection = tableView.indexPathForSelectedRow?.section,
				let indexPathRow = tableView.indexPathForSelectedRow?.row
			else {
				return
			}
			let section = friends[indexPathSection]
			vc.friend = section.data[indexPathRow]
		}
	}
}

private extension FriendsTableController {
    
    func loadLetters() {
        for user in friends {
            lettersOfNames.append(String(user.key))
        }
    }
}
