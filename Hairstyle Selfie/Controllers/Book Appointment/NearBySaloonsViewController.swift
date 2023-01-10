//
//  NearBySaloonsViewController.swift
//  Hairstyle Selfie
//
//  Created by iOS Developer on 04/01/23.
//

import UIKit

class NearBySaloonsViewController: UIViewController {
    
    @IBOutlet var topView: UIView!
    
    
    let parser = APIClient()
    var Common_Response = CommonResponse()
    var Saloons = [Barbershops]()
    override func viewDidLoad() {
        super.viewDidLoad()

        SetupView()
        // Do any additional setup after loading the view.
    }
    
    func SetupView()
    {
//        parser.request(URL_String: "https://staycured-clinic.azurewebsites.net/API/Login", MethodType: "POST", modelType: LoginResponse.self, parameters: [ "username" : "+918526062100","passwords" : "534297"]){ data in
////            self.Saloons = data
//            print(data)
//        }
        parser.request(URL_String: "http://54.172.137.151:81/api/Saloons/GetSaloons", MethodType: "POST", modelType: [Barbershops].self, parameters:[:]){ data in
            self.Saloons = data
            print(data,"===")
        }
        parser.request(URL_String: "http://54.172.137.151:81/api/Saloons/AddSaloons", MethodType: "POST", modelType: CommonResponse.self, parameters:["saloonId": "125","barberId": "2","name": "raja","mobileNumber": "7867986598","address": "sivanandhacolony","services": "haicut","setvicesCount": 0]){ data in
            self.Common_Response = data
            print(data,"cr===")
        }
        self.title = "Nearby Saloons"
        DispatchQueue.main.async { [self] in
            topView.applyGradient()
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

// MARK: - TableView Delegate Methods
extension NearBySaloonsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? nearBySaloonsTableViewCell else{
            return UITableViewCell()
        }
//        cell.saloonName.text = Saloons[indexPath.row].name
//        cell.saloonName.text = Saloons[indexPath.row].name
        cell.bookButton.tag = indexPath.row
        cell.bookButton.addTarget(self, action: #selector(BookAction(sender:)), for: .touchUpInside)
        return cell
    }
    
    @objc func BookAction(sender: UIButton){
        if let vc = storyboard?.instantiateViewController(withIdentifier: "SaloonServicesViewController") as? SaloonServicesViewController{
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
