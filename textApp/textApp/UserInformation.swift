//
//  UserInformation.swift
//  textApp
//
//  Created by Yuxi Wu on 19/5/18.
//  Copyright © 2018 Yuxi Wu. All rights reserved.
//

import UIKit

class UserInformation: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var gender: UISegmentedControl!
    
    
    @IBAction func clearData(_ sender: Any) {
        let emptyResult = ""
        name.text = emptyResult
        age.text = emptyResult
        weight.text = emptyResult
        height.text = emptyResult
    }
    
    @IBAction func saveData(_ sender: Any) {
        checkUserInput()
    }
    
    @IBAction func submitData(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    func createAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        //Creat
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler:{(action) in
            alert.dismiss(animated: true, completion: nil)
            print("Yes")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }

    func checkUserInput(){
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
    }
}
