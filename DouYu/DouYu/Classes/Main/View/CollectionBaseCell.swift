//
//  CollectionBaseCell.swift
//  DouYu
//
//  Created by 杨小佳 on 2016/10/28.
//  Copyright © 2016年 杨小佳. All rights reserved.
//

import UIKit

class CollectionBaseCell: UICollectionViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var onlineBtn: UIButton!
    @IBOutlet weak var nickNameLabel: UILabel!
    
    var anchor : AnchorModel? {
        didSet {
            //0.校验模型是否有值
            guard let anchor = anchor else {return}
            
            var onlineStr : String = ""
            if anchor.online >= 10000 {
                onlineStr = "\(Int(anchor.online / 10000))万在线"
            } else {
                onlineStr = "\(anchor.online)在线"
            }
            
            onlineBtn.setTitle(onlineStr, for: .normal)
            
            nickNameLabel.text = anchor.nickname
            
            guard let iconUrl = URL(string: anchor.vertical_src) else {return}
            iconImageView.kf.setImage(with: iconUrl)
            
        }
    }

}
