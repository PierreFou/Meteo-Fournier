//
//  Main.swift
//  Meteo-Fournier
//
//  Created by Pierre on 06/10/2017.
//  Copyright © 2017 Pierre. All rights reserved.
//

import Foundation

struct Main: Decodable {
    var temp: Double
    var temp_min: Double
    var temp_max: Double
    var pressure: Double
    var sea_level : Double
}
