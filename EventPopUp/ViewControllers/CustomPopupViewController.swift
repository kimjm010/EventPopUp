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
