//
//  Extensions.swift
//  FruitHub
//
//  Created by Vijay Parmar on 28/08/23.
//

import Foundation
import UIKit


@IBDesignable extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set {
            layer.cornerRadius = newValue
            
            // If masksToBounds is true, subviews will be
            // clipped to the rounded corners.
            layer.masksToBounds = (newValue > 0)
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            guard let cgColor = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: cgColor)
        }
        set { layer.borderColor = newValue?.cgColor }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var shadowColor: UIColor {
        get {
            return UIColor(cgColor: layer.shadowColor!)
        }
        set {
            layer.shadowColor = newValue.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    
    func addShadow() {
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
    }
    
    @IBInspectable
    /// Border width of view; also inspectable from Storyboard.
    
    public var isShadowView: Bool {
        set {
            if newValue {
                layer.masksToBounds = false
                layer.shadowOffset = CGSize(width: 2, height: 2)
                layer.shadowColor = shadowColor.cgColor
                layer.shadowRadius = 2
                layer.shadowOpacity = 0.4
                
                let backgroundCGColor = backgroundColor?.cgColor
                backgroundColor = nil
                layer.backgroundColor =  backgroundCGColor
            }
            else {
                layer.shadowRadius = 0
                layer.shadowOpacity = 0.0
            }
        }
        get {
            return layer.shadowRadius == 2 ? true : false
        }
    }
    
    
}


extension UIApplication {
    class var statusBarBackgroundColor: UIColor? {
        get {
            return (shared.value(forKey: "statusBar") as? UIView)?.backgroundColor
        } set {
            (shared.value(forKey: "statusBar") as? UIView)?.backgroundColor = newValue
        }
    }
}

extension UIColor{
    static let appColor = UIColor(named: "color_orange")
    
    static let colorBold = UIColor(named: "color_bold")
    
    static let colorTitle = UIColor(named: "color_title")
    
    
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}


extension UIFont{
    
   static func BrandonGrotesqueMedium(withSize:CGFloat)->UIFont{
        return UIFont(name: "BrandonGrotesque-Medium", size: withSize) ?? UIFont.systemFont(ofSize: withSize)
    }
    
    
}
