//
//  Countries.swift
//  WeatherToday
//
//  Created by Sunhee Park on 2020/07/24.
//  Copyright © 2020 sunhpark. All rights reserved.
//

import Foundation


//"korean_name":"한국","asset_name":"kr"

struct Countries: Codable {
    let koreanName: String
    let assetName: String
    
    enum CodingKeys: String, CodingKey {
        case koreanName = "korean_name"
        case assetName = "asset_name"
    }
}
