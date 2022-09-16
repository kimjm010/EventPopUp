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
    
    // CustomPopupVC에서 "자세히 보기"버튼 클릭시 이벤트를 전달하기 위한 클로져
    static var eventReceived: ((Bool) -> Void)?
    
    
    // MARK: - Create Popup Event
    
    /// popup event를 생성하는 메소드
    /// - Parameter animated: 애니메이션 여부
    private func showCustomDialog(animated: Bool = true) {

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
    
    
    /// view가 다시 나타나는 시점에 isPopup값에 따라 팝업창을 표시할지 결정
    /// - Parameter animated: 애니메이션 여부
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

