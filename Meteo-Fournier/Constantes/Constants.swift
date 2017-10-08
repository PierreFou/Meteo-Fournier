//
//  Constantes.swift
//  Meteo-Fournier
//
//  Created by Pierre on 06/10/2017.
//  Copyright © 2017 Pierre. All rights reserved.
//

import Foundation


struct Constants {
    // API constants
    static let ApiUrl = "http://api.openweathermap.org/"
    static let ApiWeatherURL = "data/2.5/forecast?id="
    static let ApiIdParis = "6455259"
    static let ApiKey = "APPID="
    static let ApiUrlWeatherIcons = "img/w/"
    static let ApiDegresInCelcius = "units=metric"
    
    static let ApiCompleteUrlWeather = "\(ApiUrl)\(ApiWeatherURL)\(ApiIdParis)&\(ApiKey)&\(ApiDegresInCelcius)"
    static let ApiCompleteUrlWeatherIcons = "\(ApiUrl)\(ApiUrlWeatherIcons)"
    
    // Messages
    static let NoInternetTitle = "Aucune connectivité"
    static let NoInternetMessage = "Veuiller activer votre connexion internet et réessayer"
    
    static let BadStatusTitle = "Erreur"
    static let BadStatusMessage = "Un problème est survenue, veuillez vérifier vos identifiants de connexion."
    
    
    
    static let Ok = "Ok"
    
}
