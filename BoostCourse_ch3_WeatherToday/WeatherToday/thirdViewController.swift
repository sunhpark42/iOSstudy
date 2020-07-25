//
//  thirdViewController.swift
//  WeatherToday
//
//  Created by Sunhee Park on 2020/07/25.
//  Copyright © 2020 sunhpark. All rights reserved.
//


import UIKit

class thirdViewController: UIViewController {

    var icon : UIImage?
    var thirdState : String?
    var thirdTemper : String?
    var thirdRainfall : String?
    
    var isRed : Bool?
    var isBlue : Bool?

    @IBOutlet weak var weatherIcon : UIImageView!
    @IBOutlet weak var weatherState : UILabel!
    @IBOutlet weak var weatherTemperature : UILabel!
    @IBOutlet weak var rainfallProb : UILabel!
    
    var NavigationCityName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = self.NavigationCityName
        self.weatherState.text = self.thirdState
        self.weatherIcon.image = self.icon
        self.weatherTemperature.text = self.thirdTemper
        if isBlue == true {
            self.weatherTemperature.textColor = UIColor.blue
        }
        self.rainfallProb.text = self.thirdRainfall
        if isRed == true {
            self.rainfallProb.textColor = UIColor.red
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
