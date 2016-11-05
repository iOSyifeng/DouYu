//
//  AmuseViewModel.swift
//  DouYu
//
//  Created by 杨小佳 on 2016/11/1.
//  Copyright © 2016年 杨小佳. All rights reserved.
//

import UIKit

class AmuseViewModel : BaseViewModel {
    
}

extension AmuseViewModel {
    func loadAmuseData(finishCallback : @escaping () -> ()) {
         loadAnchorData(isGroupData: true, URLString: "http://capi.douyucdn.cn/api/v1/getHotRoom/2", finishCallback: finishCallback)
       }
}
