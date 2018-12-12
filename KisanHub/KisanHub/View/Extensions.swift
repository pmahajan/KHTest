//
//  Extensions.swift
//  KisanHub
//
//  Created by Praful Mahajan on 12/11/18.
//  Copyright © 2018 prafulmahajan. All rights reserved.
//
import Foundation
import UIKit

@IBDesignable class CustomTextField: UITextField {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
            if !self.isUserInteractionEnabled || !self.isEnabled {
                layer.borderColor = uiColor.withAlphaComponent(0.63).cgColor
            }
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
    
    var textFieldBorderStyle: UITextField.BorderStyle = .roundedRect
    
    // Provides left padding for image
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += 10
        return textRect
    }
    
    // Provides right padding for image
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x -= 10
        return textRect
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + paddingLeft, y: bounds.origin.y, width: bounds.size.width - paddingLeft - paddingRight, height: bounds.size.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
    
    @IBInspectable var LeftImage: UIImage? = nil {
        didSet {
            addLeftView()
        }
    }
    @IBInspectable var RightImage: UIImage? = nil {
        didSet {
            addRightView()
        }
    }
    
    @IBInspectable var paddingLeft: CGFloat = 10
    @IBInspectable var paddingRight: CGFloat = 10
    
    func addLeftView() {
        
        if let image = LeftImage {
            let viewLeft: UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: self.frame.size.height))
            leftViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 5, y: self.frame.size.height/2-7.5, width: 15, height: 15))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            viewLeft.addSubview(imageView)
            
            leftView = viewLeft
            
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }
    }
    
    func removeRightView() {
        
        self.textColor = UIColor.darkGray.withAlphaComponent(1)
        rightViewMode = UITextField.ViewMode.never
        rightView = nil
        paddingRight = 10
    }
    
    func addRightView() {
        
        if let image = RightImage {
            let viewLeft: UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 20, height: self.frame.size.height))
            rightViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: self.frame.size.height/2-6, width: 15, height: 15))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            imageView.isUserInteractionEnabled = true
            viewLeft.addSubview(imageView)
            rightView = viewLeft
            
        } else {
            rightViewMode = UITextField.ViewMode.never
            rightView = nil
        }
    }
}
