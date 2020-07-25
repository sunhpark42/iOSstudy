//
//  SecondViewController.swift
//  MyAlbum
//
//  Created by Sunhee Park on 2020/07/25.
//  Copyright © 2020 sunhpark. All rights reserved.
//

import UIKit
import Photos

class SecondViewController: UIViewController {

    var albumTitles : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = albumTitles
        // Do any additional setup after loading the view.
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
