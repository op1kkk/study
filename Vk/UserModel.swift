//
//  UserModel.swift
//  Vk
//
//  Created by Александр Чигрин on 03.12.2021.
//

import Foundation
import UIKit

struct UserModel {
    
    let name: String
    let surname: String
    let avatar: String
    let uiAvatar: UIImage
    var storedImages: [UIImage] = []
    
    init(name: String, surname: String, avatar: String, storedImages: [String]) {
        self.name = name
        self.surname = surname
        self.avatar = avatar
        
        uiAvatar = UIImage(named: avatar) ?? UIImage()
        
        // массив фото юзера из имен фото
        for storedImage in storedImages {
            guard let avatar = UIImage(named: storedImage) else { continue }
            self.storedImages.append(avatar)
        }
    }
}
