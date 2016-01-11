//
//  InileViewController.h
//  imobilesample
//
//  Created by i-mobile on 2015/07/08.
//  Copyright (c) 2015年 i-mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <ImobileSdkAds/ImobileSdkAds.h>

@interface InlineViewController : UIViewController <IMobileSdkAdsDelegate>

@property (nonatomic) CGSize adSize;
@property (nonatomic) NSString *pid;
@property (nonatomic) NSString *mid;
@property (nonatomic) NSString *sid;

//イベントの管理用
@property (weak, nonatomic) IBOutlet UILabel *readyLabel;
@property (weak, nonatomic) IBOutlet UILabel *didShowLabel;
@property (weak, nonatomic) IBOutlet UILabel *clickLabel;

@end