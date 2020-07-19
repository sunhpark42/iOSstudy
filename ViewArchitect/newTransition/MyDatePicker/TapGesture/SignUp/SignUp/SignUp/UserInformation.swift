//
//  UserInformation.swift
//  SignUp
//
//  Created by Sunhee Park on 2020/07/18.
//  Copyright © 2020 sunhpark. All rights reserved.
//

import Foundation

class UserInformation{
    static let shared: UserInformation = UserInformation()
    
    var id: String?
    var pwd: String?
    //img
    var comment: String?
    var phone: String?
    var birth: String?
    
    init() {
        print("Singleton MADE")
    }
}
