//
//  DetailViewController.swift
//  MIs Recetas
//
//  Created by Jack Vr on 31/3/17.
//  Copyright © 2017 Eugenio Vorontsov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var recipeImageView: UIImageView!
    @IBOutlet var tableMyView: UITableView!
    @IBOutlet var ratingButton: UIButton!
    
    var recipe : Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.recipeImageView.image = recipe.image
        self.title = recipe.name
        
        self.tableMyView.backgroundColor = #colorLiteral(red: 0.8221146846, green: 0.8221146846, blue: 0.8221146846, alpha: 0.8126605308)
        self.tableMyView.tableFooterView = UIView(frame: CGRect.zero)
        
        self.tableMyView.estimatedRowHeight = 44.0
        self.tableMyView.rowHeight = UITableViewAutomaticDimension
        
        // es para que se inicie la imagen del rating ya asignada ateriormente
        self.ratingButton.setImage(UIImage(named: self.recipe.rating), for: .normal)
        
    }

    override var prefersStatusBarHidden: Bool {
        get {
            return true
        }
    }
    
    @IBAction func close(Segue: UIStoryboardSegue) {
        
        if let reviewVC = Segue.source as? ReviewViewController {
            if let rating = reviewVC.rating {
                self.recipe.rating = rating
                self.ratingButton.setImage(UIImage(named: self.recipe.rating), for: .normal)
            }
        }
    
    }
    
}

extension DetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        var title: String = ""
        
        switch section {
        case 0:
            title = "Receta"
        case 1:
            title = "Ingredientes"
        case 2:
            title = "Pasos"
        default:
            break
        }
        
        return title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 2
        case 1:
            return self.recipe.ingridients.count
        case 2:
            return self.recipe.steps.count
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailRecipeCell", for: indexPath) as! RecipeDetailViewCell
        
//        cell.backgroundColor = UIColor.clear
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cell.keyLabel.text = "Nombre:"
                cell.valueLabel.text = self.recipe.name
                
            case 1:
                cell.keyLabel.text = "Tiempo:"
                cell.valueLabel.text = "\(self.recipe.time!) min."
                
            /*case 2:
                cell.keyLabel.text = "Favorita:"
                if self.recipe.isFavorite {
                    cell.valueLabel.text = "Si"
                } else {
                    cell.valueLabel.text = "No"
                }*/
            default:
                break
            }
        case 1:
            if indexPath.row == 0 {
                cell.keyLabel.text = "Ingredientes: "
            } else {
                cell.keyLabel.text = ""
            }
            cell.valueLabel.text = self.recipe.ingridients[indexPath.row]
        case 2:
            if indexPath.row == 0 {
                cell.keyLabel.text = "Pasos: "
            } else {
                cell.keyLabel.text = ""
            }
            cell.valueLabel.text = self.recipe.steps[indexPath.row]
        default:
            break
        }
        
        
        return cell
    }
}

extension DetailViewController: UITableViewDelegate {


}
