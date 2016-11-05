//
//  AmuseViewController.swift
//  DouYu
//
//  Created by 杨小佳 on 2016/11/1.
//  Copyright © 2016年 杨小佳. All rights reserved.
//

import UIKit

private let kMenuViewH : CGFloat = 200

class AmuseViewController: BaseAnchorViewController {

     //MARK: - 懒加载属性
    fileprivate lazy var amuseVM : AmuseViewModel = AmuseViewModel()
    fileprivate lazy var menuView : AmuseMenuView = {
        let menuView = AmuseMenuView.amuseMenuView()
        menuView.frame = CGRect(x: 0, y: -kMenuViewH, width: kScreenW, height: kMenuViewH)
        menuView.autoresizingMask = UIViewAutoresizing()
        return menuView
    }()
}

extension AmuseViewController {
    override func setupUI() {
        super.setupUI()
        
        collectionView.addSubview(menuView)
        collectionView.contentInset = UIEdgeInsets(top: kMenuViewH, left: 0, bottom: 0, right: 0)
    }
}

extension AmuseViewController {
    override func loadData() {
        
        baseVM = amuseVM
        
        amuseVM.loadAmuseData { 
            self.collectionView.reloadData()
            
            var tempGroups = self.amuseVM.anchorGroups
            tempGroups.removeFirst()
            
            self.menuView.groups = tempGroups
         
            self.loadDataFinished()
        }
    }
}


