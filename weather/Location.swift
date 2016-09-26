//
//  Location.swift
//  weather
//
//  Created by Ateeth Kosuri on 9/26/16.
//  Copyright © 2016 Ateeth Kosuri. All rights reserved.
//

import Foundation
import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {
    }
    var latitude: Double!
    var longitude: Double!
}
