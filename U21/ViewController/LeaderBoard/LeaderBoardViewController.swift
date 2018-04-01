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
import CodableFirebase

class LeaderBoardViewController: UIViewController {

    @IBOutlet weak var leaderBoard: UITableView!
    var scoreData: [UserModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nibCell = UINib(nibName: "LeaderBoardTableViewCell", bundle: nil)
        leaderBoard.register(nibCell, forCellReuseIdentifier: "LeaderBoardTableViewCell")
        leaderBoard.delegate = self
        leaderBoard.dataSource = self
        fetchDataFromScore()
        fetchData()
    }
    
    func fetchData() {
        let refUser = Database.database().reference(withPath: "Users")
        refUser.queryOrdered(byChild: "score").observe(.value) { (snapshot) in
            //print("snapshot", snapshot)
            for userChild in snapshot.children {
                print(userChild)
                let item = userChild as? DataSnapshot
                do {
                    let model = try FirebaseDecoder().decode(UserModel.self, from: item?.value)
                    self.scoreData.append(model)
                    self.scoreData.reverse()
                    self.leaderBoard.reloadData()
                }catch let error {
                    print(error)
                }
            }
        }
    }
    
    func fetchDataFromScore() {
        let refScore = Database.database().reference(withPath: "Users")
        refScore.queryOrdered(byChild: "score").observe(.value) { (snapshot) in
            print("s")
            print(snapshot)
        }
    }
    
    

}


extension LeaderBoardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scoreData.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeaderBoardTableViewCell", for: indexPath) as! LeaderBoardTableViewCell
        let scoreItem = scoreData[indexPath.row]
        cell.indexItem.text = "\(indexPath.row+1)"
        cell.score.text = "\(scoreItem.score)"
        let url = URL(string: scoreItem.avatar)
        cell.profile.kf.setImage(with: url)
        cell.username.text = scoreItem.name
        
        return cell
    }
    
    
}
