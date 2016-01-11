//
//  TableViewController_ipad.m
//  imobilesample
//
//  Created by i-mobile on 2015/02/19.
//  Copyright (c) 2015年 i-mobile. All rights reserved.
//

#import "TableViewController_ipad.h"

//アイモバイルSDKの読み込み
#import "ImobileSdkAds/ImobileSdkAds.h"
//定数の読み込み
#import "Imobile_spot_info.h"

//値受け渡し用
#import "InlineViewController.h"
#import "FullScreenViewController.h"

@interface TableViewController_ipad (){
    UITextField *partner_text;
    UITextField *media_text;
    UITextField *ad_text;
}
//設定ラベル
@property (weak, nonatomic) IBOutlet UILabel *label_320_50_ipad;
@property (weak, nonatomic) IBOutlet UILabel *label_320_100_ipad;
@property (weak, nonatomic) IBOutlet UILabel *label_468_90_ipad;
@property (weak, nonatomic) IBOutlet UILabel *label_728_90_ipad;
@property (weak, nonatomic) IBOutlet UILabel *label_120_600_ipad;
@property (weak, nonatomic) IBOutlet UILabel *label_160_600_ipad;
@property (weak, nonatomic) IBOutlet UILabel *label_200_200_ipad;
@property (weak, nonatomic) IBOutlet UILabel *label_250_250_ipad;
@property (weak, nonatomic) IBOutlet UILabel *label_300_250_ipad;
@property (weak, nonatomic) IBOutlet UILabel *label_336_280_ipad;
@property (weak, nonatomic) IBOutlet UILabel *label_300_600_ipad;
@property (weak, nonatomic) IBOutlet UILabel *label_inter_ipad;
@property (weak, nonatomic) IBOutlet UILabel *label_popup_ipad;

//設定ボタン
@property (weak, nonatomic) IBOutlet UIButton *button_320_50_ipad;
@property (weak, nonatomic) IBOutlet UIButton *button_320_100_ipad;
@property (weak, nonatomic) IBOutlet UIButton *button_468_90_ipad;
@property (weak, nonatomic) IBOutlet UIButton *button_728_90_ipad;
@property (weak, nonatomic) IBOutlet UIButton *button_120_600_ipad;
@property (weak, nonatomic) IBOutlet UIButton *button_160_600_ipad;
@property (weak, nonatomic) IBOutlet UIButton *button_200_200_ipad;
@property (weak, nonatomic) IBOutlet UIButton *button_250_250_ipad;
@property (weak, nonatomic) IBOutlet UIButton *button_300_250_ipad;
@property (weak, nonatomic) IBOutlet UIButton *button_336_280_ipad;
@property (weak, nonatomic) IBOutlet UIButton *button_300_600_ipad;
@property (weak, nonatomic) IBOutlet UIButton *button_inter_ipad;
@property (weak, nonatomic) IBOutlet UIButton *button_popup_ipad;

@end

@implementation TableViewController_ipad

