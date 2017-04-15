//
//  ReviewViewController.swift
//  MIs Recetas
//
//  Created by Jack Vr on 9/4/17.
//  Copyright © 2017 Eugenio Vorontsov. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var ratingStackView: UIStackView!
    
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var thirdButton: UIButton!
    
    
    var rating: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blurEfect = UIBlurEffect(style: .regular)
        let blurEfectView = UIVisualEffectView(effect: blurEfect)
            blurEfectView.frame = view.bounds
        backgroundImageView.addSubview(blurEfectView)
        
        let scale = CGAffineTransform(scaleX: 0.0, y: 0.0)
        let translation = CGAffineTransform(translationX: 0.0, y: 500.0)
        
//        ratingStackView.transform = scale.concatenating(translation) // concatena scale con translacion
        
        firstButton.transform = scale.concatenating(translation)
        secondButton.transform = scale.concatenating(translation)
        thirdButton.transform = scale.concatenating(translation)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
//            self.ratingStackView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//        }, completion: nil)
        
//        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.5, options: [], animations: {
//            self.ratingStackView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//        }, completion: nil)
        
        // una de las mejores formas para animar los botones sin tener que tocar el delay
        
        UIView.animate(withDuration: 0.2, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.5, options: [], animations: {
            self.firstButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: { (success) in
            UIView.animate(withDuration: 0.2, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.5, options: [], animations: {
                self.secondButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: { (success) in
                UIView.animate(withDuration: 0.2, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.5, options: [], animations: {
                    self.thirdButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                }, completion: nil)
            })
        })

        // otra forma de amimar los botones por separado
        
//        UIView.animate(withDuration: 0.6, delay: 0.4, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.5, options: [], animations: {
//            self.secondButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//        }, completion: nil)
//        
//        UIView.animate(withDuration: 0.6, delay: 0.8, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.5, options: [], animations: {
//            self.thirdButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//        }, completion: nil)
    
    }
    
    override var prefersStatusBarHidden: Bool {
        get {
            return true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func ratingPressed(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            rating = "dislike"
        case 2:
            rating = "good"
        case 3:
            rating = "great"
        default:
            break
        }
        
        performSegue(withIdentifier: "unwindToDetailView", sender: sender)
        
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
