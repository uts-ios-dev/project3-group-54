//
//  CustomerTableViewCell.swift
//  HealthCare
//
//  Created by Alex on 2018/5/28.
//  Copyright © 2018年 Alex. All rights reserved.
//

import UIKit

class CustomerTableViewCell: UITableViewCell {

    @IBOutlet weak var foodButton: UIButton!
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
    @IBAction func foodDetail(_ sender: Any) {
       
        print("222");
        //if foodLabel.text == "breakfast"{
            
        //}
    }
    
}
