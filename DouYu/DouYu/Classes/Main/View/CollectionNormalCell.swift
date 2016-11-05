//
//  CollectionNormalCell.swift
//  DYZB
//
//  Created by 1 on 16/9/18.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import UIKit

class CollectionNormalCell: CollectionBaseCell {
    

    @IBOutlet weak var roomNameLabel: UILabel!

     //MARK: - 定义模型属性
   override var anchor : AnchorModel? {
        didSet {
            super.anchor = anchor
            
            roomNameLabel.text = anchor?.room_name
        }
    }

}
