//
//  FoodTableViewCell.swift
//  EggTimer
//
//  Created by Ririka on 2018/04/26.
//  Copyright © 2018年 litech. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {
    
    @IBOutlet var foodlabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
