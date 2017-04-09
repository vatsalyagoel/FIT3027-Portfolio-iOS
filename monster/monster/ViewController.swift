//
//  ViewController.swift
//  monster
//
//  Created by Vatsalya Goel on 9/4/17.
//  Copyright © 2017 Vatsalya Goel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dataController: DataController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        dataController = appDelegate.dataController
        dataController.initializeMonsters()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "createMonsterSegue") {
            if let destinationVC = segue.destination as? CreateMonsterViewController {
                destinationVC.dataController = self.dataController
            }
        }
        if(segue.identifier == "searchMonstersSegue") {
            if let destinationVC = segue.destination as? SearchMonsterViewController {
                destinationVC.managedObjectContext = self.dataController.persistentContainer.viewContext
            }
        }
        if(segue.identifier == "viewMonsterSegue") {
            if let destinationVC = segue.destination as? MonsterViewController {
                destinationVC.monster = self.dataController.loadMonster(id: "Default")
            }
        }
    }
    
}

