//
//  CurrentWeather.swift
//  weather
//
//  Created by Ateeth Kosuri on 9/24/16.
//  Copyright © 2016 Ateeth Kosuri. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!

    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }

    func downloadWeatherData(completed: @escaping DownloadComplete) {
        Alamofire.request(CURRENT_URL!).responseJSON { response in
            debugPrint(response)
            
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                }
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let currentTemperature = main["temp"] as? Double {
                        
                        let kelvinToFahrenheitPre = (currentTemperature * (9/5) - 459.67)
                        
                        let kelvinToFahrenheit = Double(round(10 * kelvinToFahrenheitPre/10))
                        
                        self._currentTemp = kelvinToFahrenheit
                        
                        print(self._currentTemp)
                        
                    }
                }
            }
            
            completed()
            
        }
    
    }
    
    


}