- (void)viewDidLoad {
    [super viewDidLoad];
    for (int i = 1; i < 14; i++) {
        [self keyreset:i];
    }
    
    if ([[[UIDevice currentDevice] systemVersion] intValue] <= 6) {
        [_button_320_50_ipad removeFromSuperview];
        [_button_320_100_ipad removeFromSuperview];
        [_button_468_90_ipad removeFromSuperview];
        [_button_728_90_ipad removeFromSuperview];
        [_button_120_600_ipad removeFromSuperview];
        [_button_160_600_ipad removeFromSuperview];
        [_button_200_200_ipad removeFromSuperview];
        [_button_250_250_ipad removeFromSuperview];
        [_button_300_250_ipad removeFromSuperview];
        [_button_336_280_ipad removeFromSuperview];
        [_button_300_600_ipad removeFromSuperview];
        [_button_inter_ipad removeFromSuperview];
        [_button_popup_ipad removeFromSuperview];
        
        [_label_320_50_ipad removeFromSuperview];
        [_label_320_100_ipad removeFromSuperview];
        [_label_468_90_ipad removeFromSuperview];
        [_label_728_90_ipad removeFromSuperview];
        [_label_120_600_ipad removeFromSuperview];
        [_label_160_600_ipad removeFromSuperview];
        [_label_200_200_ipad removeFromSuperview];
        [_label_250_250_ipad removeFromSuperview];
        [_label_300_250_ipad removeFromSuperview];
        [_label_336_280_ipad removeFromSuperview];
        [_label_300_600_ipad removeFromSuperview];
        [_label_inter_ipad removeFromSuperview];
        [_label_popup_ipad removeFromSuperview];
    }
}
- (void)keyreset:(int)type{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *key = [[NSString alloc] init];
    NSString *pid = [[NSString alloc] init];
    NSString *mid = [[NSString alloc] init];
    NSString *sid = [[NSString alloc] init];
    
    key = [self keyreturn:type];
    
    pid = [ud objectForKey:[NSString stringWithFormat:@"%@_pid",key]];
    if (!pid || [pid length] == 0) pid = @"未設定";
    
    mid = [ud objectForKey:[NSString stringWithFormat:@"%@_mid",key]];
    if (!mid || [mid length] == 0) mid = @"未設定";

    sid = [ud objectForKey:[NSString stringWithFormat:@"%@_sid",key]];
    if (!sid || [sid length] == 0) sid = @"未設定";
    
    switch (type) {
        case 1:
            _label_320_50_ipad.text = [NSString stringWithFormat:@"PID:%@ MID:%@ SID:%@",pid,mid,sid];
            break;
        case 2:
            _label_320_100_ipad.text = [NSString stringWithFormat:@"PID:%@ MID:%@ SID:%@",pid,mid,sid];
            break;
        case 3:
            _label_468_90_ipad.text = [NSString stringWithFormat:@"PID:%@ MID:%@ SID:%@",pid,mid,sid];
            break;
        case 4:
            _label_728_90_ipad.text = [NSString stringWithFormat:@"PID:%@ MID:%@ SID:%@",pid,mid,sid];
            break;
        case 5:
            _label_120_600_ipad.text = [NSString stringWithFormat:@"PID:%@ MID:%@ SID:%@",pid,mid,sid];
            break;
        case 6:
            _label_160_600_ipad.text = [NSString stringWithFormat:@"PID:%@ MID:%@ SID:%@",pid,mid,sid];
            break;
        case 7:
            _label_200_200_ipad.text = [NSString stringWithFormat:@"PID:%@ MID:%@ SID:%@",pid,mid,sid];
            break;
        case 8:
            _label_250_250_ipad.text = [NSString stringWithFormat:@"PID:%@ MID:%@ SID:%@",pid,mid,sid];
            break;
        case 9:
            _label_300_250_ipad.text = [NSString stringWithFormat:@"PID:%@ MID:%@ SID:%@",pid,mid,sid];
            break;
        case 10:
            _label_336_280_ipad.text = [NSString stringWithFormat:@"PID:%@ MID:%@ SID:%@",pid,mid,sid];
            break;
        case 11:
            _label_300_600_ipad.text = [NSString stringWithFormat:@"PID:%@ MID:%@ SID:%@",pid,mid,sid];
            break;
        case 12:
            _label_inter_ipad.text = [NSString stringWithFormat:@"PID:%@ MID:%@ SID:%@",pid,mid,sid];
            break;
        case 13:
            _label_popup_ipad.text = [NSString stringWithFormat:@"PID:%@ MID:%@ SID:%@",pid,mid,sid];
            break;
        default:
            break;
    }
}
- (IBAction)setting:(UIButton *)sender {
    [self adkey_load:(int)sender.tag];
}

