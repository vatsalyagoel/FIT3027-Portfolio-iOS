//
//  DataController.swift
//  monster
//
//  Created by Vatsalya Goel on 10/4/17.
//  Copyright © 2017 Vatsalya Goel. All rights reserved.
//

import UIKit
import CoreData

class DataController: NSObject {
    
    var persistentContainer: NSPersistentContainer!

    init(modelName: String) {
        persistentContainer = NSPersistentContainer(name: modelName)
        persistentContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
    func addMonster() -> MonsterMO {
        let context = persistentContainer.viewContext
        
        let monster = NSEntityDescription.insertNewObject(forEntityName: "Monster", into: context) as? MonsterMO
        
        return monster!
    }
    
    func loadMonster(id: String) -> MonsterMO? {
        let context = persistentContainer.viewContext
        let monstersFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Monster")
        monstersFetch.predicate = NSPredicate(format: "id == %@", id)
        do {
            let fetchedMonsters = try context.fetch(monstersFetch) as! [MonsterMO]
            
            if(fetchedMonsters.count > 0) {
                return fetchedMonsters[0]
            } else {
                return nil
            }
            
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }
    }
    
    func initializeMonsters() {
        let context = persistentContainer.viewContext
        let monstersFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Monster")
        monstersFetch.predicate = NSPredicate(format: "id == 'Default'")
        do {
            let fetchedMonsters = try context.fetch(monstersFetch) as! [MonsterMO]
            
            if(fetchedMonsters.count == 0) {
                let monster = self.addMonster()
                monster.id = "Default"
                monster.name = "Default Monster"
                monster.species = "Human"
                self.saveContext()
            }
            
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }
    }
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
