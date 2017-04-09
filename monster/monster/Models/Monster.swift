//
//  Monster.swift
//  monster
//
//  Created by Vatsalya Goel on 9/4/17.
//  Copyright © 2017 Vatsalya Goel. All rights reserved.
//

import UIKit
import CoreData

extension MonsterMO {
    
    override public var description: String {
        return "Name: \(name!)\nAge: \(age)\nSpecies: \(species!)\nAttack Power: \(attackPower)\nhealth: \(health)"
    }
    
    func attackValue() -> Int {
        let randomNum:UInt32 = arc4random_uniform(100)
        return Int(attackPower + Int32(randomNum))
    }

}
