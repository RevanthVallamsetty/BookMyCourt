//
//  MyBookingsViewController.swift
//  BookMyCourt
//
//  Created by Vallamsetty,Revanth on 2/16/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class MyBookingsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var userBookings:[Booking]=[]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.UserBooking()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func isiEqual<T: Equatable>(type: T.Type, a: Any, b: Any) -> Bool? {
        guard let a = a as? T, let b = b as? T else { return nil }
        
        return a == b
    }
    func UserBooking()
    {
        for booking in AppDelegate.data.bookings{
            if isiEqual(type: String.self,a: String(describing: booking["UserID"]),b: AppDelegate.enteredUserID)!{
                userBookings.append(booking)
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppDelegate.data.bookings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Booking")
        var userbooking=self.userBookings[indexPath.row]
        var courtL=""
        var time=""
        
        for court in AppDelegate.data.courts{
            if isiEqual(type:Int.self,a:userbooking["CourtID"],b:court["CourtID"])! {
                courtL=court.CourtLocation
                break
            }
            
        }
        for timeSlot in AppDelegate.data.timeslots{
            
            if isiEqual(type:Int.self,a:timeSlot["TimeSlotID"],b:userbooking["TimeSlotID"])!
            {
                time = String(describing: timeSlot["Timing"]!)
                break
            }
            
        }
        cell?.textLabel?.text=courtL
        cell?.detailTextLabel?.text=time
        return cell!
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
