//
//  Lunch.swift
//  HealthCare
//
//  Created by Alex on 2018/5/29.
//  Copyright © 2018年 Alex. All rights reserved.
//

import UIKit
import FirebaseDatabase

class FoodDetail: UIViewController {


    @IBOutlet weak var foodOneImage: UIImageView!
    
    @IBOutlet weak var foodTwoImage: UIImageView!
    
    @IBOutlet weak var foodThreeImage: UIImageView!
    
    @IBOutlet weak var foodFourImage: UIImageView!
    
    @IBOutlet weak var foodFiveImage: UIImageView!
    
    @IBOutlet weak var foodOneName: UILabel!
    
    @IBOutlet weak var foodTwoName: UILabel!
    
    @IBOutlet weak var foodThreeName: UILabel!
    
    @IBOutlet weak var foodFourName: UILabel!
    
    @IBOutlet weak var foodFiveName: UILabel!
    
    @IBOutlet weak var foodOneText: UITextView!
    
    @IBOutlet weak var foodTwoText: UITextView!
    
    @IBOutlet weak var foodThreeText: UITextView!
    
    @IBOutlet weak var foodFourText: UITextView!
    
    @IBOutlet weak var foodFiveText: UITextView!
    
    @IBOutlet weak var foodOneTag: UIImageView!
    
    @IBOutlet weak var foodTwoTag: UIImageView!
    
    @IBOutlet weak var foodThreeTag: UIImageView!
    
    @IBOutlet weak var foodFourTag: UIImageView!
    
    @IBOutlet weak var foodFiveTag: UIImageView!
    
    @IBOutlet weak var lbl1: UILabel!
    
    var ref: DatabaseReference?
    var databaseHandle: DatabaseHandle?
    var dataRetrived = [String]()
    var mealInt = 0
    var postData = ["breakfast", "lunch", "dinner", "afternoonTea", "nightSnack"]

