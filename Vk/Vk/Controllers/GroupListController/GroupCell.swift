//
//  GroupCell.swift
//  Vk
//
//  Created by Александр Чигрин on 03.12.2021.
//

import UIKit

class GroupCell: UITableViewCell {

    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupAvatar: UIImageView!
    
    func configure(model: GroupModel) {
        groupName.text = model.name
        groupAvatar.image = UIImage(named: model.avatar)
    }
}
