//
//  ViewController.swift
//  Meteo-Fournier
//
//  Created by Pierre on 05/10/2017.
//  Copyright © 2017 Pierre. All rights reserved.
//

import UIKit



class WeatherTableViewController: UITableViewController {
    
    @IBOutlet var weatherTableView: UITableView!
    
    var meteo = [WeatherList]()
    var weatherIcons = [String: UIImage]()
    let dateFormat = "HH'h', EEEE dd MMMM"
    
    let dailyWeatherIdentifier = "dailyWeatherIdentifier"
    
    override func viewDidLoad() {
        
        getWeather()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meteo.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: dailyWeatherIdentifier)
        
        let weather = self.meteo[indexPath.row]
        
        // Put the formatted date in the title
        cell.textLabel?.text = getFormattedDate(timeIntervalSince1970: weather.dt, format: dateFormat)
    
        // Put the temperature in the subtitle
        cell.detailTextLabel?.text = "\(weather.main.temp)°"
        
        // Put the weather icon in the image view
        cell.indentationLevel = 5
        cell.contentView.addSubview(getWeatherIconView(iconId: weather.weather[0].icon))
        
        return cell
    }
    
    func getWeatherIconsFromAPI(iconId : String){
        let weatherIconsStringURL = "\(Constants.ApiCompleteUrlWeatherIcons)\(iconId).png"
        guard let weatherIconsURL = URL(string: weatherIconsStringURL) else { return }
        
        URLSession.shared.dataTask(with: weatherIconsURL) { (data, response, err) in
            if err != nil {
                
                displayAlert(controller: self, title: Constants.NoInternetTitle, message: Constants.NoInternetMessage, button: Constants.Ok)
                
            } else if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    
                    displayAlert(controller: self, title: Constants.BadStatusTitle, message: Constants.BadStatusMessage, button: Constants.Ok)
                    
                } else {
                    
                    guard let data = data else { return }
                    
                    self.weatherIcons[iconId] = UIImage(data: data)!
                    
                    DispatchQueue.main.async {
                        self.weatherTableView.reloadData()
                    }
                }
            }
            
            }.resume()
    }

    func getWeather() {
        
        let jsonUrlString = Constants.ApiCompleteUrlWeather
        
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            //also perhaps check response status 200 OK
            
            guard let data = data else { return }
            
            do {
                
                self.meteo  = try JSONDecoder().decode(WeatherReport.self, from: data).list
                
                DispatchQueue.main.async {
                    self.weatherTableView.reloadData()
                }
                
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
            
        }.resume()
    }
    
    func getFormattedDate(timeIntervalSince1970: Double, format: String) -> String{
        let date = Date(timeIntervalSince1970: timeIntervalSince1970)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "FR-fr")
        return dateFormatter.string(from: date).capitalized
    }
    
    func getWeatherIconView(iconId: String) -> UIImageView{
        
        let weatherIconView = UIImageView(frame: CGRect(x: 10, y: 10, width: 40, height: 40))
        
        if let weatherIcon = self.weatherIcons[iconId]{
            weatherIconView.image = weatherIcon
        } else {
            getWeatherIconsFromAPI(iconId: iconId)
        }
        
        return weatherIconView
    }
    
}