    override func viewDidLoad() {
        super.viewDidLoad()
        print(mealInt)
        lbl1.text = postData[mealInt]
        // Do any additional setup after loading the view.
        
        // load data as {0,1,2,3..}
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData()
    {
        switch mealInt {
        case 0:
            
            //Set data for breakfast item 1
            foodOneName.text = "Avocado&Egg"
            foodOneImage.image = UIImage(named: "breakfastItem1")
            foodOneTag.image = UIImage(named: "loseWeightTag")
            foodOneText.text = "2 100% percent whole-wheat English muffins \n2 teaspons whole-grain mustard \n1 small avocado \nfresh dill \n2 boiled eggs \n308 calories"
            
            //Set data for breakfast item 2
            foodTwoName.text = "Egg&Beans"
            foodTwoImage.image = UIImage(named: "breakfastitem2")
            foodTwoTag.image = UIImage(named: "loseWeightTag")
            foodTwoText.text = "4 eggs \nkosher salt and black pepper \n3 teaspoons olive oil \n1/2 cup grape tomatoes \n1/2 cup low-sodium canned white beans \n4 slices whole-wheat bread \n1/4 cup store-bought pesto \n56 calories"
            
            //Set data for breakfast item 3
            foodThreeName.text = "Sausage&Egg"
            foodThreeImage.image = UIImage(named: "breakfastItem3")
            foodThreeTag.image = UIImage(named: "increaseWeightTag")
            foodThreeText.text = "2 fried sausages \n2 half-fried eggs \n2 teaspoons of beans \n3 pieces of bread \n566 calories"
            
            //Set data for breakfast item 4
            foodFourName.text = "Bread Combo"
            foodFourImage.image = UIImage(named: "breakfastItem4")
            foodFourTag.image = UIImage(named: "increaseWeightTag")
            foodFourText.text = "Best set for bread lovers with energy"
            
            //Set data for breakfast item 5
            foodFiveName.text = "Fruit&Oat"
            foodFiveImage.image = UIImage(named: "breakfastItem5")
            foodFiveTag.image = UIImage(named: "loseWeightTag")
            foodFiveText.text = "1/2 cup oat \n2 fruit \n26 calories"
            
            break
            
            
        case 1:
         
            //Set data for lunch item 1
            foodOneName.text = "Beef Wrap"
            foodOneImage.image = UIImage(named: "lunchItem1")
            foodOneTag.image = UIImage(named: "loseWeightTag")
            foodOneText.text = "2 Tbsp 2% plain Greek yogurt \n1 Tbsp horseradish sauce \n2 leaves Bibb lettuce \n4 slices lean deli-style roast beef \n4 slices tomato \n1 cup fresh raspberries \n300 calories"
            
            //Set data for lunch item 2
            foodTwoName.text = "Salmon Boats"
            foodTwoImage.image = UIImage(named: "lunchItem2")
            foodTwoTag.image = UIImage(named: "loseWeightTag")
            foodTwoText.text = "3 oz canned pink salmon, drained \n1 Tbsp capers \n1 tsp yellow mustard \n2 Tbsp plain low-fat yogurt \nDash salt \nDash pepper \n1 cucumber \n431 calories"
            
            //Set data for lunch item 3
            foodThreeName.text = "Tuna-Avocado"
            foodThreeImage.image = UIImage(named: "lunchItem3")
            foodThreeTag.image = UIImage(named: "loseWeightTag")
            foodThreeText.text = "1/3 avocado, mashed \n1/2 Tbsp lemon juice \n4 oz white albacore tuna, drained \n1 thick slice tomato \n1 piece butter lettuce \n1 slice red onion \n1 slice whole-grain bread \n350 calories"
            
            //Set data for lunch item 4
            foodFourName.text = "Turkey Sandwich"
            foodFourImage.image = UIImage(named: "lunchItem4")
            foodFourTag.image = UIImage(named: "loseWeightTag")
            foodFourText.text = "1 slice whole-grain bread \n3 oz sliced turkey breast \n1/4 cup baby spinach \n1/4 cup sun-dried tomatoes \n1 Tbsp feta \nSide Salad \n12 yellow or red cherry tomatoes, halved \n1/4 cup chopped cucumber \n4 large black olives, chopped \n1 Tbsp chopped scallion \n1/2 Tbsp olive oil \n1/2 tsp fresh lemon juice \n1 tsp fresh mint \n367 calories"
            
            //Set data for lunch item 5
            foodFiveName.text = "Grilled Chicken Burger"
            foodFiveImage.image = UIImage(named: "lunchItem5")
            foodFiveTag.image = UIImage(named: "loseWeightTag")
            foodFiveText.text = "1 boneless, skinless chicken breast \n1 Tbsp Teriyaki sauce \n1 slice Swiss cheese \n1 slice pineapple \n1 whole-wheat kaiser roll \nRed onion, thinly sliced (to taste) \nPickled jalapeno slices (to taste) \n387 calories"
            
            break
        
            
        case 2:
            
            //Set data for dinner item 1
            foodOneName.text = "Spaghetti"
            foodOneImage.image = UIImage(named: "dinnerItem1")
            foodOneTag.image = UIImage(named: "loseWeightTag")
            foodOneText.text = "1 cup sliced bell pepper \n1/2 cup sliced red onion \n1 tsp olive oil \n1 cup cooked whole-wheat spaghetti \n2/3 cup cooked edamame \n420 calories"
            
            //Set data for dinner item 2
            foodTwoName.text = "Hot Dog"
            foodTwoImage.image = UIImage(named: "dinnerItem2")
            foodTwoTag.image = UIImage(named: "loseWeightTag")
            foodTwoText.text = "1 organic beef hot dog \n1/2 cup organic baked beans \n1 whole-wheat hot dog bun \n1/2 Tbsp whole-grain mustard \n1/2 Tbsp sweet relish \n1 cup sliced honeydew melon \n490 calories"
            
            //Set data for dinner item 3
            foodThreeName.text = "Veggie Salad"
            foodThreeImage.image = UIImage(named: "dinnerItem3")
            foodThreeTag.image = UIImage(named: "loseWeightTag")
            foodThreeText.text = "2 Tbsp dry red quinoa \n2 cups mesclun greens \n3 oz cooked lean beef, cubed \n1/2 cup chopped broccoli florets \n1/4 red bell pepper, chopped \n2 tsp olive oil \n1 tsp red wine vinegar \n320 calories"
            
            //Set data for dinner item 4
            foodFourName.text = "Soup"
            foodFourImage.image = UIImage(named: "dinnerItem4")
            foodFourTag.image = UIImage(named: "loseWeightTag")
            foodFourText.text = "4 oz boneless, skinless chicken breast \n1 cup Amy's Organic Chunky Vegetable soup \n2 Tbsp dry quinoa \n1 cup chopped kale \n10 small asparagus spears \n2 tsp soy sauce \n1/8 tsp grated fresh ginger \n330 calories"
            
            //Set data for dinner item 5
            foodFiveName.text = "Pizza"
            foodFiveImage.image = UIImage(named: "dinnerItem5")
            foodFiveTag.image = UIImage(named: "loseWeightTag")
            foodFiveText.text = "1 Amy's Light 'N Lean Italian Vegetable Pizza \n3 oz broccoli slaw \n1/4 cup black beans \n1/4 cup sliced scallions \n1 tsp olive oil \n1 oz lemon juice \n400 calories"
            
            break
     
            
        case 3:
            
            //Set data for afternoon tea item 1
            foodOneName.text = "Fruit Sushi"
            foodOneImage.image = UIImage(named: "afternoonTeaItem1")
            foodOneTag.image = UIImage(named: "loseWeightTag")
            foodOneText.text = "3 Kellogg's LCMs bars \n1/2 slice pineapple \n4 fresh strawberries (sliced) \n1 kiwifruit (peeled, sliced) \n1 Uncle Toby's ROLL-UPS Rainbow Berry \n90 calories"
            
            //Set data for afternoon tea item 2
            foodTwoName.text = "Corn"
            foodTwoImage.image = UIImage(named: "afternoonTeaItem2")
            foodTwoTag.image = UIImage(named: "loseWeightTag")
            foodTwoText.text = "corns \n20 calories"
            
            //Set data for afternoon tea item 3
            foodThreeName.text = "Fruit Smoothies"
            foodThreeImage.image = UIImage(named: "afternoonTeaItem3")
            foodThreeTag.image = UIImage(named: "loseWeightTag")
            foodThreeText.text = "any fruit you like \n26 calories"
            
            //Set data for afternoon tea item 4 and item 5
            foodFourName.text = ""
            foodFourText.text = ""
            foodFiveName.text = ""
            foodFiveText.text = ""
            break
            
        case 4:
            //Set night snack items
            foodOneName.text = "TRY"
            foodOneText.text = "NOT"
            foodOneImage.image = UIImage(named: "nightSnackItem1")
            
            foodTwoName.text = "TO"
            foodTwoText.text = "EAT"
            foodTwoImage.image = UIImage(named: "nightSnackItem2")
            
            foodThreeName.text = "AT"
            foodThreeText.text = "LATE NIGHT"
            foodThreeImage.image = UIImage(named: "nightSnackItem3")
            
            foodFourName.text = "BAD"
            foodFourText.text = "FOR"
            foodFourImage.image = UIImage(named: "nightSnackItem4")
            
            foodFiveName.text = "YOUR"
            foodFiveText.text = "HEALTH"
            foodFiveImage.image = UIImage(named: "nightSnackItem5")
            
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
