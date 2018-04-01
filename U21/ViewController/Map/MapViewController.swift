//
//  MapViewController.swift
//  U21
//
//  Created by Kong on 3/31/2561 BE.
//  Copyright © 2561 u21. All rights reserved.
//

import UIKit
import Firebase

class MapViewController: UIViewController {

    @IBOutlet weak var score: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let uidd = Auth.auth().currentUser?.uid else { return }
        Database.database().reference().child("Users").child(uidd).child("score").observe(.value) { (snapshot) in
            print(snapshot.value)
            let scorePoint = snapshot.value as! Int
            self.score.text = "\(scorePoint)"
        }
    }

    
    @IBAction func handleGoToMiniMenu() {
        let miniMenuVC = MiniMenuViewController()
        self.show(miniMenuVC, sender: self)
    }
    
    @IBAction func handleGoTOBoard() {
        let ldVC = LeaderBoardViewController()
        self.show(ldVC, sender: self)
    }
  

}
