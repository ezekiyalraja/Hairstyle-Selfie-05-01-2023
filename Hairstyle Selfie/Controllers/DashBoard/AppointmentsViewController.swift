//
//  AppointmentsViewController.swift
//  Hairstyle Selfie
//
//  Created by iOS Developer on 21/12/22.
//

import UIKit

class AppointmentsViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var segmentControl: UISegmentedControl!
    
    @IBOutlet var view2: UIView!
    @IBOutlet var view1: UIView!
    @IBOutlet var view3: UIView!
    
    @IBOutlet var upcomingTableView: UITableView!
    @IBOutlet var cancelledTableView: UITableView!
    @IBOutlet var completedTableView: UITableView!
    
    @IBOutlet var addAppointmentButton: UIButton!
    
    // MARK: - Properties
    var views = [UIView]()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - SetUp View
    
    func setUpView(){
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture(gesture:)))
        swipeRight.direction = .right
        self.stackView.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action:  #selector(handleGesture(gesture:)))
        swipeLeft.direction = .left
        self.stackView.addGestureRecognizer(swipeLeft)
        
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(named: "Text")!], for: UIControl.State.normal)
        
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
        
        
        segmentControl.tintColor = .blue
        segmentControl.removeBorders()
        
        addAppointmentButton.layer.cornerRadius = 25
        addAppointmentButton.dropShadow()
        
        view2.isHidden = true
        view3.isHidden = true
        
        views = [view1, view2, view3]
        
        upcomingTableView.register(UINib(nibName: "appointmensTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        cancelledTableView.register(UINib(nibName: "appointmensTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        completedTableView.register(UINib(nibName: "appointmensTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    // MARK: - Other Methods
    func SwitchView(_ index: Int){
        
        DispatchQueue.main.async { [self] in
            view1.isHidden = true
            view2.isHidden = true
            view3.isHidden = true
            UIView.animate(withDuration: 0.5,
                           delay: 0.0,
                           usingSpringWithDamping: 0.9,
                           initialSpringVelocity: 1,
                           options: [],
                           animations: { [self] in
                
                
                views[index].isHidden = false
                stackView.layoutIfNeeded()
                
                
            },
                           completion: nil)
        }
    }
    
    // MARK: - Button Actions
    @IBAction func segmentControlAction(_ sender: Any) {
        
        switch segmentControl.selectedSegmentIndex{
        case 0:
                SwitchView(segmentControl.selectedSegmentIndex)
            break
        case 1:
                SwitchView(segmentControl.selectedSegmentIndex)
            break
        case 2:
                SwitchView(segmentControl.selectedSegmentIndex)
            break
        default:
            break
        }
    }
    
    @IBAction func addAppointmentAction(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "NearBySaloonsViewController") as? NearBySaloonsViewController{
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    // MARK: - Swipe Gesture
    @objc func handleGesture(gesture: UISwipeGestureRecognizer){
        if segmentControl.selectedSegmentIndex >= 0 && segmentControl.selectedSegmentIndex < 3{
            if gesture.direction == UISwipeGestureRecognizer.Direction.right{
                if segmentControl.selectedSegmentIndex != 0{
                    segmentControl.selectedSegmentIndex = segmentControl.selectedSegmentIndex - 1
                    SwitchView(segmentControl.selectedSegmentIndex)
                    view.endEditing(true)
                }
            }
            
            if gesture.direction == UISwipeGestureRecognizer.Direction.left{
               
                if segmentControl.selectedSegmentIndex != 2{
                    segmentControl.selectedSegmentIndex = segmentControl.selectedSegmentIndex + 1
                    SwitchView(segmentControl.selectedSegmentIndex)
                    view.endEditing(true)
                }
            }
            
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

// MARK: - TableView Delegate & DataSource

extension AppointmentsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == upcomingTableView{
            return 10
        }else if tableView == cancelledTableView{
            return 3
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? appointmensTableViewCell else{
            return UITableViewCell()
        }
        if tableView == upcomingTableView{
            return cell
        }else if tableView == cancelledTableView{
            return cell
        }else{
            return cell
        }
    }
    
    
}
