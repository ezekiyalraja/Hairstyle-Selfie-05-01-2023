//
//  GalleryViewController.swift
//  Hairstyle Selfie
//
//  Created by iOS Developer on 21/12/22.
//

import UIKit

class GalleryViewController: UIViewController {

    @IBOutlet var segmentControl: UISegmentedControl!
    
    @IBOutlet var galleryCollectionView: UICollectionView!
    
    @IBOutlet var segmentView: UIView!
    
    // MARK: - Properties
    
    var segmentTag = "public"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()

    }
    
    // MARK: - SetUp View
    
    func setUpView(){
        segmentView.layer.cornerRadius = 8
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(named: "Text")!], for: UIControl.State.selected)
        
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.normal)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        
        galleryCollectionView
            .setCollectionViewLayout(layout, animated: true)
    }
    
    
    // MARK: - Button Actions
    @IBAction func segmentControlAction(_ sender: Any) {
        switch segmentControl.selectedSegmentIndex{
        case 0:
            if segmentTag == "private"{
                galleryCollectionView.reloadData()
                segmentTag = "public"
            }
            break
        case 1:
            if segmentTag == "public"{
                galleryCollectionView.reloadData()
                segmentTag = "private"
            }
            break
        default:
            break
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

// MARK: - CollectionView Delegate & DataSource
extension GalleryViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if segmentTag == "public"{
            return 20
        }else{
            return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? galleryCollectionViewCell else{
            return UICollectionViewCell()
        }
        cell.contentView.alpha = 0
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        UIView.animate(withDuration: 0.5) {
            cell.contentView.alpha = 1
        }
    }
    
}

// MARK: - CollectionView Layouts
extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                  layout collectionViewLayout: UICollectionViewLayout,
                  insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10.0, left: 15.0, bottom: 30.0, right: 15.0)
    }

    func collectionView(_ collectionView: UICollectionView,
                   layout collectionViewLayout: UICollectionViewLayout,
                   sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let lay = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2 - 20
        return CGSize(width: widthPerItem - 8, height: 230)
    }
}
