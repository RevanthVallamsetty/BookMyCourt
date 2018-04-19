//
//  UserModel.swift
//  BookMyCourt
//
//  Created by student on 3/9/18.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation
import Parse
class Users: PFObject, PFSubclassing{
    static func parseClassName() -> String {
       return "Users"
    }
    
    @NSManaged var userID:String
    @NSManaged var phoneNumber:String
    @NSManaged var rememberMe:Bool
}
