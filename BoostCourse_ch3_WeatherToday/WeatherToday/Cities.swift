//
//  Cities.swift
//  WeatherToday
//
//  Created by Sunhee Park on 2020/07/25.
//  Copyright © 2020 sunhpark. All rights reserved.
//


import Foundation

//"city_name":"함부르크",
//     "state":12,
//     "celsius":5.6,
//     "rainfall_probability":40

struct Cities: Codable {
    let cityName: String
    let state: Int
    let celsius: Float
    let rainfallProbability: Int
    
    enum CodingKeys: String, CodingKey {
        case state, celsius
        case cityName = "city_name"
        case rainfallProbability = "rainfall_probability"
    }
}
