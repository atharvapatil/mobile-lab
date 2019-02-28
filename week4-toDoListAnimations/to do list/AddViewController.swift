//
//  AddViewController.swift
//  to do list
//
//  Created by Atharva Patil on 27/02/2019.
//  Copyright © 2019 Atharva Patil. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    // Generator for haptic feedback.
    var feedbackGenerator: UIImpactFeedbackGenerator!
    
    let cancel = UIButton()
    let header = UILabel()
    let inputTask = UITextField()
    let infor = UILabel()
    let inputDescription = UITextField()
    let button = UIButton()
    
    func addUIElements(){
        
//        let cancel = UIButton()
        self.view.addSubview(cancel)
        cancel.backgroundColor = .purple
        cancel.setTitle("Cancel", for: .normal)
        cancel.setTitleColor(.purple, for: .normal)
        cancel.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        cancel.backgroundColor = UIColor.white
        
        cancel.translatesAutoresizingMaskIntoConstraints = false
        
        cancel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        cancel.topAnchor.constraint(equalTo: view.topAnchor, constant: 36).isActive = true
        
        cancel.addTarget(self, action: #selector(cancelPress(_ :)), for: .touchUpInside)
        
        
//        let header = UILabel()
        self.view.addSubview(header)
        
        header.textAlignment = .left
        header.text = "Header"
        header.font = UIFont(name: "Helvetica", size: 24)
        
        header.translatesAutoresizingMaskIntoConstraints = false
        
        header.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        header.topAnchor.constraint(equalTo: view.topAnchor, constant: 90).isActive = true
        
//        let inputTask = UITextField()
        self.view.addSubview(inputTask)
        
        inputTask.placeholder = "Enter Task"
        inputTask.borderStyle = UITextField.BorderStyle.roundedRect
        inputTask.font = UIFont(name: "Helvetica", size: 16)
        
        inputTask.translatesAutoresizingMaskIntoConstraints = false
        
        inputTask.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        inputTask.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        inputTask.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 8).isActive = true
        
//        let description = UILabel()
        self.view.addSubview(infor)
        
        infor.textAlignment = .left
        infor.text = "Description"
        infor.font = UIFont(name: "Helvetica", size: 24)
        
        infor.translatesAutoresizingMaskIntoConstraints = false
        
        infor.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        infor.topAnchor.constraint(equalTo: inputTask.bottomAnchor, constant: 36).isActive = true
        
//        let inputDescription = UITextField()
        self.view.addSubview(inputDescription)
        
        inputDescription.placeholder = "Enter Description"
        inputDescription.borderStyle = UITextField.BorderStyle.roundedRect
        inputDescription.font = UIFont(name: "Helvetica", size: 16)
        
        inputDescription.translatesAutoresizingMaskIntoConstraints = false
        
        inputDescription.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        inputDescription.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        inputDescription.topAnchor.constraint(equalTo: infor.bottomAnchor, constant: 8).isActive = true
        
//        let button = UIButton()
        self.view.addSubview(button)
        
        button.backgroundColor = .purple
        button.setTitle("Add to do", for: .normal)
        button.layer.cornerRadius = 24
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 18)
        
        button.addTarget(self, action: #selector(handlePress(_ :)), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        button.topAnchor.constraint(equalTo: inputDescription.bottomAnchor, constant: 90).isActive = true
        
    }
    
    // Callback method to be defined in parent view controller.
    var task: ((_ element: Element) -> ())?
    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addUIElements()
        
        
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        swipe.direction = UISwipeGestureRecognizer.Direction.down
        view.addGestureRecognizer(swipe)
        
    }
    
    @objc func swiped(){
        print("Screen Swiped")
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @objc func handlePress(_ sender: UIButton){
        print("button is tapped")
    
        let element = Element(header: inputTask.text!, description: inputDescription.text!)

        task?(element)

        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func cancelPress(_ sender: UIButton){
        print("cancel pressed")
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
