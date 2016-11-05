//
//  BaseViewModel.swift
//  DouYu
//
//  Created by 杨小佳 on 2016/11/1.
//  Copyright © 2016年 杨小佳. All rights reserved.
//

import UIKit

class BaseViewModel {
   lazy var anchorGroups : [AnchorGroup] = [AnchorGroup]()
}

extension BaseViewModel {
    func loadAnchorData(isGroupData : Bool, URLString : String, parameters : [String : Any]? = nil, finishCallback : @escaping () -> ()) {
        NetworkTools.requestData(.get, URLString: URLString, parameters: parameters) { (result) in
            
            guard let resultDict = result as? [String : Any] else {return}
            guard let dataArr = resultDict["data"] as? [[String : Any]] else {return}
            
            if isGroupData {
                for dict in dataArr {
                    self.anchorGroups.append(AnchorGroup(dict: dict))
                }
                
            } else {
                let group = AnchorGroup()
                
                for dict in dataArr {
                    group.anchors.append(AnchorModel(dict: dict))
                }
                
                self.anchorGroups.append(group)
            }
            
            finishCallback()
        }
    }

    }
