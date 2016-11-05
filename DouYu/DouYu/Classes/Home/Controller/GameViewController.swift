//
//  GameViewController.swift
//  DouYu
//
//  Created by 杨小佳 on 2016/10/28.
//  Copyright © 2016年 杨小佳. All rights reserved.
//

import UIKit

private let kEdgeMargin : CGFloat = 10
private let kItemW : CGFloat = (kScreenW - 2 * kEdgeMargin) / 3
private let kItemH : CGFloat = kItemW * 6 / 5
private let kHeaderViewH : CGFloat = 50

private let kgameViewH : CGFloat = 90


private let kGameCellID = "kGameCellID"
private let kHeaderViewID = "kHeaderViewID"

class GameViewController: BaseViewController {
    
     //MARK: - 懒加载属性
    fileprivate lazy var gameVM : GameViewModel = GameViewModel()
    fileprivate lazy var collectionView : UICollectionView = {[unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemW, height: kItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: kEdgeMargin, bottom: 0, right: kEdgeMargin)
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)
        
       let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.register(UINib(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
        collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
         collectionView.contentInset = UIEdgeInsets(top: kHeaderViewH + kgameViewH, left: 0, bottom: 0, right: 0)
        return collectionView
    }()
    fileprivate lazy var topHeaderView : CollectionHeaderView = {
       let headerView = CollectionHeaderView.collectionHeaderView()
        headerView.frame = CGRect(x: 0, y: -(kHeaderViewH + kgameViewH), width: kScreenW, height: kHeaderViewH)
        headerView.iconImageView.image = UIImage(named: "Img_orange")
        headerView.titleLabel.text = "常用"
        headerView.moreBtn.isHidden = true
        return headerView
    }()
    fileprivate lazy var gameView : RecommendGameView = {
       let gameView = RecommendGameView.recommendGameView()
        gameView.frame = CGRect(x: 0, y: -kgameViewH, width: kScreenW, height: kgameViewH)
        return gameView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
 
        setupUI()
        loadData()
        
      
    }
}

extension GameViewController {
    internal override func setupUI() {
        contentView = collectionView
        
        view.addSubview(collectionView)
        collectionView.addSubview(topHeaderView)
        collectionView.addSubview(gameView)
       
        super.setupUI()
    }
}

//MARK: - 请求数据
extension GameViewController {
    fileprivate func loadData() {
        //展示全部游戏
        gameVM.loadAllGameData { 
            self.collectionView.reloadData()
            
        //展示常用游戏
        self.gameView.groups = Array(self.gameVM.games[0..<10])
            

            self.loadDataFinished()
        }
    }
}

extension GameViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameVM.games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath) as! CollectionGameCell
 
        let gameModel = gameVM.games[indexPath.item]
        cell.baseGame = gameModel
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        //取出HeaderView
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath) as! CollectionHeaderView
        //给headerView设置属性
        headerView.titleLabel.text = "全部"
        headerView.iconImageView.image = UIImage(named: "Img_orange")
        headerView.moreBtn.isHidden = true
        
        return headerView
    }
}
