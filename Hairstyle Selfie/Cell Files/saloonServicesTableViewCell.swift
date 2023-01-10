//
//  saloonServicesTableViewCell.swift
//  Hairstyle Selfie
//
//  Created by iOS Developer on 08/01/23.
//

import UIKit

class saloonServicesTableViewCell: UITableViewCell {

    @IBOutlet var view: UIView!
    
    @IBOutlet var line: UILabel!
    
    @IBOutlet var addButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        view.dropShadow()
        view.addBorder(radius: 7, borderColor: UIColor(named: "Text")!, borderWidth: 1)
        addButton.addBorder(radius: 15, borderColor: UIColor(named: "Text")!, borderWidth: 1)
        DispatchQueue.main.async {
            self.line.applyGradient()
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        if selected{
            UIView.animate(withDuration: 0.2, animations: {
                self.transform = CGAffineTransform(scaleX: 0.97, y: 0.97)
            }, completion: { finished in
                UIView.animate(withDuration: 0.2) {
                    self.transform = .identity
                }
            })
        }
    }

}
