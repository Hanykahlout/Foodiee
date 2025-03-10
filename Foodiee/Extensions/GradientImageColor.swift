//
//  GradientImageColor.swift
//  Foodiee
//
//  Created by macbook on 2020. 11. 18..
//  Copyright © 2020. Hany Kh. All rights reserved.
//

import UIKit

struct GradientPoint {
   var location: CGFloat
   var color: UIColor
}

// for GradientImageColor
extension UIImage {
    
convenience init?(size: CGSize, gradientPoints: [GradientPoint]) {
    UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)

    guard let context = UIGraphicsGetCurrentContext() else { return nil }
    guard let gradient = CGGradient(colorSpace: CGColorSpaceCreateDeviceRGB(), colorComponents: gradientPoints.compactMap { $0.color.cgColor.components }.flatMap { $0 }, locations: gradientPoints.map { $0.location }, count: gradientPoints.count) else {
        return nil
    }

    context.drawLinearGradient(gradient, start: CGPoint.zero, end: CGPoint(x: 0, y: size.height), options: CGGradientDrawingOptions())
    guard let image = UIGraphicsGetImageFromCurrentImageContext()?.cgImage else { return nil }
    self.init(cgImage: image)
    defer { UIGraphicsEndImageContext() }
}
}


extension UIImageView {
   func gradated(gradientPoints: [GradientPoint]) {
    let gradientMaskLayer       = CAGradientLayer()
    gradientMaskLayer.frame     = frame
    gradientMaskLayer.colors    = gradientPoints.map { $0.color.cgColor }
    gradientMaskLayer.locations = gradientPoints.map { $0.location as NSNumber }
    self.layer.insertSublayer(gradientMaskLayer, at: 0)
}
    
}
