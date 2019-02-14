//
//  ViewController.swift
//  lockScreen
//
//  Created by Atharva Patil on 13/02/2019.
//  Copyright © 2019 Atharva Patil. All rights reserved.
//

import UIKit

var valOne: Int = 0
var valTwo: Int = 0
var valThree: Int = 0

class ViewController: UIViewController {
    
    // Initializing the constant variables
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var myPassHeader: UILabel!
    @IBOutlet weak var sysCodeHeader: UILabel!
    
    //Initializing non constant variables
    @IBOutlet weak var lockStatus: UILabel!
    @IBOutlet weak var passCodeSliderOne: UISlider!
    @IBOutlet weak var passCodeSliderTwo: UISlider!
    @IBOutlet weak var sysCodeSlider: UISlider!
    @IBOutlet weak var unlockButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lockStatus.text = "Enter Code"
//        unlockButton.setTitle("This",for: .normal)
    }
    
    @IBAction func passSlider1(_ sender: UISlider) {
        valOne = Int(passCodeSliderOne.value)
//        print(valOne)
        updateText()
    }
    
    @IBAction func passSlider2(_ sender: UISlider) {
        valTwo = Int(passCodeSliderTwo.value)
//        print(valTwo)
        updateText()
    }
    
    @IBAction func sysSlider(_ sender: UISlider) {
        valThree = Int(sysCodeSlider.value)
//        print(valThree)
        updateText()
    }
    
    @IBAction func unlockBtn(_ sender: UIButton) {
//        print(unlockButton)
        if(unlockButton.titleLabel?.text == "Unlock" && valOne == 9 && valTwo == 3 && valThree == 13){
            lockStatus.text = "Welcome Atharva"
            unlockButton.setTitle("Reset",for: .normal)
            profileImage.image = UIImage(named: "success.png")
        } else if(unlockButton.titleLabel?.text == "Unlock" && valOne != 9 && valTwo != 3 && valThree != 13){
            lockStatus.text = "Wrong combination"
            unlockButton.setTitle("Unlock",for: .normal)
            profileImage.image = UIImage(named: "error.png")
        } else if(unlockButton.titleLabel?.text == "Reset"){
            lockStatus.text = "Phone Locked"
            unlockButton.setTitle("Unlock",for: .normal)
            profileImage.image = UIImage(named: "user-image.png")
            passCodeSliderOne.setValue(5, animated: true)
            passCodeSliderTwo.setValue(11, animated: true)
            sysCodeSlider.setValue(0, animated: true)
        }
        
    }
    
    func updateText(){
        lockStatus.text = "\(valOne) - \(valTwo) - \(valThree)"
    }
    
    
    
}

