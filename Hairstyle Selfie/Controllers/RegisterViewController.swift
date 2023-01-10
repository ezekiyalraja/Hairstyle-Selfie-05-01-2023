//
//  RegisterViewController.swift
//  Hairstyle Selfie
//
//  Created by iOS Developer on 20/12/22.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet var registerButton: UIButton!
    
    @IBOutlet var registerTextField: FloatingTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - setUp View
    
    func setUpView(){
        registerButton.addBorder(radius: 8, borderColor: UIColor.clear, borderWidth: 0)
        registerTextField.placeHolderSetup()
    }
    
    // MARK: - Button Actions
    
    
    @IBAction func registerAction(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController{
            self.navigationController?.pushViewController(vc, animated: true)
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



