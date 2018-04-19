//
//  BookingModel.swift
//  BookMyCourt
//
//  Created by Vallamsetty,Revanth on 4/2/18.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation
import Parse
class Booking:PFObject, PFSubclassing
{
    static func parseClassName() -> String {
       return "Booking"
    }
    
    @NSManaged var bookingID:Int
    @NSManaged var dateID:Date
    @NSManaged var timeSlotID:Int
    @NSManaged var courtID:Int
    @NSManaged var userID:String

    
}
