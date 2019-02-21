//
//  MyViewController.swift
//  to do list
//
//  Created by Atharva Patil on 20/02/2019.
//  Copyright © 2019 Atharva Patil. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    
    // Declaring callback buttons
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var addToDoButton: UIButton!
    
    // Declaring static variables
    @IBOutlet weak var headerTitleStatic: UILabel!
    @IBOutlet weak var descriptionTitleStatic: UILabel!
    
    // Declaring Text fields
    @IBOutlet weak var inputTaskField: UITextField!
    @IBOutlet weak var inputDescriptionField: UITextField!
    
    // Callback method to be defined in parent view controller.
    var task: ((_ element: Element) -> ())?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addToDoButton.layer.cornerRadius = 22
        addToDoButton.backgroundColor = .purple
        
        cancelButton.titleLabel?.textColor = .purple

        // Do any additional setup after loading the view.
    }
    
    @IBAction func handleCancelButton(_ sender: UIButton) {
        print("Cancel was pressed")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func handleAddButton(_ sender: UIButton) {
        
        print("Add was pressed")
        let element = Element(header: inputTaskField.text!, description: inputDescriptionField.text!)
        
        task?(element)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        // Dismisses keyboard when done is pressed.
//        view.endEditing(true)
//        return false
//    }
//
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
