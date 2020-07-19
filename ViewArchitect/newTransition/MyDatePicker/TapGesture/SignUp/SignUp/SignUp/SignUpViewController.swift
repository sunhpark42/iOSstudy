//
//  SignInViewController.swift
//  SignUp
//
//  Created by Sunhee Park on 2020/07/18.
//  Copyright © 2020 sunhpark. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var IdField: UITextField!
    @IBOutlet weak var PwdField: UITextField!
    @IBOutlet weak var PwdCheckField: UITextField!
    @IBOutlet weak var CommentField: UITextView!
    
    var isTextField: Bool?
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func isThereTextField(_ sender:UITextField) {
        if (IdField.text == Optional("")) || (PwdField.text == Optional("")) || (PwdCheckField.text == Optional("")){
            isTextField = false
        } else {
            isTextField = true
        }
    }
    
    @IBAction func ValidatePwd(_ sender:UITextField) {
        if (isTextField == true) && (PwdCheckField.text == PwdField.text) {
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false
        }
    }
    
    @IBAction func setUserInformation(_ sender: UIButton) {
        UserInformation.shared.id = IdField.text
        UserInformation.shared.pwd = PwdField.text
        UserInformation.shared.comment = CommentField.text
    }
    
    //image view controller 공부하기.
    lazy var imagePicker: UIImagePickerController = {
        let  picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func touchUpSelectImageButton(_ sender: UIButton) {
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let originalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView.image = originalImage
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nextButton.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
    //        self.nameLabel.text = UserInformation.shared.name
    //        self.ageLabel.text = UserInformation.shared.age
            print("SecondViewController의 view가 화면에 보여질 예정")
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
            print("SecondViewController의 view가 화면에 보여짐")
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            
            print("SecondViewController의 view가 화면에서 사라질 예정")
        }
        
        override func viewDidDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            
            print("SecondViewController의 view가 화면에서 사라짐")
        }
        
        override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
            
            print("SecondViewController의 view가 subview를 레이아웃 하려함")
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            
            print("SecondViewController의 view가 subview를 레이아웃 함.")
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
