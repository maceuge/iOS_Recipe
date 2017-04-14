//
//  ViewController.swift
//  MIs Recetas
//
//  Created by Jack Vr on 24/3/17.
//  Copyright © 2017 Eugenio Vorontsov. All rights reserved.
//

import UIKit
//import Foundation

class ViewController: UITableViewController {

    var recipes : [Recipe] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.hidesBarsOnSwipe = true
        
        
        var recipe = Recipe(name: "Tortilla de Patatas",
                            image: #imageLiteral(resourceName: "tortilla"),
                            time: 20,
                            ingr: ["Patatas", "Huevo", "Cebolla", "Queso", "Sal"],
                            steps: ["Pelar los elementos", "Sofreir las patatas y cebollas", "Meterlo en la olla"])
        recipes.append(recipe)
        
        recipe = Recipe(name : "Pizza Margarita",
                        image : #imageLiteral(resourceName: "pizza"),
                        time: 120,
                        ingr: ["Harina", "Huevo", "Cebolla", "Pure de Tomate", "Sal", "Mozzarela", "Albaca"],
                        steps: ["Amasar la masa", "Meter huevo", "Hacer la salsa", "Poner cebolla en la salsa", "Condimentar la salsa", "Meter la masa en el horno", "Luego volcar la salsa"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Hamburguesa con Queso",
                        image : #imageLiteral(resourceName: "hamburgesa"),
                        time: 30,
                        ingr: ["Pan de Paty", "Hamburgeja", "Cebolla", "Lechuga", "Tomate", "Beacon", "Queso Chedar"],
                        steps: ["Cocinar el Paty en la parilla", "Picar Lechuga", "Cortar en rodajas la cebolla y el tomate", "Abrir el pan de paty y poner todo ahi"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Ensalada Cesar",
                        image : #imageLiteral(resourceName: "ensalada"),
                        time: 15,
                        ingr: ["Lechuga", "Tomatitos Cherry", "Cubitos de Pan", "Huevo", "Cebolla", "Queso", "Sal"],
                        steps: ["Pelar los elementos", "Sofreir las patatas y cebollas", "Meterlo en la oya"])
        recipes.append(recipe)
        
        recipe = Recipe(name : "Paeshaa",
                        image : #imageLiteral(resourceName: "pizza"),
                        time: 120,
                        ingr: ["Patatas", "Huevo", "Cebolla", "Queso", "Sal"],
                        steps: ["Pelar los elementos", "Sofreir las patatas y cebollas", "Meterlo en la oya"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Asado Argento",
                        image : #imageLiteral(resourceName: "hamburgesa"),
                        time: 30,
                        ingr: ["Asado", "Vacio", "Bondiola", "Bife de Chorizo", "Chorizo", "Pollo"],
                        steps: ["Tirar todo en la parilla y esperar que se cocine", "Comer con mucho estilo", "Metele al tinto tambien"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Pollo a la Crema",
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
    
    override var prefersStatusBarHidden: Bool {
        get {
            return true
        }
    }
    

    // Metodos de UITableDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellID = "RecipeCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RecipeCell
            cell.thumbView.image = recipe.image
            cell.thumbView.layer.cornerRadius = 13.75 // 39.75 redondo
            cell.thumbView.clipsToBounds = true
        
            cell.recipeLabel.text = recipe.name
            cell.timeLabel.text = "\(recipe.time!) min."
            cell.ingredientLabel.text = "Cant. de Ingredientes: \(recipe.ingridients.count)"
        
        /*if recipe.isFavorite {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }*/
        
        return cell
    }
    
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        
//        if editingStyle == .delete {
//            self.recipes.remove(at: indexPath.row)
//        }
//        
//        self.tableView.deleteRows(at: [indexPath], with: .fade)
//        
//    }
    
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        // Compartir
        let shareAction = UITableViewRowAction (style: .normal, title: "Share") { (action, indexPath) in
            
            let shareDefaultText = "Estoy mirando la receta de \(self.recipes[indexPath.row].name!) en mi primera iOS App 10"
            
            let activityController = UIActivityViewController(activityItems: [shareDefaultText, self.recipes[indexPath.row].image], applicationActivities: nil)
            
            self.present(activityController, animated: true, completion: nil)
        }
        
        shareAction.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        //Borrar
        
        let deleteAction = UITableViewRowAction (style: .destructive, title: "Delete") { (action, indexPath) in
            
            self.recipes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
        
        
        
        return [shareAction, deleteAction]
        
    }
    
    
    // Metodos de UITableDelegate
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        // Funcion para poner favorito los platos en forma de Alerta
        
        /*let recipe = self.recipes[indexPath.row]
        
        let alertController = UIAlertController (title: recipe.name, message: "Valora este plato", preferredStyle: .alert)
        let cancelAction = UIAlertAction (title: "Cancelar", style: .cancel, handler: nil)
        
        var favoriteActionTitle = "Favorito"
        var favoriteActionStyle = UIAlertActionStyle.default
        
        if recipe.isFavorite {
            favoriteActionTitle = "No Favorita"
            favoriteActionStyle = UIAlertActionStyle.destructive
        }
        
        let favoriteAction = UIAlertAction (title: favoriteActionTitle, style: favoriteActionStyle) { (action) in
            
            let recipe = self.recipes[indexPath.row]
            recipe.isFavorite = !recipe.isFavorite
            self.tableView.reloadData()
        }
        
        alertController.addAction(favoriteAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)*/
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipeDetail" {
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
              
                let selectRecipe = self.recipes[indexPath.row]
                let destViewController = segue.destination as! DetailViewController
                    destViewController.recipe = selectRecipe
            }
        }
    }
    
    
    
    
    

}

