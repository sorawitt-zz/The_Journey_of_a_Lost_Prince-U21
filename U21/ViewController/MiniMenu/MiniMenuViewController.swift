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
        let sectionOne = SectionModel(tile: "อาณาจักรล้านนา", img: "113", detail: "ตั้งอยู่ในพื้นที่ภูเขาทางภาคเหนือของไทย ปัจจุบันบริเวณนี้เป็นที่อยู่อาศัยของกลุ่มชาติพันธุ์หลายกลุ่ม การตั้งถิ่นฐาน แบ่งได้ทั้งพื้นที่ราบลุ่มและพื้นที่ภูเขา มีการตั้งถิ่นฐานขนาดใหญ่บนที่ราบลุ่ม ขณะที่ชุมชนบนพื้นที่ภูเขาอยู่กันเป็นหมู่บ้านเล็กๆ แต่ด้วยอาศัยอยู่ในสภาพแวดล้อมที่คล้ายกัน จึงทำให้เกิดประสบการณ์ทางประวัติศาสตร์และชีวิตที่ร่วมกันได้", status: "available")
        let sectionTwo = SectionModel(tile: "Coming Soon", img: "114", detail: "detail", status: "unavailable")
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
        if section.status == "unavaliable" {
            cell.alpha = 0.5
            cell.isUserInteractionEnabled = false
        }
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 5
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("select")
        let viewController:
            UIViewController = UIStoryboard(
                name: "Main", bundle: nil
                ).instantiateViewController(withIdentifier: "LearningViewController") as! LearningViewController
        show(viewController, sender: self)
    }
}
