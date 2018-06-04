//
//  Calendar.swift
//  HealthCare
//
//  Created by Alex on 2018/6/3.
//  Copyright © 2018年 Alex. All rights reserved.
//


import UIKit
import UserNotifications

var dateString = ""

class CalendarView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var Calendar: UICollectionView!
    @IBOutlet weak var MonthLabel: UILabel!
    
    @IBAction func notifyButton(_ sender: UIButton) {
        timedNotifications(inSeconds: 3) { (success) in
            if success {
                print("Successfully Notified")
            }
        }
    }
    
    let Months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    let DaysOfMonth = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
    
    var DaysInMonths = [31,28,31,30,31,30,31,31,30,31,30,31]
    
    var currentMonth = String()
    
    var NumberOfEmptyBox = Int()
    
    var NextNumberOfEmptyBox = Int()
    
    var PreviousNumberOfEmptyBox = 0
    
    var Direction = 0
    
    var PositionIndex = 0
    
    var LeapYearCounter = 2
    
    var dayCounter = 0
    
    var highlightdate = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentMonth = Months[month]
        MonthLabel.text = "\(currentMonth) \(year)"
        if weekday == 0 {
            weekday = 7
        }
        GetStartDateDayPosition()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (success, error) in
            if error != nil {
                print("Authorization Unsuccessful")
            } else {
                print("Authorization Successful")
            }
        }
    }
    
    
    func GetStartDateDayPosition() {
        switch Direction{
        case 0:
            NumberOfEmptyBox = weekday
            dayCounter = day
            while dayCounter>0 {
                NumberOfEmptyBox = NumberOfEmptyBox - 1
                dayCounter = dayCounter - 1
                if NumberOfEmptyBox == 0 {
                    NumberOfEmptyBox = 7
                }
            }
            if NumberOfEmptyBox == 7 {
                NumberOfEmptyBox = 0
            }
            PositionIndex = NumberOfEmptyBox
        case 1...:
            NextNumberOfEmptyBox = (PositionIndex + DaysInMonths[month])%7
            PositionIndex = NextNumberOfEmptyBox
            
        case -1:
            PreviousNumberOfEmptyBox = (7 - (DaysInMonths[month] - PositionIndex)%7)
            if PreviousNumberOfEmptyBox == 7 {
                PreviousNumberOfEmptyBox = 0
            }
            PositionIndex = PreviousNumberOfEmptyBox
        default:
            fatalError()
        }
    }
    
    @IBAction func Next(_ sender: Any) {
        highlightdate = -1
        switch currentMonth {
        case "December":
            Direction = 1
            
            month = 0
            year += 1
            
            if LeapYearCounter  < 5 {
                LeapYearCounter += 1
            }
            
            if LeapYearCounter == 4 {
                DaysInMonths[1] = 29
            }
            
            if LeapYearCounter == 5{
                LeapYearCounter = 1
                DaysInMonths[1] = 28
            }
            GetStartDateDayPosition()
            
            currentMonth = Months[month]
            MonthLabel.text = "\(currentMonth) \(year)"
            
            Calendar.reloadData()
        default:
            Direction = 1
            
            GetStartDateDayPosition()
            
            month += 1
            
            currentMonth = Months[month]
            MonthLabel.text = "\(currentMonth) \(year)"
            
            Calendar.reloadData()
        }
    }
    
    
    @IBAction func Back(_ sender: Any) {
        highlightdate = -1
        switch currentMonth {
        case "January":
            Direction = -1
            
            month = 11
            year -= 1
            
            if LeapYearCounter > 0{
                LeapYearCounter -= 1
            }
            if LeapYearCounter == 0{
                DaysInMonths[1] = 29
                LeapYearCounter = 4
            }else{
                DaysInMonths[1] = 28
            }
            
            GetStartDateDayPosition()
            
            currentMonth = Months[month]
            MonthLabel.text = "\(currentMonth) \(year)"
            Calendar.reloadData()
            
        default:
            Direction = -1
            
            month -= 1
            
            GetStartDateDayPosition()
            
            currentMonth = Months[month]
            MonthLabel.text = "\(currentMonth) \(year)"
            Calendar.reloadData()
        }
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch Direction{
        case 0:
            return DaysInMonths[month] + NumberOfEmptyBox
        case 1...:
            return DaysInMonths[month] + NextNumberOfEmptyBox
        case -1:
            return DaysInMonths[month] + PreviousNumberOfEmptyBox
        default:
            fatalError()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Calendar", for: indexPath) as! DateCollectionViewCell
        cell.backgroundColor = UIColor.clear
        
        cell.DateLabel.textColor = UIColor.black
        
        cell.Circle.isHidden = true
        
        if cell.isHidden{
            cell.isHidden = false
        }
        
        switch Direction {
        case 0:
            cell.DateLabel.text = "\(indexPath.row + 1 - NumberOfEmptyBox)"
        case 1:
            cell.DateLabel.text = "\(indexPath.row + 1 - NextNumberOfEmptyBox)"
        case -1:
            cell.DateLabel.text = "\(indexPath.row + 1 - PreviousNumberOfEmptyBox)"
        default:
            fatalError()
        }
        
        if Int(cell.DateLabel.text!)! < 1{ //here we hide the negative numbers or zero
            cell.isHidden = true
        }
        
        switch indexPath.row { //weekend days color
        case 5,6,12,13,19,20,26,27,33,34:
            if Int(cell.DateLabel.text!)! > 0 {
                cell.DateLabel.textColor = UIColor.lightGray
            }
        default:
            break
        }
        if currentMonth == Months[calendar.component(.month, from: date) - 1] && year == calendar.component(.year, from: date) && indexPath.row + 1 - NumberOfEmptyBox == day{
            cell.Circle.isHidden = false
            cell.DrawCircle()
            
        }
        
        if highlightdate == indexPath.row {
            cell.backgroundColor = UIColor.orange
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        dateString = "\(indexPath.row - PositionIndex + 1) \(currentMonth) \(year)"
        
        performSegue(withIdentifier: "NextView", sender: self)
        
        highlightdate = indexPath.row
        collectionView.reloadData()
    }
    
    func timedNotifications(inSeconds: TimeInterval, completion: @escaping (_ Success: Bool) -> ()) {
        var morning = DateComponents()
        morning.hour = 8
        morning.minute = 0
        
        /* var noon = DateComponents()
         noon.hour = 12
         noon.minute = 0
         
         var night = DateComponents()
         night.hour = 18
         night.minute = 0*/
        
        
        let morningTrigger = UNCalendarNotificationTrigger(dateMatching: morning, repeats: true)
        //let noonTrigger = UNCalendarNotificationTrigger(dateMatching: noon, repeats: true)
        //let nightTrigger = UNCalendarNotificationTrigger(dateMatching: night, repeats: true)
        
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: false)
        
        let morningContent = UNMutableNotificationContent()
        morningContent.title = "Good Morning!"
        morningContent.subtitle = "Today is your day"
        morningContent.body = "You could make it full of enthusiasm with some excercises"
        
        /*let noonContent = UNMutableNotificationContent()
         noonContent.title = "Good Afternoon!"
         noonContent.subtitle = "Body under contruction"
         noonContent.body = "Let get some healthy food to archive your dream body"
         
         let nightContent = UNMutableNotificationContent()
         nightContent.title = "Good Evening!"
         nightContent.subtitle = "It's the time to kill some fat"
         nightContent.body = "Let warm up with some exercises"*/
        
        let morningRequest = UNNotificationRequest(identifier: "customNotification1", content: morningContent, trigger: morningTrigger)
        //let noonRequest = UNNotificationRequest(identifier: "customNotification2", content: noonContent, trigger: noonTrigger)
        //let nightRequest = UNNotificationRequest(identifier: "customNotification3", content: nightContent, trigger: nightTrigger)
        
        UNUserNotificationCenter.current().add(morningRequest) { (error) in
            if error != nil {
                completion(false)
            } else {
                completion(true)
            }
}

/* UNUserNotificationCenter.current().add(noonRequest) { (error) in
 if error != nil {
 completion(false)
 } else {
 completion(true)
 }
 }
 
 UNUserNotificationCenter.current().add(nightRequest) { (error) in
 if error != nil {
 completion(false)
         } else {
         completion(true)
         }
         }*/
        
    }
}
