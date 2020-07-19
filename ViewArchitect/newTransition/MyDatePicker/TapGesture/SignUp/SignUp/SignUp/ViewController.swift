//
//  ViewController.swift
//  SignUp
//
//  Created by Sunhee Park on 2020/07/18.
//  Copyright © 2020 sunhpark. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var IdField: UITextField!
    @IBOutlet weak var PwdField: UITextField!
    
    @IBOutlet weak var SignInButton: UIButton!
    
    @IBOutlet weak var isLogin: UILabel!
    
    @IBAction func pushSignInButton(_ sender:UIButton) {
        if (self.IdField.text == UserInformation.shared.id) && (self.PwdField.text == UserInformation.shared.pwd) {
            isLogin.text = ""
            self.navigationController?.pushViewController(profileViewController(), animated: true)
        } else {
            isLogin.text = "로그인에 실패하였습니다."
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Do any addtional setup after loading the view, typically from a nib.
        
        print("ViewController의 view가 메모리에 로드 됨")
        print(UserInformation.shared.id as Any)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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


}

