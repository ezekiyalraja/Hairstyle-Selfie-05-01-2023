//
//  ManageAddressViewController.swift
//  Hairstyle Selfie
//
//  Created by iOS Developer on 03/01/23.
//

import UIKit

class ManageAddressViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet var AddButton: UIButton!
    @IBOutlet var ManageAddressTableView: UITableView!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView() {
        self.title = "Manage Address"
        AddButton.layer.cornerRadius = 25
        AddButton.clipsToBounds = true
        ManageAddressTableView.register(UINib(nibName: "AddressTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        ManageAddressTableView.reloadData()
    }
    // MARK: - Button Action
    @IBAction func AddAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddAdressViewController") as! AddAdressViewController
        self.navigationController?.pushViewController(vc, animated: true)
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
// MARK: - TableView Delegate & DataSource

extension ManageAddressViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return 3
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        170
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = ManageAddressTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? AddressTableViewCell else{
            return UITableViewCell()
        }
       
            return cell
        
    }
    
    
}
