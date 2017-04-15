//
//  Recipe.swift
//  MIs Recetas
//
//  Created by Jack Vr on 24/3/17.
//  Copyright © 2017 Eugenio Vorontsov. All rights reserved.
//

import Foundation
import UIKit

class Recipe: NSObject {
    
    var name : String!
    var image : UIImage!
    var time : Int!
    var ingridients : [String]!
    var steps : [String]!
//    var isFavorite: Bool = false
    
    var rating: String = "cool"
    
    
    init(name : String, image : UIImage, time : Int, ingr: [String], steps: [String]) {
        self.name = name
        self.image = image
        self.time = time
        self.ingridients = ingr
        self.steps = steps
    }
    
    
}
