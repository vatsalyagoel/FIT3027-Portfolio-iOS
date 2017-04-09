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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = monster.name
        
        nameLabel.text = monster.name
        ageLabel.text = String(monster.age)
        speciesLabel.text = monster.species
        attackPowerLabel.text = String(monster.attackPower)
        healthLabel.text = String(monster.health)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
