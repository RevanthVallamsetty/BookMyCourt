//
//  CourtData.swift
//  BookMyCourt
//
//  Created by Atkuri,Ashok on 4/18/18.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation
import Parse

class CourtData {
    static var courtArr:[Court] = []
    
    init() {
        
    }
    
    static func getCourtData() -> [Court]{
        let query1 = PFQuery(className:"Court")
        query1.findObjectsInBackground {(objects: [PFObject]?, error: Error?) -> Void
            in
            if error == nil
            {
                //print(objects)
                for court in objects!{
                    courtArr.append(Court(courtID: court["CourtID"] as! Int,CourtLocation: court["CourtLocation"] as! String))
                    //print(court["CourtLocation"] as! String)
                }
                print("******")
                print(courtArr[0].CourtLocation)
                
            }
            else { // Log details of the failure
                
            }
        }
        return courtArr
    }
}
