//
//  LaunchViewController.swift
//  Hairstyle Selfie
//
//  Created by iOS Developer on 20/12/22.
//

import UIKit

class LaunchViewController: UIViewController {

    @IBOutlet var view1: UIView!
    
    @IBOutlet var customerButton: UIButton!
    @IBOutlet var barberButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - setUp View
    
    func setUpView(){
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.red]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        view1.dropShadow()
        view1.addBorder(radius: 10, borderColor: UIColor.clear, borderWidth: 0)
        customerButton.addBorder(radius: 8, borderColor: UIColor.clear, borderWidth: 0)
        barberButton.addBorder(radius: 8, borderColor: UIColor.clear, borderWidth: 0)
    }

    // MARK: - Button Actions
    
    @IBAction func CustomerAction(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController{
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
