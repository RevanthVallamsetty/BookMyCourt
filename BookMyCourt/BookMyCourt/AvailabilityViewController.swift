//
//  FirstViewController.swift
//  BookMyCourt
//
//  Created by Student on 2/16/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit
import Parse

class AvailabilityViewController:  UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    @IBOutlet weak var courtsAvailabilityTV: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        AppDelegate.data.loadAllData()
       
    }
    
    @IBAction func BTNCheck(_ sender: UIButton) {
        self.courtsAvailabilityTV.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return AppDelegate.data.availabilities.count
    }
    func isEqual<T: Equatable>(type: T.Type, a: Any, b: Any) -> Bool? {
        guard let a = a as? T, let b = b as? T else { return nil }
        
        return a == b
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "availabilityList")!
        let availability=AppDelegate.data.availabilities[indexPath.row]
        var courtL=""
        var time=""
        
        for court in AppDelegate.data.courts{
            if isEqual(type:Int.self,a:availability["CourtID"],b:court["CourtID"])! {
                courtL=court.CourtLocation
                break
            }
    
        }
        for timeSlot in AppDelegate.data.timeslots{
            
            if isEqual(type:Int.self,a:timeSlot["TimeSlotID"],b:availability["TimeSlotID"])!
            {
                time = String(describing: timeSlot["Timing"]!)
                break
            }
        
        }
        cell.textLabel?.text=courtL
        cell.detailTextLabel?.text=time
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       AppDelegate.selected = AppDelegate.data.availabilities[indexPath.row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    
   

}

