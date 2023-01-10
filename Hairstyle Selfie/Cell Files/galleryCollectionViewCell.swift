//
//  galleryCollectionViewCell.swift
//  Hairstyle Selfie
//
//  Created by iOS Developer on 22/12/22.
//

import UIKit

class galleryCollectionViewCell: UICollectionViewCell {
    override func layoutSubviews() {
        // cell rounded section
        self.contentView.layer.cornerRadius = 7.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor(named: "Text")?.cgColor
        self.contentView.layer.masksToBounds = true
        
    }
}
