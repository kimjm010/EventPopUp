//
//  UIButton+Extension.swift
//  EventPopUp
//
//  Created by Chris Kim on 9/15/22.
//

import Foundation
import UIKit


extension UIButton {
    
    // 버튼의 모양 변경 메소드
    func setButtonTheme() {
        self.layer.cornerRadius = self.frame.height / 2
    }
}
