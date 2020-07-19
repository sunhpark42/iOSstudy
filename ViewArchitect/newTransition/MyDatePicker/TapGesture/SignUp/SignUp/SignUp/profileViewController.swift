//
//  profileViewController.swift
//  SignUp
//
//  Created by Sunhee Park on 2020/07/19.
//  Copyright © 2020 sunhpark. All rights reserved.
//

import UIKit

class profileViewController: UIViewController {

    @IBOutlet weak var UserNameLable: UILabel!
    @IBOutlet weak var BirthdayLable: UILabel!
    @IBOutlet weak var PhoneNbrLable: UILabel!
    @IBOutlet weak var CommentLable: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        //Do any addtional setup after loading the view, typically from a nib.
        print("ViewController의 view가 메모리에 로드 됨~~~~~~~~~~~~~~~")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        UserNameLable.text = UserInformation.shared.id
        BirthdayLable.text = UserInformation.shared.birth
        PhoneNbrLable.text = UserInformation.shared.phone
        CommentLable.text = UserInformation.shared.comment
        print("ViewController의 view가 화면에 보여질 예정")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("ViewController의 view가 화면에 보여짐")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("ViewController의 view가 화면에서 사라질 예정")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("ViewController의 view가 화면에서 사라짐")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        print("ViewController의 view가 subview를 레이아웃 하려함")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print("ViewController의 view가 subview를 레이아웃 함.")
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
