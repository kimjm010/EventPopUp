//
//  CustomPopupViewController.swift
//  EventPopUp
//
//  Created by Chris Kim on 9/15/22.
//

import UIKit

class CustomPopupViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var detailButton: UIButton!
    
    
    // MARK: - IBActions
    
    /// 버튼 클릭시 completion을 전달
    /// - Parameter sender: "자세히 보기"버튼
    @IBAction func detailAction(_ sender: Any) {
        
        let isSelected = true
        
        dismiss(animated: true) {
            PopUpViewViewController.eventReceived?(isSelected)
        }
    }
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        detailButton.setButtonTheme()
    }
}
