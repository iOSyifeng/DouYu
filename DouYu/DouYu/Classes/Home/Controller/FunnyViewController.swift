//
//  FunnyViewController.swift
//  DouYu
//
//  Created by 杨小佳 on 2016/11/5.
//  Copyright © 2016年 杨小佳. All rights reserved.
//

import UIKit

private let kTopMargin : CGFloat = 8

class FunnyViewController: BaseAnchorViewController {
    fileprivate lazy var funnyVM : FunnyViewModel = FunnyViewModel()

    
}

extension FunnyViewController {
    override func setupUI() {
        super.setupUI()
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.headerReferenceSize = CGSize.zero
        collectionView.contentInset = UIEdgeInsets(top: kTopMargin, left: 0, bottom: 0, right: 0)
    }
}

extension FunnyViewController {
    override func loadData() {
        baseVM = funnyVM
        
        funnyVM.loadFunnyDta { 
            self.collectionView.reloadData()
            
            self.loadDataFinished()
        }
    }
}
