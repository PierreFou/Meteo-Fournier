//
//  Utilities.swift
//  Meteo-Fournier
//
//  Created by Pierre on 08/10/2017.
//  Copyright © 2017 Pierre. All rights reserved.
//

import Foundation
import UIKit

/**
 * Display a pop-up with different parameters.
 * Need a title, a message, and a label for the dismiss button
 */
func displayAlert(controller: UIViewController, title: String, message: String, button: String){
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: button, style: .default) { _ in })
    controller.present(alert, animated: true){}
}
