//
//  nearBySaloonsTableViewCell.swift
//  Hairstyle Selfie
//
//  Created by iOS Developer on 04/01/23.
//

import UIKit

class nearBySaloonsTableViewCell: UITableViewCell {

    @IBOutlet var view: UIView!
    
    @IBOutlet var line: UILabel!
    @IBOutlet var saloonName: UILabel!
    @IBOutlet var saloonAddress: UILabel!
    
    @IBOutlet var bookButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        view.layer.cornerRadius = 7.0
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor(named: "Text")?.cgColor
        view.layer.masksToBounds = true
        view.dropShadow()
        bookButton.addBorder(radius: 15, borderColor: UIColor(named: "Text")!, borderWidth: 1)
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
