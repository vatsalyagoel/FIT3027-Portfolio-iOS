//
//  CreateMonsterViewController.swift
//  monster
//
//  Created by Vatsalya Goel on 10/4/17.
//  Copyright © 2017 Vatsalya Goel. All rights reserved.
//

import UIKit

class CreateMonsterViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var speciesTextField: UITextField!
    @IBOutlet var attackPowerTextField: UITextField!
    @IBOutlet var healthTextField: UITextField!
    
    @IBOutlet var summaryLabel: UILabel!
    @IBOutlet var feedbackLabel: UILabel!
    
    var monster: MonsterMO?
    var dataController: DataController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Create a monster"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save() {
        monster = dataController?.addMonster()
        guard let text = nameTextField.text, !text.isEmpty else {
            let alert = UIAlertController(title: "Error", message: "Name cannot be empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.cancel, handler: nil))
            self.present(alert, animated: true, completion: {return})
            return
        }
        monster?.name = nameTextField.text!
        monster?.age = Int32(ageTextField.text!) ?? 0
        monster?.species = speciesTextField.text!
        monster?.attackPower = Int32(attackPowerTextField.text!) ?? 0
        monster?.health = Int32(healthTextField.text!) ?? 0
        monster?.id = UUID().uuidString
        
        summaryLabel.text = monster?.description
        feedbackLabel.text = "New monster has been created"
        
        dataController?.saveContext()
    }
    
    @IBAction func update() {
        if (monster != nil)
        {
            guard let text = nameTextField.text, !text.isEmpty else {
                let alert = UIAlertController(title: "Error", message: "Name cannot be empty", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.cancel, handler: nil))
                self.present(alert, animated: true, completion: {return})
                return
            }
            monster?.name = nameTextField.text!
            monster?.age = Int32(ageTextField.text!) ?? 0
            monster?.species = speciesTextField.text!
            monster?.attackPower = Int32(attackPowerTextField.text!) ?? 0
            monster?.health = Int32(healthTextField.text!) ?? 0
            
            dataController?.saveContext()
            
            summaryLabel.text = ""
            feedbackLabel.text = "Monster has been updated"
        }
        else {
            self.save()
        }
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
