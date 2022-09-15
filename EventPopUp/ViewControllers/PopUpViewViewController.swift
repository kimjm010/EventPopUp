//
//  ViewController.swift
//  EventPopUp
//
//  Created by Chris Kim on 9/14/22.
//

import UIKit
import PopupDialog
import AVFoundation


class PopUpViewViewController: UIViewController {
    
    // MARK: - Vars
    
    static var eventReceived: ((Bool) -> Void)?
    
    
    @IBAction func showImage(_ sender: Any) {
        showCustomDialog()
    }
    
    
    func showCustomDialog(animated: Bool = true) {

        // Create a custom view controller
        let customVC = CustomPopupViewController(nibName: "CustomPopupViewController", bundle: nil)

        // Create the dialog
        let popup = PopupDialog(viewController: customVC,
                                buttonAlignment: .horizontal,
                                transitionStyle: .bounceUp,
                                preferredWidth: 200,
                                tapGestureDismissal: true)
        
        // Create never button
        let neverButton = CancelButton(title: "다신 보지 않기", height: 60) {
            UserDefaults.standard.set(false, forKey: kUSERPOPUPSETTINGS)
            
            #if DEBUG
            print(UserDefaults.standard.bool(forKey: kUSERPOPUPSETTINGS))
            #endif
        }
        
        // Create cancel button
        let cancelButton = CancelButton(title: "닫기", height: 60) {
             UserDefaults.standard.set(true, forKey: kUSERPOPUPSETTINGS)
             
             #if DEBUG
             print(UserDefaults.standard.bool(forKey: kUSERPOPUPSETTINGS))
             #endif
            
            print(#function, #line, #file)
        }
        
        // Setting Button Color
        let btnBackColor = UIColor(red: 217, green: 217, blue: 217, alpha: 1)
        neverButton.backgroundColor = btnBackColor
        cancelButton.backgroundColor = btnBackColor
        
        // Add buttons to dialog
        popup.addButtons([neverButton, cancelButton])

        // Present dialog
        present(popup, animated: animated, completion: nil)
    }
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        PopUpViewViewController.eventReceived = { [weak self] isSelected in
            guard let self = self else { return }
            let webVC = self.storyboard?.instantiateViewController(withIdentifier: "WebVC") as! DetailViewController
            self.present(webVC, animated: true)
        }
        
        let isPopup = UserDefaults.standard.bool(forKey: kUSERPOPUPSETTINGS)
        
        if isPopup {
            showCustomDialog()
        }
    }
}

