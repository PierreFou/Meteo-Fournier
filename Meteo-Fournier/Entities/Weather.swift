//
//  Weather.swift
//  Meteo-Fournier
//
//  Created by Pierre on 06/10/2017.
//  Copyright © 2017 Pierre. All rights reserved.
//

import Foundation

struct Weather: Decodable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}