- (void)adkey_load:(int)type{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *key = [[NSString alloc] init];
    NSString *title = [[NSString alloc] init];
    NSString *pid = [[NSString alloc] init];
    NSString *mid = [[NSString alloc] init];
    NSString *sid = [[NSString alloc] init];
    
    key = [self keyreturn:type];
    pid = [ud objectForKey:[NSString stringWithFormat:@"%@_pid",key]];
    mid = [ud objectForKey:[NSString stringWithFormat:@"%@_mid",key]];
    sid = [ud objectForKey:[NSString stringWithFormat:@"%@_sid",key]];
    
    title = [self titlereturn:type];
    
    UIAlertView *_adinput =  [[UIAlertView alloc] initWithTitle:@"パラメータを入力してください"
                                                        message:title
                                                       delegate:self
                                              cancelButtonTitle:@"キャンセル"
                                              otherButtonTitles:@"OK", nil];
    _adinput.delegate = self;
    _adinput.tag = type;
    _adinput.alertViewStyle = UIAlertViewStyleDefault;
    UIView *space = [[UIView alloc] init];
    space.frame = CGRectMake(0, 0, 270, 120);
    [_adinput setValue:space forKey:@"accessoryView"];
    
    UILabel * partner_label = [[UILabel alloc] init];
    partner_label.frame = CGRectMake(10, 5, 110, 30);
    partner_label.text = @"PID";
    [space addSubview:partner_label];
    
    partner_text = [[UITextField alloc] init];
    partner_text.frame = CGRectMake(120, 5, 130, 30);
    partner_text.textAlignment = NSTextAlignmentRight;
    partner_text.keyboardType = UIKeyboardTypeNumberPad;
    [partner_text.layer setBorderWidth:0.5];
    partner_text.placeholder = @"未設定";
    if ([pid length] > 0) {
        partner_text.text = pid;
    }
    [space addSubview:partner_text];
    
    UILabel * media_label = [[UILabel alloc] init];
    media_label.frame = CGRectMake(10, 40, 100, 30);
    media_label.text = @"MID";
    [space addSubview:media_label];
    
    media_text = [[UITextField alloc] init];
    media_text.frame = CGRectMake(120, 40, 130, 30);
    media_text.textAlignment = NSTextAlignmentRight;
    media_text.keyboardType = UIKeyboardTypeNumberPad;
    [media_text.layer setBorderWidth:0.5];
    media_text.placeholder = @"未設定";
    if ([mid length] > 0) {
        media_text.text = mid;
    }
    [space addSubview:media_text];
    
    UILabel * ad_label = [[UILabel alloc] init];
    ad_label.frame = CGRectMake(10, 80, 100, 30);
    ad_label.text = @"SID";
    [space addSubview:ad_label];
    
    ad_text = [[UITextField alloc] init];
    ad_text.frame = CGRectMake(120, 80, 130, 30);
    ad_text.textAlignment = NSTextAlignmentRight;
    ad_text.keyboardType = UIKeyboardTypeNumberPad;
    ad_text.placeholder = @"未設定";
    [ad_text.layer setBorderWidth:0.5];
    if ([sid length] > 0) {
        ad_text.text = sid;
    }
    [space addSubview:ad_text];
    
    [_adinput show];
}
-(NSString *)keyreturn:(int)type{
    NSString *key = [[NSString alloc] init];
    switch (type) {
        case 1:
            key = @"320_50_iphone";
            break;
        case 2:
            key = @"320_100_iphone";
            break;
        case 3:
            key = @"468_60_ipad";
            break;
        case 4:
            key = @"728_90_ipad";
            break;
        case 5:
            key = @"120_600_ipad";
            break;
        case 6:
            key = @"160_600_ipad";
            break;
        case 7:
            key = @"200_200_ipad";
            break;
        case 8:
            key = @"250_250_ipad";
            break;
        case 9:
            key = @"300_250_iphone";
            break;
        case 10:
            key = @"336_280_ipad";
            break;
        case 11:
            key = @"300_600_ipad";
            break;
        case 12:
            key = @"inter_iphone";
            break;
        case 13:
            key = @"textpop_iphone";
            break;
        default:
            break;
    }
    return key;
}

