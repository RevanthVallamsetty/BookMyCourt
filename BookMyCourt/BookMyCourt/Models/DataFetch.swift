//
//  DataFetch.swift
//  BookMyCourt
//
//  Created by Vallamsetty,Revanth on 4/16/18.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation
import Parse

class DataFetch{
    var users:[Users]
    var courts:[Court]
    var availabilities:[Availability]
    var timeslots:[TimeSlot]
    var bookings:[Booking]
    
    init() {
        users=[]
        courts=[]
        availabilities=[]
        timeslots=[]
        bookings=[]
    }
    
    func loadCourtsData()
    {
        let query=PFQuery(className:"Court")
        query.findObjectsInBackground {(objects: [PFObject]?, error: Error?)-> Void in
        self.courts=objects as! [Court]
//        print(self.courts)
        }
    }
    func loadTimeSlotsData()
    {
        let query=PFQuery(className:"TimeSlot")
        query.findObjectsInBackground {(objects: [PFObject]?, error: Error?)-> Void in
            self.timeslots=objects as! [TimeSlot]
        }
       
    }
    func loadBookingData()
    {
        let query=PFQuery(className:"Booking")
        query.findObjectsInBackground {(objects: [PFObject]?, error: Error?)-> Void in
            self.bookings=objects as! [Booking]
        }
    }
    func loadUserData()
    {
        let query=PFQuery(className:"Users")
        query.findObjectsInBackground {(objects: [PFObject]?, error: Error?)-> Void in
            self.users=objects as! [Users]
        }
    }
    
    func loadAvailabilitiesData()
    {
        let query=PFQuery(className:"Availability")
        query.whereKey("isAvailable", equalTo: true)
        query.findObjectsInBackground {(objects: [PFObject]?, error: Error?)-> Void in
            
            self.availabilities=objects as! [Availability]
            
        }
    }
    func loadAllData()
    {
       self.loadAvailabilitiesData()
       self.loadCourtsData()
        self.loadTimeSlotsData()
        self.loadUserData()
        self.loadBookingData()
    }
}
