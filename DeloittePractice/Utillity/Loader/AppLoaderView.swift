//
//  AppLoaderView.swift
//  Gopher
//
//  Created by Sourabh Bhawsar on 10/10/18.
//  Copyright © 2018 Dinosoft. All rights reserved.
//

import UIKit

class AppLoaderView: UIView {

    @IBOutlet var loaderImageView: UIImageView!

    override func draw(_ rect: CGRect) {
        
        //let imageData = try! Data(contentsOf: Bundle.main.url(forResource: "appLoader", withExtension: "gif")!)
       // loaderImageView.image = UIImage.sd_animatedGIF(with: imageData)
        
    }
}

