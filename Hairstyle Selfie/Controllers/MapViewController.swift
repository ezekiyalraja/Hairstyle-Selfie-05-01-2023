//
//  MapViewController.swift
//  Hairstyle Selfie
//
//  Created by iOS Developer on 23/12/22.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    @IBOutlet var segmentControl: UISegmentedControl!

    @IBOutlet var view1: UIView!
    @IBOutlet var view2: UIView!
    
    @IBOutlet var stackView: UIStackView!
    
    @IBOutlet fileprivate weak var mapView: GMSMapView!
    
    @IBOutlet var saloonListTableView: UITableView!
    
    // MARK: - Properties
    var views = [UIView]()
    var VM = DashboardViewModel()
    var SaloonarrayData = Saloons()
    var phone = saloonPhone()
    var SaloonArray = [Results]()
    private var locationManager = CLLocationManager()
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        MapApiCall()
        
    }
    
    // MARK: - SetUp View
    
    func setUpView(){
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        self.title = "Nearby Saloon"
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture(gesture:)))
        swipeRight.direction = .right
        self.stackView.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action:  #selector(handleGesture(gesture:)))
        swipeLeft.direction = .left
        self.stackView.addGestureRecognizer(swipeLeft)
        
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(named: "Text")!], for: UIControl.State.normal)
        
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
        
        view2.isHidden = true
        
        views = [view1, view2]
    }
    
    // MARK: - Map Methods
    func MapApiCall()
    {
        VM.apiToGetSaloon{[self] in
            self.SaloonarrayData = (self.VM.SaloonData)
            self.SaloonArray = (self.SaloonarrayData.results)
            print(self.SaloonarrayData.results)
            DispatchQueue.main.async
            { [self] in
                
                
                for i in self.SaloonArray
                        
                {
                    
                    let location = CLLocationCoordinate2D(latitude: i.geometry.location.lat, longitude: i.geometry.location.lng)
                    self.showMarker(position: location)
                    
                    
                }
                self.saloonListTableView.reloadData()
            }
//
//            VM.apiToGetPhoneNumber{[self] in
//                self.phone = (self.VM.SaloonPhoneData)
//
//                print("--------------",phone.result?["international_phone_number"] ?? "nil")
//            }
        }
    }
    
    func showMarker(position: CLLocationCoordinate2D){
        let marker = GMSMarker()
        marker.position = position
        marker.title = "Palo Alto"
        marker.snippet = "San Francisco"
        marker.map = mapView
    }

    // MARK: - Other Methods
    func SwitchView(_ index: Int){
        
        DispatchQueue.main.async { [self] in
            view1.isHidden = true
            view2.isHidden = true
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
        default:
            break
        }
    }
    
    
    // MARK: - Swipe Gesture
    @objc func handleGesture(gesture: UISwipeGestureRecognizer){
        if segmentControl.selectedSegmentIndex >= 0 && segmentControl.selectedSegmentIndex < 2{
            if gesture.direction == UISwipeGestureRecognizer.Direction.right{
                if segmentControl.selectedSegmentIndex != 0{
                    segmentControl.selectedSegmentIndex = segmentControl.selectedSegmentIndex - 1
                    SwitchView(segmentControl.selectedSegmentIndex)
                    view.endEditing(true)
                }
            }
            
            if gesture.direction == UISwipeGestureRecognizer.Direction.left{
               
                if segmentControl.selectedSegmentIndex != 1{
                    segmentControl.selectedSegmentIndex = segmentControl.selectedSegmentIndex + 1
                    SwitchView(segmentControl.selectedSegmentIndex)
                    view.endEditing(true)
                }
            }
            
        }
    }
    

}

// MARK: - TableView Delegate Methods

extension MapViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.SaloonarrayData.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? nearBySaloonsTableViewCell else{
            return UITableViewCell()
        }
        let saloonObj = SaloonarrayData.results[indexPath.row]
        cell.saloonName.text = saloonObj.name
        cell.saloonAddress.text = saloonObj.vicinity
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
// MARK: - Current Location Extention
extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {
            return
        }
        locationManager.startUpdatingLocation()
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
          
        mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
        locationManager.stopUpdatingLocation()
    }
}
