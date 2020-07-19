//
//  ViewController.swift
//  TapGesture
//
//  Created by Sunhee Park on 2020/07/18.
//  Copyright © 2020 sunhpark. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate{

    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       // let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapView(_:)))
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
        tapGesture.delegate = self
        
        self.view.addGestureRecognizer(tapGesture)
    }

    // 다양한 상황에 다양한 기능을 활용할 수 있음(delegate pattern)
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive event: UITouch) -> Bool {
        self.view.endEditing(true)
        return true
    }
}

