//
//  SearchMonsterViewController.swift
//  monster
//
//  Created by Vatsalya Goel on 10/4/17.
//  Copyright © 2017 Vatsalya Goel. All rights reserved.
//

import UIKit
import CoreData

class SearchMonsterViewController: UITableViewController, NSFetchedResultsControllerDelegate, UISearchBarDelegate {
    
    var managedObjectContext: NSManagedObjectContext!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var fetchedResultsController: NSFetchedResultsController<MonsterMO>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Search Monsters"
        
        searchBar.delegate = self
        self.filter(searchText: "")
        // Do any additional setup after loading the view.
    }

    func filter(searchText: String) {
        fetchedResultsController = nil
        let monsterFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Monster")
        let primarySortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        let secondarySortDescriptor = NSSortDescriptor(key: "species", ascending: true)
        monsterFetchRequest.sortDescriptors = [primarySortDescriptor, secondarySortDescriptor]
        monsterFetchRequest.predicate =  searchText.characters.count > 0 ? NSPredicate(format:"name contains[cd] %@ AND id != 'Default'", searchText) : NSPredicate(format:"id != 'Default'")
        fetchedResultsController = NSFetchedResultsController(
            fetchRequest: monsterFetchRequest as! NSFetchRequest<MonsterMO>,
            managedObjectContext: self.managedObjectContext,
            sectionNameKeyPath: nil,
            cacheName: nil)
        
        fetchedResultsController?.delegate = self
        
        try! fetchedResultsController?.performFetch()
        
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: TableView Data Source
    override func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = fetchedResultsController?.sections {
            return sections.count
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = fetchedResultsController?.sections {
            let currentSection = sections[section]
            return currentSection.numberOfObjects
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MonsterCell", for: indexPath as IndexPath)
        let monster = fetchedResultsController?.object(at: indexPath as IndexPath)
        
        cell.textLabel?.text = monster?.name
        cell.detailTextLabel?.text = monster?.species
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let sections = fetchedResultsController?.sections {
            let currentSection = sections[section]
            return currentSection.name
        }
        
        return nil
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell {
            let indexPath = tableView.indexPath(for: cell)!
            let monster = fetchedResultsController?.object(at: indexPath)
            if segue.identifier == "showDetailSegue" {
                let vc = segue.destination as! MonsterViewController
                vc.monster = monster
            }
        }
    }
    
    // MARK: UISearchBarDelegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filter(searchText: searchText)
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
