//
//  BaseViewController.swift
//  DouYu
//
//  Created by 杨小佳 on 2016/11/5.
//  Copyright © 2016年 杨小佳. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var contentView : UIView?

    fileprivate lazy var animaImageView : UIImageView = { [unowned self] in
        let imageView = UIImageView(image: UIImage(named : "img_loading_1"))
        imageView.center = self.view.center
        imageView.animationImages = [UIImage(named : "img_loading_1")!, UIImage(named : "img_loading_2")!]
        imageView.animationDuration = 0.5
        imageView.animationRepeatCount = LONG_MAX
        imageView.autoresizingMask = [.flexibleBottomMargin, .flexibleTopMargin]
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupUI()
    }
}

extension BaseViewController {
     func setupUI() {
        contentView?.isHidden = true
        
        view.addSubview(animaImageView)
        
        animaImageView.startAnimating()
        
        view.backgroundColor = UIColor(r: 250, g: 250, b: 250)
    }
    
    func loadDataFinished() {
        animaImageView.stopAnimating()
        
        animaImageView.isHidden = true
        
        contentView?.isHidden = false
    }
}
