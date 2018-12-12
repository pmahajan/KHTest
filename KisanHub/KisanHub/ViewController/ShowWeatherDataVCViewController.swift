//
//  ShowWeatherDataVCViewController.swift
//  KisanHub
//
//  Created by Praful Mahajan on 12/11/18.
//  Copyright © 2018 prafulmahajan. All rights reserved.
//

import UIKit
import SpreadsheetView

class ShowWeatherDataVCViewController: UIViewController {

    //MARK:- Required Parameter
    @IBOutlet weak var spreadsheetView: SpreadsheetView!
    
    var weatherData : [WeatherData]?
    let remoteDataService = RemoteDataService()

    var metric : String = ""
    var location : String = ""
    let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    var years: [Int] = []
    var value : [[Double]] = []
    
    let evenRowColor = UIColor(red: 0.914, green: 0.914, blue: 0.906, alpha: 1)
    let oddRowColor: UIColor = .white
    
    //MARK:- Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.getDataFromService()
    }
    
    func getDataFromService()
    {
        self.remoteDataService.getDataFromWeatherApi(for: metric, location: location) { (response) in
            if let weatherData = response.weatherData, weatherData.count > 0
            {
                self.weatherData = weatherData
                let allYear = self.weatherData?.map({$0.year})
                if let years: [Int] = NSSet(array: allYear ?? []).allObjects as? [Int]
                {
                    self.years = years
                    self.years.sort(by: {$1 > $0})
                    for year in self.years
                    {
                        var tempValue : [Double] = []
                        tempValue = self.weatherData?.filter({$0.year == year}).map({$0.value}) ?? []
                        self.value.append(tempValue)
                    }
                    self.setUpSpreadsheetView()
                }
            }
        }
    }
    
    func setUpSpreadsheetView()
    {
        spreadsheetView.dataSource = self
        spreadsheetView.delegate = self
        
        spreadsheetView.contentInset = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
        spreadsheetView.intercellSpacing = CGSize(width: 4, height: 1)
        spreadsheetView.gridStyle = .none
        spreadsheetView.register(DataCell.self, forCellWithReuseIdentifier: String(describing: DataCell.self))
    }
}
