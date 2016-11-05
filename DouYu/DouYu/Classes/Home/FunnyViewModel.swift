//
//  FunnyViewModel.swift
//  DouYu
//
//  Created by 杨小佳 on 2016/11/5.
//  Copyright © 2016年 杨小佳. All rights reserved.
//

import UIKit

class FunnyViewModel : BaseViewModel {

}

extension FunnyViewModel {
    func loadFunnyDta(finishCallback : @escaping () -> ()) {
        loadAnchorData(isGroupData: false, URLString: "http://capi.douyucdn.cn/api/v1/getColumnRoom/3", parameters: ["limit" : 30, "offset" : 0], finishCallback: finishCallback)
    }
}
