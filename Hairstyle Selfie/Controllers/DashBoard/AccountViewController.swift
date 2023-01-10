//
//  AccountViewController.swift
//  Hairstyle Selfie
//
//  Created by iOS Developer on 21/12/22.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet var myProfileButton: UIButton!
    @IBOutlet var changePasswordButton: UIButton!
    @IBOutlet var manageAddressButton: UIButton!
    @IBOutlet var contactUsButton: UIButton!
    // MARK: - Properties
    
    
    // MARK: - Navigation
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - SetUp Views

    func setUpView(){
        myProfileButton.addBorder(radius: 7, borderColor: UIColor(named: "Text")!, borderWidth: 1)
        changePasswordButton.addBorder(radius: 7, borderColor: UIColor(named: "Text")!, borderWidth: 1)
        manageAddressButton.addBorder(radius: 7, borderColor: UIColor(named: "Text")!, borderWidth: 1)
        contactUsButton.addBorder(radius: 7, borderColor: UIColor(named: "Text")!, borderWidth: 1)
    }
    
    // MARK: - Button Actions
    @IBAction func MyProfileButtonAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyProfileViewController") as! MyProfileViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func ChangePasswordAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "changePasswordViewController") as! changePasswordViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func ManageAddressAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ManageAddressViewController") as! ManageAddressViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @IBAction func ContactUsAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ContactUSViewController") as! ContactUSViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

}
