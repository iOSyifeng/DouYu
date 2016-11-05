//
//  AnchorModel.swift
//  DouYu
//
//  Created by 杨小佳 on 2016/10/26.
//  Copyright © 2016年 杨小佳. All rights reserved.
//

import UIKit

class AnchorModel: NSObject {
    //房间号
    var room_id : Int = 0
    //房间图片对应的URL属性
    var vertical_src : String = ""
    //判断是手机直播还是电脑直播
    // 0 : 手机  1 : 电脑
    var isVertical : Int = 0
    //房间名称
    var room_name : String = ""
    //主播昵称
    var nickname : String = ""
    //观看人数
    var online : Int = 0
    //所在城市
    var anchor_city : String = ""
    
    init(dict : [String : Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
}
