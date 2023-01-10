//
//  AddressTableViewCell.swift
//  Hairstyle Selfie
//
//  Created by iOS Developer on 03/01/23.
//

import UIKit

class AddressTableViewCell: UITableViewCell {
    @IBOutlet var Name: UILabel!
    @IBOutlet var Address: UILabel!
    @IBOutlet var Landmark: UILabel!
    @IBOutlet var Pincode: UILabel!
    @IBOutlet var view: UIView!
    @IBOutlet var line: UILabel!
    @IBOutlet var LocationButton: UIButton!
    @IBOutlet var AddressTypeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        view.layer.cornerRadius = 7.0
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor(named: "Text")?.cgColor
        view.layer.masksToBounds = true
        view.dropShadow()
        
        DispatchQueue.main.async {
            self.line.applyGradient()
        }
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected{
            UIView.animate(withDuration: 0.2, animations: {
                self.transform = CGAffineTransform(scaleX: 0.97, y: 0.97)
            }, completion: { finished in
                UIView.animate(withDuration: 0.2) {
                    self.transform = .identity
                }
            })
        }
        // Configure the view for the selected state
    }
    
}
