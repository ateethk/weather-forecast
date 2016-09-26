//
//  constants.swift
//  weather
//
//  Created by Ateeth Kosuri on 9/23/16.
//  Copyright © 2016 Ateeth Kosuri. All rights reserved.
//

import Foundation

let baseURL = "http://api.openweathermap.org/data/2.5/weather?"
let latitude = "lat="
let longitude = "&lon="
let appID = "&APPID="
let apiKey = "d87487ed3c7924a6af12db892d565a19"
let latitudeCoord = Location.sharedInstance.latitude!
let longitudeCoord = Location.sharedInstance.longitude!

typealias DownloadComplete = () -> ()

let CURRENT_URL = URL(string: "\(baseURL)\(latitude)\(Location.sharedInstance.latitude!)\(longitude)\(Location.sharedInstance.longitude!)\(appID)\(apiKey)")

let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=10&mode=json&appid=d87487ed3c7924a6af12db892d565a19"
