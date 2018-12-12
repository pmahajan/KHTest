//
//  ViewControllerExtensions.swift
//  KisanHub
//
//  Created by Praful Mahajan on 12/11/18.
//  Copyright © 2018 prafulmahajan. All rights reserved.
//

import UIKit

//MARK:- Tap gesture
extension ViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view == metricTxtField
        {
            self.setupDropDown(parentView: metricTxtField, list: metricsArray)
        }
        else
        {
            self.setupDropDown(parentView: locationTxtField, list: locationArray)
        }
        return true
    }
}
