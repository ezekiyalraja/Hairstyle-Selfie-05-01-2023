//
//  SaloonServicesViewController.swift
//  Hairstyle Selfie
//
//  Created by iOS Developer on 08/01/23.
//

import UIKit

class SaloonServicesViewController: UIViewController {

    @IBOutlet var topView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Saloon Services"
        DispatchQueue.main.async { [self] in
            topView.applyGradient()
        }
        // Do any additional setup after loading the view.
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

// MARK: - TableView Delegate & DataSource Methods
extension SaloonServicesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? saloonServicesTableViewCell else{
            return UITableViewCell()
        }
        
        return cell
    }
    
    
}
