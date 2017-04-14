//
//  RecipeDetailViewCell.swift
//  MIs Recetas
//
//  Created by Jack Vr on 3/4/17.
//  Copyright © 2017 Eugenio Vorontsov. All rights reserved.
//

import UIKit

class RecipeDetailViewCell: UITableViewCell {

    @IBOutlet var keyLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
