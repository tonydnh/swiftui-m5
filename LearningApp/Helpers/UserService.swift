//
//  UserService.swift
//  LearningApp
//
//  Created by Tony Dinh on 7/9/22.
//

import Foundation

class UserService {
    
    var user = User()
    
    static var shared = UserService()
    
    private init() {
        
    }
    
}
