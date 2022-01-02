//
//  Session.swift
//  Vk
//
//  Created by Александр Чигрин on 29.12.2021.
//

import Foundation

class Session {
    
    static let instance = Session()
    
    private init() {}
    
    var token = ""
    var userID = 0
    
}
