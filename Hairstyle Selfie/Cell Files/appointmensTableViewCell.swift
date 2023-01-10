//
//  appointmensTableViewCell.swift
//  Hairstyle Selfie
//
//  Created by iOS Developer on 23/12/22.
//

import UIKit

class appointmensTableViewCell: UITableViewCell {

    @IBOutlet var line: UILabel!
    @IBOutlet var view: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        view.layer.cornerRadius = 7.0
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor(named: "Text")?.cgColor
        view.layer.masksToBounds = true
        view.dropShadow()
        
        DispatchQueue.main.async {
            self.line.applyGradient()
        }
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
