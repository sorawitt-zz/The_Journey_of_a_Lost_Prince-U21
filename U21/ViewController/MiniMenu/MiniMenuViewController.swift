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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibCell = UINib(nibName: "MiniMenuCollectionViewCell", bundle: nil)
        
        miniMenuCollectionView.register(nibCell, forCellWithReuseIdentifier: "MiniMenuCollectionViewCell")
        miniMenuCollectionView.delegate = self
        miniMenuCollectionView.dataSource = self
        
    }

}

extension MiniMenuViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MiniMenuCollectionViewCell", for: indexPath) as! MiniMenuCollectionViewCell
        cell.titleLabel.text = "อาณาจักรล้านนา"
        cell.detailLabel.text = "หลังจากพญามังรายรวบรวมอาณาจักรหริภุญชัยเข้ากับโยนกเชียงแสนเสร็จสิ้นแล้ว ได้ขนามนามราชอาณาจักรแห่งใหม่นี้ว่า อาณาจักรล้านนา"
        cell.imgPreview.image = UIImage(named: "113")
        return cell
    }
}
