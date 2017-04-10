//
//  MonsterViewController.swift
//  monster
//
//  Created by Vatsalya Goel on 10/4/17.
//  Copyright © 2017 Vatsalya Goel. All rights reserved.
//

import UIKit

class MonsterViewController: UIViewController {
    
    var monster: MonsterMO!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var speciesLabel: UILabel!
    @IBOutlet var attackPowerLabel: UILabel!
    @IBOutlet var healthLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameLabel.text = monster.name
        ageLabel.text = String(monster.age)
        speciesLabel.text = monster.species
        attackPowerLabel.text = String(monster.attackPower)
        healthLabel.text = String(monster.health)
        self.navigationItem.title = monster.name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "updateMonsterSegue" {
            let vc = segue.destination as! CreateMonsterViewController
            vc.monster = self.monster
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            vc.dataController = appDelegate.dataController
        }
    }

}
