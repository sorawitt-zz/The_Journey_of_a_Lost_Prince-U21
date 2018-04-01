//
//  LearningViewController.swift
//  U21
//
//  Created by U21 on 1/4/2561 BE.
//  Copyright © 2561 u21. All rights reserved.
//

import UIKit
import paper_onboarding

class LearningViewController: UIViewController {
    
    @IBOutlet weak var onBoardingObj: OnboardingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onBoardingObj.dataSource = self
        // Do any additional setup after loading the view.
    }

}

extension LearningViewController: PaperOnboardingDataSource {
    func onboardingItemsCount() -> Int {
        return 3
    }
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        let bgOne = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        let bgTwo = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        let bgThree = #colorLiteral(red: 0.9353725314, green: 0.6963221431, blue: 0.1342729628, alpha: 1)
        let textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let titleFont = UIFont(name: "HelveticaNeue-Bold", size: 18)!
        let descripFont = UIFont(name: "HelveticaNeue", size: 14)!
        
        return [OnboardingItemInfo(informationImage: UIImage(named: "1")!, title: "วิถีชีวิต", description: "ประกอบอาชีพเกษตรกรรมเป็นหลัก พื้นที่บนภูเขาปลูกข้าวไร่ พื้นที่ภายในแอ่งเขาอุดมสมบูรณ์ปลูกข้าวและพืชอื่นๆ มีการแลกเปลี่ยนประสบการณ์การใช้ชีวิตในพื้นที่ต่างๆของแต่ละชุมชน", pageIcon: UIImage(named: "1")!, color: bgOne, titleColor: textColor, descriptionColor: textColor, titleFont: titleFont, descriptionFont: descripFont),
                OnboardingItemInfo(informationImage: UIImage(named: "2")!, title: "สภาพแวดล้อม", description: "ที่ราบสูง ภูเขา และเทือกเขา มักมีประชาชนไม่หนาแน่น มีความหลากหลายทางภาษา วัฒนธรรมและชาติพันธุ์ ชุมชนมีขนาดเล็ก พื่งพาตนเอง กระจัดกระจายในทางการเมือง", pageIcon: UIImage(named: "2")!, color: bgTwo, titleColor: textColor, descriptionColor: textColor, titleFont: titleFont, descriptionFont: descripFont),
                OnboardingItemInfo(informationImage: UIImage(named: "3")!, title: "วัฒนธรรม", description: "สภาพแวดล้อมท่ีต่างกัน ทำให้เกิดความหลากหลายทางวัฒนธรรม ความเขื่อและขบนธรรมเนียมประเพณี มีความเชื่อว่ามีวิญญาณสิงอยู่ตามส่วนต่างๆ ของธรรมขาติ มีพิธีกรรมที่โดดเด่นร่วมกันคือการไหว้ เพื่อแลกกับความคุ้มครองวิญญาณ", pageIcon: UIImage(named: "3")!, color: bgThree, titleColor: textColor, descriptionColor: textColor, titleFont: titleFont, descriptionFont: descripFont)][index]
    }
    
    
}
