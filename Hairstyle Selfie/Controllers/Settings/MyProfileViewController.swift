//
//  MyProfileViewController.swift
//  Hairstyle Selfie
//
//  Created by iOS Developer on 27/12/22.
//

import UIKit

class MyProfileViewController: UIViewController,UITextViewDelegate {
    // MARK: - Outlets
    @IBOutlet var AddressTextView: UITextView!
    @IBOutlet var AddressLable: UILabel!
    @IBOutlet var AddressLableTop: NSLayoutConstraint!
    @IBOutlet var SaveButton: UIButton!
    // MARK: - Properties
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        // Do any additional setup after loading the view.
    }
    // MARK: - SetUp View
    
    func setUpView(){
        self.title = "My Profile"
        AddressTextView.addBorder(radius: 10, borderColor: UIColor(named: "Text")! , borderWidth: 1)
        SaveButton.layer.cornerRadius = 10
    }
    // MARK: - Textview Delegates
    func textViewDidBeginEditing (_ textView: UITextView) {
        UIView.animate(withDuration: 10, delay: 0) { [self] in
            self.AddressLableTop.constant = 3
            AddressLable.font = AddressLable.font.withSize(12)
        }
        
        
    }
    func textViewDidEndEditing (_ textView: UITextView) {
        UIView.animate(withDuration: 10, delay: 0) { [self] in
            AddressLableTop.constant = 20
            AddressLable.font = AddressLable.font.withSize(14)
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
