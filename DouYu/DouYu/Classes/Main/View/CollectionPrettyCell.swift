//
//  CollectionPrettyCell.swift
//  DYZB
//
//  Created by 1 on 16/9/18.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import UIKit
import Kingfisher


class CollectionPrettyCell: CollectionBaseCell {
   
    @IBOutlet weak var cityBtn: UIButton!
  
    
    
    override var anchor : AnchorModel? {
        didSet {
            //将属性传递给父类
            super.anchor = anchor
           
            cityBtn.setTitle(anchor?.anchor_city, for: .normal)
            
    
        }
    }

}
