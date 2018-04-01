//
//  LeaderBoardViewController.swift
//  U21
//
//  Created by Kong on 4/1/2561 BE.
//  Copyright © 2561 u21. All rights reserved.
//

import UIKit
import Kingfisher
import Firebase

class LeaderBoardViewController: UIViewController {

    @IBOutlet weak var leaderBoard: UITableView!
    var scoreData: [UserModel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nibCell = UINib(nibName: "LeaderBoardTableViewCell", bundle: nil)
        leaderBoard.register(nibCell, forCellReuseIdentifier: "LeaderBoardTableViewCell")
        leaderBoard.delegate = self
        leaderBoard.dataSource = self
        
        fetchData()
    }
    
    func fetchData() {
        let refUser = Database.database().reference(withPath: "Users")
        refUser.observe(.value) { (snapshot) in
            print("snapshot", snapshot)
        }
    }
    
    

}


extension LeaderBoardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeaderBoardTableViewCell", for: indexPath) as! LeaderBoardTableViewCell
        let scoreItem = scoreData[indexPath.row]
        cell.indexItem.text = "\(scoreItem.score)"
        
        let url = URL(string: scoreItem.profileImgUrl)
        cell.profile.kf.setImage(with: url)
        cell.username.text = scoreItem.displayName
        
        return cell
    }
    
    
}
