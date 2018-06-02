//
//  FoodMenu.swift
//  HealthCare
//
//  Created by Alex on 2018/5/28.
//  Copyright © 2018年 Alex. All rights reserved.
//

import UIKit

class FoodMenu: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
   
    @IBOutlet weak var foodMenu: UITableView!
    var postData = ["breakfast", "lunch", "dinner", "afternoonTea", "nightSnack"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        foodMenu.delegate = self
        foodMenu.dataSource = self
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = foodMenu.dequeueReusableCell(withIdentifier: "breakfastCell") as! CustomerTableViewCell
        
        cell.view.layer.cornerRadius = cell.view.frame.height / 2
        
        cell.foodLabel.text = postData[indexPath.row]
        cell.foodImage.image = UIImage(named: postData[indexPath.row])
        cell.foodImage.layer.cornerRadius = cell.view.frame.height / 2
        cell.foodButton.layer.cornerRadius = cell.view.frame.height / 2
        
        return cell
   
    }
    
    var indexSelected:Int = 0;
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexSelected = indexPath.row
        
        self.performSegue(withIdentifier: "anotherscene", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let sec = segue.destination as! FoodDetail
        sec.mealInt = indexSelected
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
    
    
    
    


}
