//
//  MainTabbarViewController.swift
//  Hairstyle Selfie
//
//  Created by iOS Developer on 20/12/22.
//

import UIKit

class MainTabbarViewController: UIViewController {
    
    @IBOutlet var view1: UIView!
    @IBOutlet var view2: UIView!
    @IBOutlet var view3: UIView!
    @IBOutlet var view4: UIView!
    
    @IBOutlet var cameraButton: UIButton!
    
    @IBOutlet var tabBar: CustomizedTabBar!
    
    // MARK: - Properties
    var counter = 0
    let tabBarTitles = ["Home", "Gallery", "Appointments", "Account"]
    override func viewDidLoad() {
        super.viewDidLoad()
 
        setUpView()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - setUp View
    
    func setUpView(){
        if let tabTitles = self.tabBar.items
        {
            tabBar.selectedItem = tabTitles[0]
            tabTitles[0].title = "Home"
            self.title = "Home"
        }
        view1.isHidden = false
        view2.isHidden = true
        view3.isHidden = true
        view4.isHidden = true
        
        cameraButton.addBorder(radius: 30, borderColor: UIColor.white, borderWidth: 0)
        cameraButton.dropShadow()
    }
    
    
    
    // MARK: - Button Actions
    
    @IBAction func cameraAction(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "CameraViewController") as? CameraViewController{
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

// MARK: - TabBar Delegate Methods
extension MainTabbarViewController:UITabBarDelegate{
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let views = [view1 ,view2, view3, view4]
        if item.tag != 5{
            if item.tag != counter{
                if let tabTitles = self.tabBar.items
                {
                    for i in tabTitles{
                        i.title = ""
                    }
                    if item.tag == 2 || item.tag == 3{
                        tabTitles[item.tag + 1].title = tabBarTitles[item.tag]
                        self.title = tabBarTitles[item.tag]
                    }else{
                        tabTitles[item.tag].title = tabBarTitles[item.tag]
                        self.title = tabBarTitles[item.tag]
                    }
                    
                }
                
                view1.isHidden = true
                view2.isHidden = true
                view3.isHidden = true
                view4.isHidden = true
                
                
                views[item.tag]?.isHidden = false
                
                counter = item.tag
                
                
            }
        }
    }
}
        
