//
//  ViewController.swift
//  monster
//
//  Created by Vatsalya Goel on 9/4/17.
//  Copyright © 2017 Vatsalya Goel. All rights reserved.
//

import UIKit

class ViewController: UITabBarController, UITabBarControllerDelegate {
    
    var dataController: DataController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        dataController = appDelegate.dataController
        dataController.initializeMonsters()
        self.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Initialize tab bar controller
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let navController = viewController as? UINavigationController{
            if let destinationVC = navController.childViewControllers.first as? CreateMonsterViewController{
                destinationVC.dataController = self.dataController
                self.tabBarController?.selectedIndex = 0
            } else if let destinationVC = navController.childViewControllers.first as? SearchMonsterViewController{
                destinationVC.managedObjectContext = self.dataController.persistentContainer.viewContext
                self.tabBarController?.selectedIndex = 1
            } else if let destinationVC = navController.childViewControllers.first as? MonsterViewController{
                destinationVC.monster = self.dataController.loadMonster(id: "Default")
                self.tabBarController?.selectedIndex = 2
            }
        }
    }
}

