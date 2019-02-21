//
//  MyTableViewController.swift
//  to do list
//
//  Created by Atharva Patil on 20/02/2019.
//  Copyright © 2019 Atharva Patil. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ToDoItem"

private let elementArrayKey = "ELEMENT_ARRAY_KEY"

struct Element: Codable {
    var header: String
    var description: String
}

class MyTableViewController: UITableViewController {
    
    var toDo = [Element]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaultTask = Element(header: "Mobile Lab Assignment", description: "Build something with tables")
        
        toDo.append(defaultTask)

        // Get Data from user defaults and set data array.
        if let data = UserDefaults.standard.value(forKey: elementArrayKey) as? Data {
            
            let toDo = try? PropertyListDecoder().decode(Array<Element>.self, from: data)
            
            self.toDo = toDo!
            
            self.tableView.reloadData()
        }
    }
    
    
    @IBAction func addPressed(_ sender: UIBarButtonItem) {
        
        print("Add new was pressed")
        
        // Instantiate View Controller
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let vc = storyboard.instantiateViewController(withIdentifier: "MyViewController") as? MyViewController else {
            print("Error instantiating MyViewController" )
            return
        }
        
        // Define callback method.
        vc.task = { [weak self] element in
            
            print(">>>> in task callback")
            
            self?.toDo.append(element)
            
            
            
            // Resave element array into User defaults.
            UserDefaults.standard.set(try? PropertyListEncoder().encode(self?.toDo), forKey: elementArrayKey)
            
            self?.tableView.reloadData()
        }
        
        // Present view controller.
        present(vc, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(toDo.count)
        return toDo.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MyTableViewCell

        // Configure the cell...
        
         let element = toDo[indexPath.row]
        
        cell.headerLabel.text = element.header
        cell.descriptionLabel.text = element.description
        
        print(toDo.count)
        print("This happened")
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("going into segue")
        
        if let vc = segue.destination as? MyViewController {
            // Define callback method.
            vc.task = { [weak self] element in
                
                print(">>>> in task callback")
                
                self?.toDo.append(element)
                
                
                
                // Resave element array into User defaults.
                UserDefaults.standard.set(try? PropertyListEncoder().encode(self?.toDo), forKey: elementArrayKey)
                
                self?.tableView.reloadData()
            }
        }
    }
    */
 
}
