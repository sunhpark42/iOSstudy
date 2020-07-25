//
//  ViewController.swift
//  WeatherToday
//
//  Created by Sunhee Park on 2020/07/24.
//  Copyright © 2020 sunhpark. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "cell"
    let customCellIdentifier: String = "customCell"
    //국가를 나타내기 위한 자료형 선언.
    var countries: [Countries] = []
    
    //테이블 뷰의 row 개수를 지정함.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: mainCustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.customCellIdentifier, for: indexPath) as! mainCustomTableViewCell
        
        let country: Countries = self.countries[indexPath.row]

        cell.name?.text = country.koreanName
        cell.asset = country.assetName
        cell.flag?.image = UIImage(named: ("flag_" + "\(country.assetName)"))
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // json file을 불러오는 부분
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset : NSDataAsset = NSDataAsset(name: "countries") else {
            return
        }
        
        
        do {
            self.countries = try jsonDecoder.decode([Countries].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        self.navigationItem.title = "세계 날씨"
        
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: secondViewController = segue.destination as? secondViewController else {
            return
        }
        
        guard let cell: mainCustomTableViewCell = sender as? mainCustomTableViewCell else {
            return
        }
        
        nextViewController.textToSet = cell.name?.text
        nextViewController.assetName = cell.asset
    }


}

