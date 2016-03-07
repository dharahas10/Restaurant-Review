//
//  CustomTableViewCell.swift
//  FoodPin
//
//  Created by Dharahas Tallapally on 20/10/15.
//  Copyright © 2015 Dharahas Tallapally. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var locationLabel : UILabel!
    @IBOutlet weak var typeLabel : UILabel!
    @IBOutlet weak var thumbnailInamgeView : UIImageView!
    @IBOutlet weak var favorIconImageView: UIImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}