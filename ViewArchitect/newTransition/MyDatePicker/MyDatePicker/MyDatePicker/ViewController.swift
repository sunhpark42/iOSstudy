//
//  ViewController.swift
//  MyDatePicker
//
//  Created by Sunhee Park on 2020/07/18.
//  Copyright © 2020 sunhpark. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLable: UILabel!
    
    let dateFormatter: DateFormatter =  {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yy/MM/dd hh:mm"
        return formatter
    }();
    
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker) {
        print("value change")

        let date: Date = self.datePicker.date
        let dateString: String = self.dateFormatter.string(from: date)
        
        self.dateLable.text = dateString
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.datePicker.addTarget(self, action: #selector(self.didDatePickerValueChanged(_:)), for: UIControl.Event.valueChanged)
    }


}

