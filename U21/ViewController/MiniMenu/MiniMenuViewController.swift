//
//  MiniMenuViewController.swift
//  U21
//
//  Created by Kong on 4/1/2561 BE.
//  Copyright © 2561 u21. All rights reserved.
//

import UIKit

class MiniMenuViewController: UIViewController {

    @IBOutlet weak var miniMenuCollectionView: UICollectionView!
    
    var sections: [SectionModel]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        muckUPData()
        let nibCell = UINib(nibName: "MiniMenuCollectionViewCell", bundle: nil)
        
        miniMenuCollectionView.register(nibCell, forCellWithReuseIdentifier: "MiniMenuCollectionViewCell")
        miniMenuCollectionView.delegate = self
        miniMenuCollectionView.dataSource = self
        
    }
    
    func muckUPData() {
        let sectionOne = SectionModel(tile: "อาณาจักรล้านนา", img: "113", detail: "detail", status: "available")
        let sectionTwo = SectionModel(tile: "บ้าบอ", img: "114", detail: "detail", status: "unavailable")
        sections = [sectionOne, sectionTwo]
    }

}

extension MiniMenuViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MiniMenuCollectionViewCell", for: indexPath) as! MiniMenuCollectionViewCell
        let section = sections[indexPath.row]
        cell.titleLabel.text = section.tile
        cell.detailLabel.text = section.detail
        cell.imgPreview.image = UIImage(named: section.img)
        if section.status == "unavailable" {
            cell.alpha = 0.5
            cell.isUserInteractionEnabled = false
        }
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 5
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("select")
    }
}
