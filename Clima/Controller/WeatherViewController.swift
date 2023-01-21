//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        print(searchTextField.text)
        searchTextField.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print (textField.text!)
        textField.endEditing(true)
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.text = ""
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
}