-(NSString *)titlereturn:(int)type{
    NSString *key = [[NSString alloc] init];
    switch (type) {
        case 1:
            key = @"320 × 50  バナー";
            break;
        case 2:
            key = @"320 × 100 ビックバナー";
            break;
        case 3:
            key = @"468 × 60 バナー";
            break;
        case 4:
            key = @"728 × 90 ビックバナー";
            break;
        case 5:
            key = @"120 × 600 スカイスクレイバー";
            break;
        case 6:
            key = @"160 × 600 ワイドスカイスクレイバー";
            break;
        case 7:
            key = @"200 × 200 スクエア（小）";
            break;
        case 8:
            key = @"250 × 250 スクエア";
            break;
        case 9:
            key = @"300 × 250 ミディアムレクタングル";
            break;
        case 10:
            key = @"336 × 280 ビックレクタングル";
            break;
        case 11:
            key = @"300 × 600 ハーフページ";
            break;
        case 12:
            key = @"インタースティシャル";
            break;
        case 13:
            key = @"テキストポップアップ";
            break;
    }
    return key;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *key = [[NSString alloc] init];
    NSString *title = [[NSString alloc] init];
    NSString *pid = [[NSString alloc] init];
    NSString *mid = [[NSString alloc] init];
    NSString *sid = [[NSString alloc] init];
    CGSize adSize;
    
    key = [self keyreturn:[segue.identifier intValue]];
    title = [self titlereturn:[segue.identifier intValue]];
    
    switch ([segue.identifier intValue]) {
        case 1:
            pid = [ud objectForKey:[NSString stringWithFormat:@"%@_pid",key]];
            if (!pid || [pid length] == 0) pid = banner_320_50_pid;
            
            mid = [ud objectForKey:[NSString stringWithFormat:@"%@_mid",key]];
            if (!mid || [mid length] == 0) mid = banner_320_50_mid;
            
            sid = [ud objectForKey:[NSString stringWithFormat:@"%@_sid",key]];
            if (!sid || [sid length] == 0) sid = banner_320_50_sid;
            
            adSize = CGSizeMake(320, 50);
            break;
        case 2:
            pid = [ud objectForKey:[NSString stringWithFormat:@"%@_pid",key]];
            if (!pid || [pid length] == 0) pid = banner_320_100_pid;
            
            mid = [ud objectForKey:[NSString stringWithFormat:@"%@_mid",key]];
            if (!mid || [mid length] == 0) mid = banner_320_100_mid;
            
            sid = [ud objectForKey:[NSString stringWithFormat:@"%@_sid",key]];
            if (!sid || [sid length] == 0) sid = banner_320_100_sid;
            
            adSize = CGSizeMake(320, 100);
            break;
        case 3:
            pid = [ud objectForKey:[NSString stringWithFormat:@"%@_pid",key]];
            if (!pid || [pid length] == 0) pid = banner_468_60_pid;
            
            mid = [ud objectForKey:[NSString stringWithFormat:@"%@_mid",key]];
            if (!mid || [mid length] == 0) mid = banner_468_60_mid;
            
            sid = [ud objectForKey:[NSString stringWithFormat:@"%@_sid",key]];
            if (!sid || [sid length] == 0) sid = banner_468_60_sid;
            
            adSize = CGSizeMake(468, 60);
            break;
        case 4:
            pid = [ud objectForKey:[NSString stringWithFormat:@"%@_pid",key]];
            if (!pid || [pid length] == 0) pid = banner_728_90_pid;
            
            mid = [ud objectForKey:[NSString stringWithFormat:@"%@_mid",key]];
            if (!mid || [mid length] == 0) mid = banner_728_90_mid;
            
            sid = [ud objectForKey:[NSString stringWithFormat:@"%@_sid",key]];
            if (!sid || [sid length] == 0) sid = banner_728_90_sid;
            
            adSize = CGSizeMake(728, 90);
            break;
        case 5:
            pid = [ud objectForKey:[NSString stringWithFormat:@"%@_pid",key]];
            if (!pid || [pid length] == 0) pid = banner_120_600_pid;
            
            mid = [ud objectForKey:[NSString stringWithFormat:@"%@_mid",key]];
            if (!mid || [mid length] == 0) mid = banner_120_600_mid;
            
            sid = [ud objectForKey:[NSString stringWithFormat:@"%@_sid",key]];
            if (!sid || [sid length] == 0) sid = banner_120_600_sid;
            
            adSize = CGSizeMake(120, 600);
            break;
        case 6:
            pid = [ud objectForKey:[NSString stringWithFormat:@"%@_pid",key]];
            if (!pid || [pid length] == 0) pid = banner_160_600_pid;
            
            mid = [ud objectForKey:[NSString stringWithFormat:@"%@_mid",key]];
            if (!mid || [mid length] == 0) mid = banner_160_600_mid;
            
            sid = [ud objectForKey:[NSString stringWithFormat:@"%@_sid",key]];
            if (!sid || [sid length] == 0) sid = banner_160_600_sid;
            
            adSize = CGSizeMake(160, 600);
            break;
        case 7:
            pid = [ud objectForKey:[NSString stringWithFormat:@"%@_pid",key]];
            if (!pid || [pid length] == 0) pid = banner_200_200_pid;
            
            mid = [ud objectForKey:[NSString stringWithFormat:@"%@_mid",key]];
            if (!mid || [mid length] == 0) mid = banner_200_200_mid;
            
            sid = [ud objectForKey:[NSString stringWithFormat:@"%@_sid",key]];
            if (!sid || [sid length] == 0) sid = banner_200_200_sid;
            
            adSize = CGSizeMake(200, 200);
            break;
        case 8:
            pid = [ud objectForKey:[NSString stringWithFormat:@"%@_pid",key]];
            if (!pid || [pid length] == 0) pid = banner_250_250_pid;
            
            mid = [ud objectForKey:[NSString stringWithFormat:@"%@_mid",key]];
            if (!mid || [mid length] == 0) mid = banner_250_250_mid;
            
            sid = [ud objectForKey:[NSString stringWithFormat:@"%@_sid",key]];
            if (!sid || [sid length] == 0) sid = banner_250_250_sid;
            
            adSize = CGSizeMake(250, 250);
            break;
        case 9:
            pid = [ud objectForKey:[NSString stringWithFormat:@"%@_pid",key]];
            if (!pid || [pid length] == 0) pid = banner_300_250_pid;
            
            mid = [ud objectForKey:[NSString stringWithFormat:@"%@_mid",key]];
            if (!mid || [mid length] == 0) mid = banner_300_250_mid;
            
            sid = [ud objectForKey:[NSString stringWithFormat:@"%@_sid",key]];
            if (!sid || [sid length] == 0) sid = banner_300_250_sid;
            
            adSize = CGSizeMake(300, 250);
            break;
        case 10:
            pid = [ud objectForKey:[NSString stringWithFormat:@"%@_pid",key]];
            if (!pid || [pid length] == 0) pid = banner_336_280_pid;
            
            mid = [ud objectForKey:[NSString stringWithFormat:@"%@_mid",key]];
            if (!mid || [mid length] == 0) mid = banner_336_280_mid;
            
            sid = [ud objectForKey:[NSString stringWithFormat:@"%@_sid",key]];
            if (!sid || [sid length] == 0) sid = banner_336_280_sid;
            
            adSize = CGSizeMake(336, 280);
            break;
        case 11:
            pid = [ud objectForKey:[NSString stringWithFormat:@"%@_pid",key]];
            if (!pid || [pid length] == 0) pid = banner_300_600_pid;
            
            mid = [ud objectForKey:[NSString stringWithFormat:@"%@_mid",key]];
            if (!mid || [mid length] == 0) mid = banner_300_600_mid;
            
            sid = [ud objectForKey:[NSString stringWithFormat:@"%@_sid",key]];
            if (!sid || [sid length] == 0) sid = banner_300_600_sid;
            
            adSize = CGSizeMake(300, 600);
            break;
        case 12:
            pid = [ud objectForKey:[NSString stringWithFormat:@"%@_pid",key]];
            if (!pid || [pid length] == 0) pid = inter_pid;
            
            mid = [ud objectForKey:[NSString stringWithFormat:@"%@_mid",key]];
            if (!mid || [mid length] == 0) mid = inter_mid;
            
            sid = [ud objectForKey:[NSString stringWithFormat:@"%@_sid",key]];
            if (!sid || [sid length] == 0) sid = inter_sid;
            break;
        case 13:
            pid = [ud objectForKey:[NSString stringWithFormat:@"%@_pid",key]];
            if (!pid || [pid length] == 0) pid = textpopup_pid;
            
            mid = [ud objectForKey:[NSString stringWithFormat:@"%@_mid",key]];
            if (!mid || [mid length] == 0) mid = textpopup_mid;
            
            sid = [ud objectForKey:[NSString stringWithFormat:@"%@_sid",key]];
            if (!sid || [sid length] == 0) sid = textpopup_sid;
            break;
        default:
            break;
    }
    
    if ([segue.identifier intValue] >= 1 && [segue.identifier intValue] <= 11) {
        InlineViewController *vc = segue.destinationViewController;
        vc.adSize = adSize;
        vc.title = title;
        vc.pid = pid;
        vc.mid = mid;
        vc.sid = sid;
    }else{
        FullScreenViewController *vc = segue.destinationViewController;
        vc.title = title;
        vc.pid = pid;
        vc.mid = mid;
        vc.sid = sid;
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == alertView.cancelButtonIndex) {
    }else{
        NSString *key = [[NSString alloc] init];
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        
        key = [self keyreturn:(int)alertView.tag];
        [ud setObject:partner_text.text forKey:[NSString stringWithFormat:@"%@_pid",key]];
        [ud synchronize];
        [ud setObject:media_text.text forKey:[NSString stringWithFormat:@"%@_mid",key]];
        [ud synchronize];
        [ud setObject:ad_text.text forKey:[NSString stringWithFormat:@"%@_sid",key]];
        [ud synchronize];
        [self keyreset:(int)alertView.tag];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

@end
