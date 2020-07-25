//
//  secondViewController.swift
//  WeatherToday
//
//  Created by Sunhee Park on 2020/07/25.
//  Copyright © 2020 sunhpark. All rights reserved.
//

import UIKit

class secondViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var secondTableView: UITableView!
    
    let secondViewCellIdentifier = "secondViewCell"
    var cities : [Cities] = []
    var textToSet: String?
    var assetName: String?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: secondTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.secondViewCellIdentifier, for: indexPath) as! secondTableViewCell
        
        let city: Cities = self.cities[indexPath.row]
        
        let Fahrenheit = String(format: "%.1f", arguments: [city.celsius * 0.8 + 32])
        
        cell.cityNames?.text = city.cityName
        
        cell.temperature?.text = "섭씨 " + "\(String(city.celsius))" + "도 / 화씨 " + "\(Fahrenheit)" + "도"
        cell.rainfall?.text = "강수확률 " + String(city.rainfallProbability) + "%"
        
        if city.celsius < 10.0 {
            cell.temperature.textColor = UIColor.blue
        } else {
            cell.temperature.textColor = UIColor.black
        }
        
        if city.rainfallProbability >= 60 {
            cell.rainfall.textColor = UIColor.red
        } else {
            cell.temperature.textColor = UIColor.black
        }
        
        // icon을 위한 조건
        if city.state == 10 {
            cell.weatherIcon?.image = UIImage(named: "sunny")
            cell.state = "맑음"
        } else if city.state == 11 {
            cell.weatherIcon?.image = UIImage(named: "cloudy")
            cell.state = "흐림"
        } else if city.state == 12 {
            cell.weatherIcon?.image = UIImage(named: "rainy")
            cell.state = "비"
        } else {
            cell.weatherIcon?.image = UIImage(named: "snowy")
            cell.state = "눈"
        }
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let jsonDecoder : JSONDecoder = JSONDecoder()
        guard let dataAsset : NSDataAsset = NSDataAsset(name: self.assetName!) else {
            return
        }

        do {
            self.cities
                = try jsonDecoder.decode([Cities].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }

        self.navigationItem.title = self.textToSet
        
//        self.tableView.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: thirdViewController = segue.destination as? thirdViewController else {
            return
        }
        
        guard let cell: secondTableViewCell = sender as? secondTableViewCell else {
            return
        }
        
        nextViewController.NavigationCityName = cell.cityNames.text
        nextViewController.icon = cell.weatherIcon.image
        nextViewController.thirdRainfall = cell.rainfall.text
        nextViewController.thirdTemper = cell.temperature.text
        
        nextViewController.thirdState = cell.state
        
        if cell.rainfall.textColor == UIColor.red {
            nextViewController.isRed = true
        }
        
        if cell.temperature.textColor == UIColor.blue {
            nextViewController.isBlue = true
        }
    }

}
