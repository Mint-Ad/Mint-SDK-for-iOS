//
//  InileViewController.m
//  imobilesample
//
//  Created by i-mobile on 2015/07/08.
//  Copyright (c) 2015年 i-mobile. All rights reserved.
//

#import "InlineViewController.h"

#import <ImobileSdkAds/ImobileSdkAds.h>

@interface InlineViewController ()

@end

@implementation InlineViewController
@synthesize adSize;
@synthesize pid;
@synthesize mid;
@synthesize sid;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // スポット情報を設定します
    [ImobileSdkAds registerWithPublisherID:pid MediaID:mid SpotID:sid];
    
    // デリゲートの登録をします
    [ImobileSdkAds setSpotDelegate:sid delegate:self];
    
    // 広告の取得を開始します
    [ImobileSdkAds startBySpotID:sid];
    
    // 表示する広告のサイズ
    CGSize imobileAdSize = adSize;
    // デバイスの画面サイズ
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    
    // 広告の表示位置を算出(画面中央)
    CGFloat imobileAdPosX = (screenSize.width - imobileAdSize.width) / 2;
    CGFloat imobileAdPosY = (screenSize.height - imobileAdSize.height) / 2;
    
    // 広告を表示するViewを作成します
    UIView *imobileAdView = [[UIView alloc] initWithFrame:CGRectMake(imobileAdPosX, imobileAdPosY, imobileAdSize.width, imobileAdSize.height)];
    //広告を表示するViewをViewControllerに追加します
    [self.view addSubview:imobileAdView];
    // 広告を表示します
    [ImobileSdkAds showBySpotID:sid View:imobileAdView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// 広告の表示準備が完了した際に呼ばれます
- (void)imobileSdkAdsSpot:(NSString *)spotid didReadyWithValue:(ImobileSdkAdsReadyResult)value{
    self.readyLabel.textColor = [UIColor blackColor];
    self.didShowLabel.textColor = [UIColor lightGrayColor];
    self.clickLabel.textColor = [UIColor lightGrayColor];
}

// 広告の表示が完了した際に呼ばれます
- (void)imobileSdkAdsSpotDidShow:(NSString *)spotid{
    self.didShowLabel.textColor = [UIColor blackColor];
}

// 広告をクリックした際に呼ばれます
- (void)imobileSdkAdsSpotDidClick:(NSString *)spotid{
    self.clickLabel.textColor = [UIColor blackColor];
}


@end
