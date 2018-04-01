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
        return 4
    }
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        let bgOne = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        let bgTwo = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        let bgThree = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        let textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let titleFont = UIFont(name: "HelveticaNeue-Bold", size: 18)!
        let descripFont = UIFont(name: "HelveticaNeue", size: 14)!
        
        return [OnboardingItemInfo(informationImage: UIImage(named: "huhu")!, title: "eiei", description: "eiei", pageIcon: UIImage(named: "huhu")!, color: .red, titleColor: .yellow, descriptionColor: .blue, titleFont: titleFont, descriptionFont: descripFont), OnboardingItemInfo(informationImage: UIImage(named: "huhu")!, title: "eiei", description: "eiei", pageIcon: UIImage(named: "huhu")!, color: .blue, titleColor: .yellow, descriptionColor: .blue, titleFont: titleFont, descriptionFont: descripFont), OnboardingItemInfo(informationImage: UIImage(named: "huhu")!, title: "eiei", description: "eiei", pageIcon: UIImage(named: "huhu")!, color: .blue, titleColor: .yellow, descriptionColor: .blue, titleFont: titleFont, descriptionFont: descripFont), OnboardingItemInfo(informationImage: UIImage(named: "huhu")!, title: "eiei", description: "eiei", pageIcon: UIImage(named: "huhu")!, color: .blue, titleColor: .yellow, descriptionColor: .blue, titleFont: titleFont, descriptionFont: descripFont)][index]
    }
    
    
}
