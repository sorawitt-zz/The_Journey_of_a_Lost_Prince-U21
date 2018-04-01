//
//  PinGameViewController.swift
//  U21
//
//  Created by Kong on 4/1/2561 BE.
//  Copyright © 2561 u21. All rights reserved.
//

import UIKit
import Firebase

class PinGameViewController: UIViewController {

    
    @IBOutlet weak var pinLabel: UILabel!
    @IBOutlet weak var getPinBtn: UIButton!
    @IBOutlet weak var pinTextField: UITextField!
    @IBOutlet weak var statusText: UILabel!
    @IBOutlet weak var startGameBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    
    var pin = ""
    @IBAction func getPin() {
        let pin = generatePIN()
        self.pin = pin
        guard let uuidUser = Auth.auth().currentUser?.uid else { return }
        let pinRef = Database.database().reference(withPath: "QUIZ").child(pin)
        pinRef.setValue(["pinID": pin, "member": [uuidUser: true], "status": false])
        pinLabel.text = "PIN: \(pin)"
        
    }
    
    @IBAction func accessPIN() {
        guard let pinn = pinTextField.text else { return }
        let refPIN = Database.database().reference(withPath: "QUIZ").child(pinn)
        refPIN.observeSingleEvent(of: .value) { (snapshot) in
            snapshot.exists()
            if snapshot.exists() {
                self.statusText.text = "Status : พร้อมเล่น"
                self.nextView()
            }else {
                self.statusText.text = "Status : type PIN again!, please"
            }
        }
    }
    
    func nextView() {
        Database.database().reference(withPath: "QUIZ").child(pin).child("status").observe(.value) { (snapshot) in
                print(snapshot.value)
            guard let statusValue = snapshot.value as? Int else { return }
            print(statusValue)
            if statusValue == 1 {
                self.startGame()
            }else {
                
            }
            
        }
    }

    func generatePIN() -> String {
        let len = 4
        let pswdChars = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890")
        let rndPswd = String((0..<len).map{ _ in pswdChars[Int(arc4random_uniform(UInt32(pswdChars.count)))]})
        return rndPswd
    }
    
    @IBAction func startGame() {
        let quizVC = QuizViewController()
        let pinRef = Database.database().reference(withPath: "QUIZ").child(pin)
        pinRef.updateChildValues(["status": true])
         self.show(quizVC, sender: self)
    }

}
