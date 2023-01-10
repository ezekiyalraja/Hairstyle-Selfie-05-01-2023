//
//  HomeViewController.swift
//  Hairstyle Selfie
//
//  Created by iOS Developer on 21/12/22.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet var line1: UILabel!
    @IBOutlet var line2: UILabel!
    
    @IBOutlet var gradiantView: UIView!
    @IBOutlet var view1: UIView!
    @IBOutlet var view2: UIView!
    @IBOutlet var view3: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - SetUp View
    
    func setUpViews(){
        ApplyGradient()
        addBorders()
    }
    
    func ApplyGradient(){
        DispatchQueue.main.async { [self] in
            
            line1.applyGradient()
            line2.applyGradient()
            gradiantView.applyGradient()
            
        }
    }
    
    func addBorders(){
        
        DispatchQueue.main.async { [self] in
            view1.addBorder(radius: 8, borderColor: UIColor.black, borderWidth: 1)
            view2.addBorder(radius: 8, borderColor: UIColor.black, borderWidth: 1)
            view3.addBorder(radius: 8, borderColor: UIColor.black, borderWidth: 1)
        }
        
    }
    
    // MARK: - Button Actions
    
    @IBAction func mapAction(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "MapViewController") as? MapViewController{
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

}

// MARK: - CollectionView Delegate & DataSounrce
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? homeCollectionViewCell else{
            return UICollectionViewCell()
        }
        return cell
    }
    
    
}
