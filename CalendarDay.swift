
//  CalendarDay.swift
//  HealthCare
//
//  Created by Alex on 2018/6/4.
//  Copyright © 2018年 Alex. All rights reserved.
//

import UIKit
import FacebookShare


class CalendarDay: UIViewController{

    @IBOutlet weak var currentDay: UILabel!
    @IBOutlet weak var breakfast: UITextView!
    @IBOutlet weak var lunch: UITextView!
    @IBOutlet weak var dinner: UITextView!
    @IBOutlet weak var exerciseImage: UIImageView!
    @IBOutlet weak var exercise: UITextView!
    
    var randomNumber = Int(arc4random_uniform(5))
    var breakfastItem = ["Avocado \nBoiled eggs \nOrange juice", "Fried Egg \nLow-sodium canned beans \nMilk", "Baked bread \nButter \nMilk", "Sausage \nEgg \nKiwi smoothy", "Fruit \nOat \nYoghourt"]
    var lunchItem = ["Beef wrap", "Salmon \nCucumber", "Tuna \nAvocado", "Turkey sandwich", "Grilled chicken \nRoast pineapple \nSandwich"]
    var dinnerItem = ["Potato spaghetti", "Organic beef hotdog \nBaked beans", "Veggie salad", "Chicken breast \nVegetable soup", "Pizza"]
    var exerciseItem = ["Swimming \nBuild muscle \nImprove balance \nHealthy heart and lungs", "Yoga \nIncrease flexibility \nReduce weight \nProtect from injury", "Running and jogging \nBuild strong bones \nBurn kilojoules \nStrengthen muscles", "Cycling \nImprove joint mobility \nDecrease stress levels \nDecrease body fat levels", "Gymnastics \nPrevent diseases \nIncrease self-esteem \nIncrease cognitive functioning \nStrong bones"]
    var imageItem = ["swimming", "yoga", "running", "cycling", "gym"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        currentDay.text = dateString
        breakfast.text = breakfastItem[randomNumber]
        lunch.text = lunchItem[randomNumber]
        dinner.text = dinnerItem[randomNumber]
        exerciseImage.image = UIImage(named: imageItem[randomNumber])
        exercise.text = exerciseItem[randomNumber]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String:AnyObject]) {
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            return // No image selected.
        }
        
        let photo = Photo(image: image, userGenerated: true)
        _ = PhotoShareContent(photos: [photo])
        
    }

    
    @IBAction func shareToFacebook(_ sender: Any) {
            let photo = Photo(image: UIImage(named: "CalenderDay.view")!, userGenerated: true)
            let content = PhotoShareContent(photos: [photo])
            shareToFacebook(content)
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


