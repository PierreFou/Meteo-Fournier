//
//  WeatherList.swift
//  Meteo-Fournier
//
//  Created by Pierre on 06/10/2017.
//  Copyright © 2017 Pierre. All rights reserved.
//

import Foundation

struct WeatherList: Decodable {
    var dt: Double
    var weather: [Weather]
    var main: Main
}
