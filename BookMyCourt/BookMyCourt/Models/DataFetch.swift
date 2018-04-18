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
    var users:[User]
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
    
    
    func loadAvailabilityData(){
        let query = PFQuery(className:"Availability")
        query.findObjectsInBackground {(objects: [PFObject]?, error: Error?) -> Void
            in
            if error == nil
            {
                for availability in objects!{
                    var availabilityObj:Availability = Availability()
                    availabilityObj.dateID = availability["DateID"] as! Date
                    var isAvailable:Bool = (availability["isAvailable"] != nil)
                    
                    //print(availability["Court"])
                    var courtObj:PFObject = availability["Court"] as! PFObject
                    //print(courtObj.objectId)
                    
                    let query1 = PFQuery(className:"Court")
                    query1.whereKey("objectId", equalTo: courtObj.objectId)
                    query1.findObjectsInBackground {(objects: [PFObject]?, error: Error?) -> Void
                        in
                        if error == nil
                        {
                            //print(objects)
                            for court in objects!{
                                availabilityObj.court = Court(courtID: court["CourtID"] as! Int,CourtLocation: court["CourtLocation"] as! String)
                                //print(court["CourtLocation"] as! String)
                            }
                        }
                        else { // Log details of the failure
                            
                        }
                    }
                    var objID1:PFObject=availability["TimeSlot"] as! PFObject
                    let query2 = PFQuery(className:"TimeSlot")
                    query2.whereKey("objectId", equalTo: objID1.objectId)
                    query2.findObjectsInBackground {(objects: [PFObject]?, error: Error?) -> Void
                        in
                        if error == nil
                        {
                            //print(objects)
                            for timeslot in objects!{
                                availabilityObj.timeSlot = TimeSlot(timeslot: timeslot["TimeSlotID"] as! Int,timing: timeslot["Timing"] as! String)
                            }
                        }
                        else { // Log details of the failure
                            
                        }
                    }
                    self.availabilities.append(availabilityObj)
                }
            }
        }
        print(self.availabilities.count)
    }
}
