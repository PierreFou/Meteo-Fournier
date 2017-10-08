//
//  WeatherReport.swift
//  Meteo-Fournier
//
//  Created by Pierre on 06/10/2017.
//  Copyright © 2017 Pierre. All rights reserved.
//

import Foundation

struct WeatherReport: Decodable {
    var cod: String
    var cnt: Int
    var list: [WeatherList]
    
}
