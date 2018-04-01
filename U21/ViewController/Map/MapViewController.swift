//
//  MapViewController.swift
//  U21
//
//  Created by Kong on 3/31/2561 BE.
//  Copyright © 2561 u21. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleGoToMiniMenu() {
        let miniMenuVC = MiniMenuViewController()
        self.show(miniMenuVC, sender: self)
    }
  

}
