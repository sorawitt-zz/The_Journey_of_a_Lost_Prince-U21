//
//  LeaderBoardTableViewCell.swift
//  U21
//
//  Created by Kong on 4/1/2561 BE.
//  Copyright © 2561 u21. All rights reserved.
//

import UIKit

class LeaderBoardTableViewCell: UITableViewCell {

    
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var indexItem: UILabel!
    @IBOutlet weak var leaderBoardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }

    func setupUI() {
        profile.layer.borderWidth = 1
        profile.layer.masksToBounds = false
        profile.layer.borderColor = UIColor.black.cgColor
        profile.layer.cornerRadius = 10
        profile.clipsToBounds = true
        
        indexItem.layer.masksToBounds = false
        indexItem.layer.cornerRadius = 10
        indexItem.clipsToBounds = true

        score.layer.cornerRadius = 20

        leaderBoardView.layer.cornerRadius = 20
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
