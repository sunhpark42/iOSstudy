//
//  secondTableViewCell.swift
//  WeatherToday
//
//  Created by Sunhee Park on 2020/07/25.
//  Copyright © 2020 sunhpark. All rights reserved.
//

import UIKit

class secondTableViewCell: UITableViewCell {

    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityNames: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var rainfall: UILabel!
    
    var state: String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
