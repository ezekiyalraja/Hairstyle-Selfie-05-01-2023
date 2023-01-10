//
//  changePasswordViewController.swift
//  Hairstyle Selfie
//
//  Created by iOS Developer on 27/12/22.
//

import UIKit

class changePasswordViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet var OldPasswordTextfield: UITextField!
    @IBOutlet var ConfirmNewPasswordTextfield: UITextField!
    @IBOutlet var newPasswordTextfield: UITextField!
    @IBOutlet var SubmitButton: UIButton!
    
    @IBOutlet var Show0: UIButton!
    @IBOutlet var show1: UIButton!
    @IBOutlet var show2: UIButton!
    var iconClickOldPassword = true
    var iconClickNewPassword = true
    var iconClickConfirmPassword = true
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUpView()
    }
    // MARK: - SetUp View
    
    func setUpView(){
        self.title = "Change Password"
        SubmitButton.layer.cornerRadius = 10
        addToolBar(textField: OldPasswordTextfield)
        addToolBar(textField: newPasswordTextfield)
        addToolBar(textField: ConfirmNewPasswordTextfield)
        
    }
        
    @IBAction func ShowHidePassword(_ sender: UIButton) {
        switch(sender.tag)
        {
        case 1:
            if iconClickNewPassword {
                   newPasswordTextfield.isSecureTextEntry = false
                show1.setImage(UIImage(named: "Password_Hide"), for: .normal)
               } else {
                   newPasswordTextfield.isSecureTextEntry = true
                   show1.setImage(UIImage(named: "Password_Show"), for: .normal)
               }
            iconClickNewPassword = !iconClickNewPassword
            break
        case 2:
            if iconClickConfirmPassword {
                   ConfirmNewPasswordTextfield.isSecureTextEntry = false
                show2.setImage(UIImage(named: "Password_Hide"), for: .normal)
               } else {
                   ConfirmNewPasswordTextfield.isSecureTextEntry = true
                   show2.setImage(UIImage(named: "Password_Show"), for: .normal)
               }
            iconClickConfirmPassword = !iconClickConfirmPassword
            break
            
        default:
            if iconClickOldPassword {
                   OldPasswordTextfield.isSecureTextEntry = false
                Show0.setImage(UIImage(named: "Password_Hide"), for: .normal)
               } else {
                   OldPasswordTextfield.isSecureTextEntry = true
                   Show0.setImage(UIImage(named: "Password_Show"), for: .normal)
               }
            iconClickOldPassword = !iconClickOldPassword
           break
            
        }
       
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

