//
//  homeCollectionViewCell.swift
//  Hairstyle Selfie
//
//  Created by iOS Developer on 21/12/22.
//

import UIKit

class homeCollectionViewCell: UICollectionViewCell {
    override func layoutSubviews() {
        // cell rounded section
        self.layer.cornerRadius = 7.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor(named: "Text")?.cgColor
        self.layer.masksToBounds = true
        
    }
}
