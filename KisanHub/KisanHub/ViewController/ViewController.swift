//
//  ViewController.swift
//  KisanHub
//
//  Created by Praful Mahajan on 12/11/18.
//  Copyright © 2018 prafulmahajan. All rights reserved.
//

import UIKit
import DropDown

class ViewController: UIViewController {

    //MARK:- Required Parameters --
    let categoryDropDown = DropDown()
    
    @IBOutlet weak var metricTxtField: CustomTextField!
    @IBOutlet weak var locationTxtField: CustomTextField!
    let metricsArray = [Metric.RAINFALL.rawValue, Metric.TMAX.rawValue, Metric.TMIN.rawValue]
    let locationArray = [Location.ENGLAND.rawValue, Location.SCOTLAND.rawValue, Location.UK.rawValue, Location.WALES.rawValue]
    
    //MARK:- Setup Default DropDown --
    func setupDefaultDropDown() {
        DropDown.setupDefaultAppearance()
        
        categoryDropDown.cellNib = UINib(nibName: "DropDownCell", bundle: Bundle(for: DropDownCell.self))
        categoryDropDown.customCellConfiguration = nil
    }
    
    //MARK:- Methods --
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setUpDropDownWithTxtFields()
    }
    
    func setUpDropDownWithTxtFields()
    {
        self.categoryDropDown.dismissMode = .onTap
        self.categoryDropDown.direction = .any
        
        metricTxtField.text = Metric.RAINFALL.rawValue
        let metricTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.showMetricList))
        metricTapGesture.cancelsTouchesInView = false
        metricTapGesture.delegate = self
        metricTxtField.addGestureRecognizer(metricTapGesture)
        
        locationTxtField.text = Location.ENGLAND.rawValue
        let locationtTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.showLocationList))
        locationtTapGesture.cancelsTouchesInView = false
        locationtTapGesture.delegate = self
        locationTxtField.addGestureRecognizer(locationtTapGesture)
    }
    
    func setupDropDown(parentView : CustomTextField, list : [String]) {
        categoryDropDown.anchorView = parentView
        
        // Will set a custom with instead of anchor view width
        //        dropDown.width = 100
        
        // By default, the dropdown will have its origin on the top left corner of its anchor view
        // So it will come over the anchor view and hide it completely
        // If you want to have the dropdown underneath your anchor view, you can do this:
        categoryDropDown.bottomOffset = CGPoint(x: 0, y: parentView.bounds.height)
        
        // You can also use localizationKeysDataSource instead. Check the docs.
        if categoryDropDown.dataSource.count > 0
        {
            categoryDropDown.dataSource.removeAll()
        }
        categoryDropDown.dataSource.append(contentsOf: list)
        
        // Action triggered on selection
        categoryDropDown.selectionAction = {(index, item) in
            parentView.text = item
        }
    }

    //MARK:- Buttons Action --
    @objc func showMetricList() {
        self.categoryDropDown.show()
    }
    
    @objc func showLocationList() {
        self.categoryDropDown.show()
    }
    
    @IBAction func getTheMonthalyWeatherData(_ sender: Any) {
        if let vc = CommonSetting.sharedInstance.getViewControllerFromStoryBoard(type: ShowWeatherDataVCViewController.self)
        {
            vc.metric = metricTxtField.text ?? ""
            vc.location = locationTxtField.text ?? ""
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}



