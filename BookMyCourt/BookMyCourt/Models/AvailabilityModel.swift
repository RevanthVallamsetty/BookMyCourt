//
//  AvailabilityModel.swift
//  BookMyCourt
//
//  Created by student on 3/9/18.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation
import Parse
class Availability:PFObject, PFSubclassing{
    static func parseClassName() -> String {
       return "Availability"
    }
   @NSManaged var courtID:Int
   @NSManaged var dateID:Date
   @NSManaged var timeSlotID:Int
   @NSManaged var isAvailable:Bool
}
