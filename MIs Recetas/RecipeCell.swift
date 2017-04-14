//
//  RecipeCell.swift
//  MIs Recetas
//
//  Created by Jack Vr on 27/3/17.
//  Copyright © 2017 Eugenio Vorontsov. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
    
    
    @IBOutlet var thumbView: UIImageView!
    @IBOutlet var recipeLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var ingredientLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
