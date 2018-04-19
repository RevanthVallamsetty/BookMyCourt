//
//  TimeSlotModel.swift
//  BookMyCourt
//
//  Created by student on 3/9/18.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation
import Parse
class TimeSlot:PFObject, PFSubclassing {
    static func parseClassName() -> String {
        return "TimeSlot"
    }
    
    @NSManaged var timeSlotID:Int
    @NSManaged var timing:String
    
    
}
