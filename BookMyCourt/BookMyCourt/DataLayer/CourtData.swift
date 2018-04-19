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
//                for court in objects!{
//                    var newc=Court()
//                    newc.courtID=court["CourtID"] as! Int
//                    newc.CourtLocation=court["CourtLocation"] as! String
//                    courtArr.append(newc)
//                    //print(court["CourtLocation"] as! String)
//                }
                var newc=objects![0] as! Court
                //                                newc.courtID=court["CourtID"] as! Int
                //                                newc.CourtLocation=court["CourtLocation"] as! String
              courtArr.append(newc)
                print("******")
                print(courtArr[0].CourtLocation)
                
            }
            else { // Log details of the failure
                
            }
        }
        return courtArr
    }
}
