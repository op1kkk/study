//
//  TableViewCell.swift
//  Vk
//
//  Created by Александр Чигрин on 28.11.2021.
//

import UIKit

class FriendsCell: UITableViewCell {

    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendAvatar: TestView!
    
    
  //  func configure(model: UserModel) {
    //    friendName.text = model.name + " " + model.surname
      //  friendAvatar.image = UIImage(named: model.avatar) ?? UIImage()
   // }
    func configure(name: String, image: UIImage) {
        friendName.text = name
        friendAvatar.image = image
    }
}
