//
//  SecondViewController.swift
//  BookMyCourt
//
//  Created by Student on 2/16/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class NewBookingViewController: UIViewController {

    @IBOutlet weak var Txt919Number: UITextField!
    @IBOutlet weak var TxtPhoneNumber: UITextField!
    @IBOutlet weak var LblMessage: UILabel!
    
   
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var locationLBL: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func isEqual<T: Equatable>(type: T.Type, a: Any, b: Any) -> Bool? {
        guard let a = a as? T, let b = b as? T else { return nil }
        
        return a == b
    }
    override func viewWillAppear(_ animated: Bool) {
        var sel = AppDelegate.selected
        var loc=""
        for court in AppDelegate.data.courts{
            if isEqual(type:Int.self,a:sel["CourtID"],b:court["CourtID"])! {
                loc=court.CourtLocation
                break
            }
            
        }
        locationLBL.text=loc
        var strD=String(describing: sel["DateID"]!)
        let index = strD.index(strD.startIndex, offsetBy: 10)
        var dat=strD[..<index]
        for timeslot in AppDelegate.data.timeslots{
            if isEqual(type:Int.self,a:sel["TimeSlotID"],b:timeslot["TimeSlotID"])! {
                dat += " "+String(describing: timeslot["Timing"]!)
                break
            }

        }
        dateLabel.text=String(dat)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        var entID = Txt919Number.text!
        var entPH = TxtPhoneNumber.text!
        var res:Bool = false
        for user in AppDelegate.data.users
        {
            if entID == String(describing: user["UserID"]) && entID == String(describing: user["PhoneNumber"])
            {
                res=true
            }
            else
            {
                res=false
            }
         }
        return res
    }
    
    
}

