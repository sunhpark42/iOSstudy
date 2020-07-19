//
//  SignUpViewControllerEtc.swift
//  SignUp
//
//  Created by Sunhee Park on 2020/07/18.
//  Copyright © 2020 sunhpark. All rights reserved.
//

import UIKit

class SignUpViewControllerEtc: UIViewController {

    @IBOutlet weak var PhoneNumber: UITextField!
    @IBOutlet weak var CancelButton: UIButton!
    @IBOutlet weak var SignUpButton: UIButton!
    
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var birthdayPicker: UIDatePicker!
    
    let birthFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yy/MM/dd"
        return formatter
    }();
    
    @IBAction func didBirthdayPicker(_ sender: UIDatePicker) {
        let birthday: Date = self.birthdayPicker.date
        let birthString: String = self.birthFormatter.string(from: birthday)
        
        self.birthLabel.text = birthString
    }
    
    @IBAction func setPersonalInfo(_ sender: UIButton) {
        UserInformation.shared.birth = birthLabel.text
        UserInformation.shared.phone = PhoneNumber.text
        
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchUpCancelButton(_ sender: UIButton) {
        UserInformation.shared.id = nil
        UserInformation.shared.birth = nil
        UserInformation.shared.pwd = nil
        UserInformation.shared.comment = nil
        UserInformation.shared.phone = nil
        
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissModal() {
        self.dismiss(animated: true, completion: nil)
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
