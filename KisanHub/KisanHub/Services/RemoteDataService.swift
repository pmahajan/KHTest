//
//  RemoteDataService.swift
//  KisanHubTest
//
//  Created by Praful Mahajan on 09/12/18.
//  Copyright © 2018 Praful Mahajan. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import SVProgressHUD

class RemoteDataService
{
    func getDataFromWeatherApi(for metric: String, location: String, completionHandler: @escaping (Response) -> Void)  {

        let baseUrl = CommonSetting.sharedInstance.endPointUrl(metric: metric, location: location)
        let url = URL.init(string: baseUrl)
        SVProgressHUD.show()
        Alamofire.request(url!).validate().responseJSON { (response) in
            SVProgressHUD.dismiss()
            if(response.result.isSuccess){
                
                if let data =  response.result.value as? NSArray
                {
                    let weatherData = Mapper<WeatherData>().mapArray(JSONObject: data)
                    let resp = Response(status: true, weatherData: weatherData)
                    completionHandler(resp)
                }
                else
                {
                    let resp = Response(status: false, weatherData: [])
                    completionHandler(resp)
                }
            }
            else {

                let resp = Response(status: false, weatherData: [])
                completionHandler(resp)
            }
        }


    }
    
}
