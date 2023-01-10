//
//  Extentions.swift
//  Hairstyle Selfie
//
//  Created by iOS Developer on 21/12/22.
//

import Foundation
import UIKit

extension UIView{
    func dropShadow(opacity: Float = 0.5, radius: CGFloat = 0, scale: Bool = true) {
        self.clipsToBounds = true
        self.layer.masksToBounds = false
//        self.layer.cornerRadius = 15
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 5
        
    }
    
    func addBorder(radius: CGFloat, borderColor: UIColor, borderWidth: CGFloat){
        layer.cornerRadius = radius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        self.clipsToBounds = true
    }
    
    func applyGradient() {
        
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor(named: "Text")?.cgColor as Any,
            UIColor(named: "Background")?.cgColor as Any]   // your colors go here
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x : 0.0, y : 0.5)
        gradient.endPoint = CGPoint(x :1.0, y: 0.5)
        gradient.frame = self.bounds
        self.layer.insertSublayer(gradient, at: 0)
        
    }
    
}

extension UISegmentedControl {
    func removeBorders() {
        
        setDividerImage(imageWithColor(color: UIColor.black), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
    }

    // create a 1x1 image with this color
    private func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRectMake(0.0, 0.0, 1.0, 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return UIImage() }
        UIGraphicsEndImageContext()
        return image
    }
}


extension UIViewController: UITextFieldDelegate{
    func addToolBar(textField: UITextField){
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.systemBlue
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(donePressed))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBar.setItems([ spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()

        textField.delegate = self
        textField.inputAccessoryView = toolBar
    }
    @objc func donePressed(){
        view.endEditing(true)
    }
    func cancelPressed(){
        view.endEditing(true) // or do something
    }
}
