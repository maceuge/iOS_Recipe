//
//  SingleViewController.swift
//  MIs Recetas
//
//  Created by Jack Vr on 26/3/17.
//  Copyright © 2017 Eugenio Vorontsov. All rights reserved.
//

import UIKit

class SingleViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var recipes : [Recipe] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        /*self.tableView.delegate = self*/
        
        var recipe = Recipe(name: "Tortilla de Patatas",
                            image: #imageLiteral(resourceName: "tortilla"),
                            time: 20,
                            ingr: ["Patatas", "Huevo", "Cebolla", "Queso", "Sal"],
                            steps: ["Pelar los elementos", "Sofreir las patatas y cebollas", "Meterlo en la oya"])
        recipes.append(recipe)
        
        recipe = Recipe(name : "Pizza Margarita",
                        image : #imageLiteral(resourceName: "pizza"),
                        time: 120,
                        ingr: ["Patatas", "Huevo", "Cebolla", "Queso", "Sal"],
                        steps: ["Pelar los elementos", "Sofreir las patatas y cebollas", "Meterlo en la oya"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Hamburguesa con Queso",
                        image : #imageLiteral(resourceName: "hamburgesa"),
                        time: 30,
                        ingr: ["Patatas", "Huevo", "Cebolla", "Queso", "Sal"],
                        steps: ["Pelar los elementos", "Sofreir las patatas y cebollas", "Meterlo en la oya"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Ensalada Cesar",
                        image : #imageLiteral(resourceName: "ensalada"),
                        time: 15,
                        ingr: ["Patatas", "Huevo", "Cebolla", "Queso", "Sal"],
                        steps: ["Pelar los elementos", "Sofreir las patatas y cebollas", "Meterlo en la oya"])
        recipes.append(recipe)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension SingleViewController : UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellID = "RecipeCell"
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = recipe.name
        cell.imageView?.image = recipe.image
        
        return cell
    }

}
