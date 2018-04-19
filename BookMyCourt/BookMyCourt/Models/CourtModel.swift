//
//  CourtModel.swift
//  BookMyCourt
//
//  Created by student on 3/9/18.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation
import Parse

class Court:PFObject, PFSubclassing{
    
    @NSManaged var courtID:Int
    @NSManaged var CourtLocation:String
    
    static func parseClassName() -> String
    {
        return "Court"
    }
    
}
