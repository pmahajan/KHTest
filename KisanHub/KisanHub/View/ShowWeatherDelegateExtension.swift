//
//  ShowWeatherDelegateExtension.swift
//  KisanHub
//
//  Created by Praful Mahajan on 12/11/18.
//  Copyright © 2018 prafulmahajan. All rights reserved.
//

import UIKit
import SpreadsheetView

extension ShowWeatherDataVCViewController : SpreadsheetViewDelegate
{
    func spreadsheetView(_ spreadsheetView: SpreadsheetView, widthForColumn column: Int) -> CGFloat {
        return 120
    }
    
    func spreadsheetView(_ spreadsheetView: SpreadsheetView, heightForRow row: Int) -> CGFloat {
        return 40
    }
    
    func frozenColumns(in spreadsheetView: SpreadsheetView) -> Int {
        return 1
    }
    
    func frozenRows(in spreadsheetView: SpreadsheetView) -> Int {
        return 1
    }
}
