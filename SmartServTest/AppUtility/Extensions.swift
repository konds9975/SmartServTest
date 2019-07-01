//
//  Extensions.swift
//  SmartServTest
//
//  Created by Kondya on 01/07/19.
//  Copyright © 2019 Fortune4. All rights reserved.
//

import UIKit

extension UIViewController{
    
    func activityStartAnimating() {
        
        DispatchQueue.main.async {
            let backgroundView = UIView()
            backgroundView.frame = CGRect.init(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
            backgroundView.backgroundColor = .white
            backgroundView.tag = 475647
            var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
            activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.style = UIActivityIndicatorView.Style.gray
            activityIndicator.color = .black
            activityIndicator.startAnimating()
            self.view.isUserInteractionEnabled = false
            backgroundView.addSubview(activityIndicator)
            self.view.addSubview(backgroundView)
        }
    }
    
    func activityStopAnimating() {
        DispatchQueue.main.async {
            if let background = self.view.viewWithTag(475647){
                background.removeFromSuperview()
            }
            self.view.isUserInteractionEnabled = true
        }
    }
    
}

extension String {
    
    func decorateText(sub:String)->NSAttributedString{
        let textAttributesOne = [NSAttributedString.Key.foregroundColor: UIColor.darkText, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)]
        let textAttributesTwo = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)]
        
        let textPartOne = NSMutableAttributedString(string: sub, attributes: textAttributesOne)
        let textPartTwo = NSMutableAttributedString(string: self, attributes: textAttributesTwo)
        
        let textCombination = NSMutableAttributedString()
        textCombination.append(textPartOne)
        textCombination.append(textPartTwo)
        return textCombination
    }
    
}


