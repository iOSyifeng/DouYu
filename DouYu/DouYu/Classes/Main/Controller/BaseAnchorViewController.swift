//
//  BaseAnchorViewController.swift
//  DouYu
//
//  Created by 杨小佳 on 2016/11/1.
//  Copyright © 2016年 杨小佳. All rights reserved.
//

import UIKit

private let kItemMargin : CGFloat = 10
private let kHeaderViewH : CGFloat = 50

private let kNormalCellID = "kNormalCellID"
private let kHeaderViewID = "kHeaderViewID"

let kPrettyCellID = "kPrettyCellID"
let kNormalItemW = (kScreenW - 3 * kItemMargin) / 2
let kNormalItemH = kNormalItemW * 3 / 4
let kPrettyItemH = kNormalItemW * 4 / 3

class BaseAnchorViewController: BaseViewController {
    
        var baseVM : BaseViewModel!
    
        lazy var collectionView : UICollectionView = {[unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kNormalItemW, height: kNormalItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = kItemMargin
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        //设置组头
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        // !!!!!这里要注意
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = UIColor.white
        
        collectionView.register(UINib(nibName: "CollectionNormalCell", bundle: nil), forCellWithReuseIdentifier: kNormalCellID)
        collectionView.register(UINib(nibName: "CollectionPrettyCell", bundle: nil), forCellWithReuseIdentifier: kPrettyCellID)
        collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
        
        return collectionView
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
      
        setupUI()
       loadData()
    }
}

//MARK: - 设置UI界面
extension BaseAnchorViewController {
     override func setupUI() {
        contentView = collectionView
        
        view.addSubview(collectionView)
        
        super.setupUI()
        
   
    }
}

extension BaseAnchorViewController {
     func loadData() {
    }
}

extension BaseAnchorViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return baseVM.anchorGroups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return baseVM.anchorGroups[section].anchors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath) as! CollectionNormalCell
        
        cell.anchor = baseVM.anchorGroups[indexPath.section].anchors[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath) as! CollectionHeaderView
      
        headerView.group = baseVM.anchorGroups[indexPath.section]
        
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //1.取出对应的主播信息
        let anchor = baseVM.anchorGroups[indexPath.section].anchors[indexPath.item]
        
        //2.判断房间类型
        anchor.isVertical == 0 ? pushNormalRoomVc() : presentShowRoomVc()
    }
    
    private func presentShowRoomVc() {
        let showRoomVc = RoomShowViewController()
        
        present(showRoomVc, animated: true, completion: nil)
    }
    
    private func pushNormalRoomVc() {
        let normalRoomVc = RoomNormalViewController()
        
        navigationController?.pushViewController(normalRoomVc, animated: true)
    }
}
