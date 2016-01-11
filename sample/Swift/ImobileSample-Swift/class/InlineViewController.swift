//
//  InlineViewController.swift
//  ImobileSample-Swift
//
//  Created by tsuchiyahiroki on 2015/07/08.
//  Copyright (c) 2015年 i-mobile. All rights reserved.
//

import UIKit

class InlineViewController: UIViewController,IMobileSdkAdsDelegate {
    var pid: String = ""
    var mid: String = ""
    var sid: String = ""
    var adsize : CGSize = CGSizeMake(0, 0)
    
    @IBOutlet weak var readyLabel: UILabel!
    @IBOutlet weak var didShowLabel: UILabel!
    @IBOutlet weak var clickLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // スポット情報を設定します
        ImobileSdkAds.registerWithPublisherID(pid, mediaID:mid, spotID:sid)
        
        // デリゲートの登録
        ImobileSdkAds.setSpotDelegate(sid, delegate: self)
        
        // 広告の取得を開始します
        ImobileSdkAds.startBySpotID(sid)
        
        // 表示する広告のサイズ
        let imobileAdSize = adsize
        // デバイスの画面サイズ
        let screenSize = UIScreen.mainScreen().bounds.size
        
        // 広告の表示位置を算出(画面中央)
        let imobileAdPosX: CGFloat = (screenSize.width - imobileAdSize.width) / 2
        let imobileAdPosY: CGFloat = (screenSize.height - imobileAdSize.height) / 2
        
        // 広告を表示するViewを作成します
        let imobileAdView = UIView(frame: CGRectMake(imobileAdPosX, imobileAdPosY, imobileAdSize.width, imobileAdSize.height))
        //広告を表示するViewをViewControllerに追加します
        self.view.addSubview(imobileAdView)
        // 広告を表示します
        ImobileSdkAds.showBySpotID(sid, view: imobileAdView)
    }
    
    // 広告の表示準備が完了した場合に呼ばれます
    func imobileSdkAdsSpot(spotId: String!, didReadyWithValue value: ImobileSdkAdsReadyResult) {
        readyLabel.textColor = UIColor.blackColor();
        didShowLabel.textColor = UIColor.lightGrayColor()
        clickLabel.textColor = UIColor.lightGrayColor()
    }
    
    // 広告が表示された際に呼ばれます
    func imobileSdkAdsSpotDidShow(spotId: String!){
        didShowLabel.textColor = UIColor.blackColor()
    }
    
    // 広告をクリックした際に呼ばれます
    func imobileSdkAdsSpotDidClick(spotId: String!){
        clickLabel.textColor = UIColor.blackColor()
    }
}

