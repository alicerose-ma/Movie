//
//  SpinnerViewModel1.swift
//  Movie
//
//  Created by Ma Alice on 5/30/20.
//  Copyright © 2020 Ma Alice. All rights reserved.
//

import Foundation
import UIKit

class SpinnerViewModel {

var activityIndicator = UIActivityIndicatorView()
var strLabel = UILabel()
let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
let effectView1 = UIVisualEffectView(effect: UIBlurEffect(style: .dark))

func createSpinner(view: UIView, _ title: String) {
    strLabel.removeFromSuperview()
    activityIndicator.removeFromSuperview()
    effectView.removeFromSuperview()
    
    strLabel = UILabel(frame: CGRect(x: 50, y: 0, width: 120, height: 46))
    strLabel.text = title
    strLabel.font = .systemFont(ofSize: 14, weight: .medium)
    strLabel.textColor = UIColor(white: 0.9, alpha: 0.7)
    
    activityIndicator.style = .medium
    activityIndicator.color = .white
    activityIndicator.frame = CGRect(x: 0, y: 0, width: 46, height: 46)
    activityIndicator.startAnimating()

    effectView.frame = CGRect(x: view.frame.midX - strLabel.frame.width/2, y: view.frame.midY - strLabel.frame.height/2 , width: 120, height: 46)
    effectView.layer.cornerRadius = 15
    effectView.layer.masksToBounds = true

 
    effectView.contentView.addSubview(activityIndicator)
    effectView.contentView.addSubview(strLabel)
    view.addSubview(effectView)

}

func removeSpinner(){
    DispatchQueue.main.async {
        self.strLabel.removeFromSuperview()
        self.activityIndicator.removeFromSuperview()
        self.effectView.removeFromSuperview()
    }
}
}
