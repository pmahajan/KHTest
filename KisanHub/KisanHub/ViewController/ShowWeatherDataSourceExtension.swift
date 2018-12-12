//
//  ShowWeatherDataSourceExtension.swift
//  KisanHub
//
//  Created by Praful Mahajan on 12/11/18.
//  Copyright © 2018 prafulmahajan. All rights reserved.
//

import Foundation
import SpreadsheetView

extension ShowWeatherDataVCViewController : SpreadsheetViewDataSource
{
    func numberOfColumns(in spreadsheetView: SpreadsheetView) -> Int {
        return 1 + months.count
    }
    
    func numberOfRows(in spreadsheetView: SpreadsheetView) -> Int {
        return 1 + years.count
    }
    
    func spreadsheetView(_ spreadsheetView: SpreadsheetView, cellForItemAt indexPath: IndexPath) -> Cell? {
        
        if case (1...(months.count + 1), 0) = (indexPath.column, indexPath.row) {
            let cell = spreadsheetView.dequeueReusableCell(withReuseIdentifier: String(describing: DataCell.self), for: indexPath) as! DataCell
            cell.label.text = months[indexPath.column - 1]
            cell.backgroundColor = indexPath.row % 2 == 0 ? evenRowColor : oddRowColor
            return cell
        }else if case (0, 0) = (indexPath.column, indexPath.row) {
            let cell = spreadsheetView.dequeueReusableCell(withReuseIdentifier: String(describing: DataCell.self), for: indexPath) as! DataCell
            cell.label.text = "YEARS"
            cell.backgroundColor = indexPath.row % 2 == 0 ? evenRowColor : oddRowColor
            return cell
        }else if case (0, 1...(years.count + 2)) = (indexPath.column, indexPath.row) {
            let cell = spreadsheetView.dequeueReusableCell(withReuseIdentifier: String(describing: DataCell.self), for: indexPath) as! DataCell
            cell.label.text = "\(years[indexPath.row - 1])"
            cell.backgroundColor = indexPath.row % 2 == 0 ? evenRowColor : oddRowColor
            return cell
        }else if case (0...(months.count + 1), 0...(years.count + 1)) = (indexPath.column, indexPath.row) {
            let cell = spreadsheetView.dequeueReusableCell(withReuseIdentifier: String(describing: DataCell.self), for: indexPath) as! DataCell
            let tempData = self.value[indexPath.row - 1][indexPath.column - 1]
            cell.label.text = "N/A"
            cell.label.text = String(format: "%.1f", tempData)
            cell.backgroundColor = indexPath.row % 2 == 0 ? evenRowColor : oddRowColor
            return cell
        }
        
        return nil
    }
}


