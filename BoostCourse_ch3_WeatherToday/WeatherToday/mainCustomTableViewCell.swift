//
//  mainCustomTableViewCell.swift
//  WeatherToday
//
//  Created by Sunhee Park on 2020/07/24.
//  Copyright © 2020 sunhpark. All rights reserved.
//

import UIKit

class mainCustomTableViewCell: UITableViewCell {
    
    
    @IBOutlet var name: UILabel!
    @IBOutlet var flag: UIImageView!
    var asset: String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
