//
//  ViewController.swift
//  tppersistence
//
//  Created by tp on 11/03/2019.
//  Copyright © 2019 projet. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {

    let leContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let ville = Ville(context: leContext)
        
        ville.nom = "Orléans"
        ville.population = 200000
        
        do{
            try
                leContext.save()
        }
            catch{
                print("probleme de sauvegarde")
            }
        
        let texte = "ans"
        let requete : NSFetchRequest<Ville> = Ville.fetchRequest()
        requete.predicate = NSPredicate( format: "nom CONTAINS %@", texte)
        
        requete.sortDescriptors = [NSSortDescriptor(key: "nom", ascending: true)]
        
        do {
            let resultat = try leContext.fetch(requete)
            print(resultat)
        }
        catch{
            print("probleme")
        }
    }


}
