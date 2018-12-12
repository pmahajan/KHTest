//
//  Cells.swift
//  KisanHubTest
//
//  Created by Praful Mahajan on 08/12/18.
//  Copyright © 2018 Praful Mahajan. All rights reserved.
//

import UIKit
import SpreadsheetView

class DataCell: Cell
{
    let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        label.frame = bounds
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .center

        contentView.addSubview(label)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
