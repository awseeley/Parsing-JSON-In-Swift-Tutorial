//
//  ViewController.swift
//  JSONParsing
//
//  Created by Andrew Seeley on 4/3/17.
//  Copyright © 2017 Seemu. All rights reserved.
//

import UIKit
import Foundation
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        // Store the JSON string
//        let animals = "[{\"animal\":{\"type\":\"Cat\",\"legs\":\"4\"}},{\"animal\":{\"type\":\"Spider\",\"legs\":\"8\"}}]"
//        
//        // Convert the animals string to a JSON object. Typically you would get this in a response from a web server and start at this step.
//        if let dataFromString = animals.data(using: .utf8, allowLossyConversion: false) {
//            let animalsJSON = JSON(data: dataFromString)
//            
//            // Get the Animal Legs & Type
//            let firstAnimalLegs =  animalsJSON[0]["animal"]["legs"]
//            let firstAnimalType = animalsJSON[0]["animal"]["type"]
//            
//            // Print out the Animal Legs & Type
//            print(firstAnimalType)
//            print(firstAnimalLegs)
//        }
        
        // From an API
        let url = URL(string: "http://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b1b15e88fa797225412429c1c50c122a1")
        // Load the URL
        URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
            // If there are any errors don't try to prase it
            guard let data = data, error == nil else { return }

            // Get the JSON from the URL
            let json = JSON(data: data)
            
            // Get the weather type and temprature
            let type = json["weather"][0]["main"]
            let temp = json["main"]["temp"]
            
            print(type)
            print(temp)
        }).resume()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

