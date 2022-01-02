//
//  NewGroupCell.swift
//  Vk
//
//  Created by Александр Чигрин on 03.12.2021.
//

import UIKit

class NewGroupCell: UITableViewCell {

    @IBOutlet weak var newGroupName: UILabel!
    @IBOutlet weak var newGroupAvatar: UIImageView!
    
    func configure (model: GroupModel) {
        newGroupName.text = model.name
        newGroupAvatar.image = UIImage(named: model.avatar)
    }
}
