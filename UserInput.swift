//
//  UserInput.swift
//  HealthCare
//
//  Created by Alex on 2018/5/28.
//  Copyright © 2018年 Alex. All rights reserved.
//

import UIKit
import Firebase

class UserInput: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var valueBMI: UILabel!
    
    var ref: DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ref = Database.database().reference()
        valueBMI.text = "0.0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func clearInput(_ sender: Any) {
        let emptyResult = ""
        name.text = emptyResult
        age.text = emptyResult
        weight.text = emptyResult
        height.text = emptyResult
    }
    
    @IBAction func saveInput(_ sender: Any) {
        let validation = true
        if validation == checkUserInput(){
            saveData()
        }
        
    }
    
    
    func createAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        //Creat
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler:{(action) in
            alert.dismiss(animated: true, completion: nil)
            print("Yes")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func calculateBMI(_ sender: Any) {
        if height.text == "" || weight.text == ""{
            valueBMI.text = "Invalid"
        }
        else{
            let userHeight = Double(height.text!)! * Double(height.text!)!
            let userWeight = Double(weight.text!)!
            let bmi = userWeight / userHeight
            let value = String(format:"%.4f", bmi)
            valueBMI.text = value
        }
    }
    
    func checkUserInput() -> Bool{
        if name.text == ""{
            createAlert(title: "Invalid", message: "Name cannot be empty")
        }
        else if age.text == ""{
            createAlert(title: "Invalid", message: "Age cannot be empty")
        }
        else if weight.text == ""{
            createAlert(title: "Invalid", message: "Weight cannot be empty")
        }
        else if height.text == ""{
            createAlert(title: "Invalid", message: "Height cannot be empty")
        }
        return true
    }
    
    func saveData(){
        ref?.child("Posts").childByAutoId().setValue(name.text)
        ref?.child("Posts").childByAutoId().setValue(age.text)
        ref?.child("Posts").childByAutoId().setValue(weight.text)
        ref?.child("Posts").childByAutoId().setValue(height.text)
        
    }
    
    
    
    
    
}
