//
//  CalendarVars.swift
//  HealthCare
//
//  Created by Alex on 2018/6/3.
//  Copyright © 2018年 Alex. All rights reserved.
//
import Foundation


let date = Date()
let calendar = Calendar.current
let day = calendar.component(.day , from: date)
var weekday = calendar.component(.weekday, from: date) - 1
var month = calendar.component(.month, from: date) - 1
var year = calendar.component(.year, from: date)

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


