//
//  Lunch.swift
//  HealthCare
//
//  Created by Alex on 2018/5/29.
//  Copyright © 2018年 Alex. All rights reserved.
//

import UIKit

class FoodDetail: UIViewController {

    @IBOutlet weak var lbl1: UILabel!
    var mealInt = 0
    var postData = ["breakfast", "lunch", "dinner", "afternoonTea", "nightSnack"]

    override func viewDidLoad() {
        super.viewDidLoad()
        print(mealInt)
        lbl1.text = postData[mealInt]
        // Do any additional setup after loading the view.
        
        // load from firebase as {0,1,2,3..}
        loadFromFirebase()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadFromFirebase()
    {
        switch mealInt {
        case 0:
            // load data as in 0
            break
            
        default:
            ()
        }
        
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
