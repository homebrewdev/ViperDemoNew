//
//  SpringAnimation.swift
//  stackOFlowApp
//
//  Created by Egor Devyatov on 26/09/2019.
//  Copyright © 2019 Egor Devyatov. All rights reserved.
//

import UIKit

extension UIView {
    func springButtonAnimation(animatedElement: UIButton, duration: Double) {
        animatedElement.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
        UIView.animate(withDuration: duration,
                       delay: 0,
                       usingSpringWithDamping: CGFloat(0.10),
                       initialSpringVelocity: CGFloat(3.0),
                       options: UIView.AnimationOptions.allowUserInteraction,
                       animations: {
                            animatedElement.transform = CGAffineTransform.identity
        })
    }
    
    func springViewAnimation(animatedElement: UIView, duration: Double) {
        animatedElement.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
        UIView.animate(withDuration: duration,
                       delay: 0,
                       usingSpringWithDamping: CGFloat(0.20),
                       initialSpringVelocity: CGFloat(2.0),
                       options: UIView.AnimationOptions.allowUserInteraction,
                       animations: {
                            animatedElement.transform = CGAffineTransform.identity
        })
    }
}
