//
//  TableViewController.m
//  imobilesample
//
//  Created by i-mobile on 2015/02/19.
//  Copyright (c) 2015年 i-mobile. All rights reserved.
//

#import "TableViewController.h"
//アイモバイルSDKの読み込み
#import "ImobileSdkAds/ImobileSdkAds.h"
//定数の読み込み
#import "Imobile_spot_info.h"

//値受け渡し用
#import "InlineViewController.h"
#import "FullScreenViewController.h"

@interface TableViewController (){
    UITextField *partner_text;
    UITextField *media_text;
    UITextField *ad_text;
}

//設定ラベル
@property (weak, nonatomic) IBOutlet UILabel *label_320_50_iphone;
@property (weak, nonatomic) IBOutlet UILabel *label_320_100_iphone;
@property (weak, nonatomic) IBOutlet UILabel *lable_300_250_iphone;
@property (weak, nonatomic) IBOutlet UILabel *label_inter;
@property (weak, nonatomic) IBOutlet UILabel *label_textpopup;

//設定ボタン
@property (weak, nonatomic) IBOutlet UIButton *button_320_50_iphone;
@property (weak, nonatomic) IBOutlet UIButton *button_320_100_iphone;
@property (weak, nonatomic) IBOutlet UIButton *button_300_250_iphone;
@property (weak, nonatomic) IBOutlet UIButton *button_inter;
@property (weak, nonatomic) IBOutlet UIButton *button_textpopup;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    for (int i = 1; i < 7; i++) {
        [self keyreset:i];
    }
    
    if ([[[UIDevice currentDevice] systemVersion] intValue] <= 6) {
        [_button_320_50_iphone removeFromSuperview];
        [_button_320_100_iphone removeFromSuperview];
        [_button_300_250_iphone removeFromSuperview];
        [_button_inter removeFromSuperview];
        [_button_textpopup removeFromSuperview];
        
        [_label_320_50_iphone removeFromSuperview];
        [_label_320_100_iphone removeFromSuperview];
        [_lable_300_250_iphone removeFromSuperview];
        [_lable_300_250_iphone removeFromSuperview];
        [_label_inter removeFromSuperview];
        [_label_textpopup removeFromSuperview];
    }
    [[UILabel appearanceWhenContainedIn:[UITableViewHeaderFooterView  class], nil] setFont:[UIFont systemFontOfSize:17]];
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
            _label_320_50_iphone.text = [NSString stringWithFormat:@"PID:%@ MID:%@ SID:%@",pid,mid,sid];
            break;
        case 2:
            _label_320_100_iphone.text = [NSString stringWithFormat:@"PID:%@ MID:%@ SID:%@",pid,mid,sid];
            break;
        case 3:
            _lable_300_250_iphone.text = [NSString stringWithFormat:@"PID:%@ MID:%@ SID:%@",pid,mid,sid];
            break;
        case 4:
            _label_inter.text = [NSString stringWithFormat:@"PID:%@ MID:%@ SID:%@",pid,mid,sid];
            break;
        case 5:
            _label_textpopup.text = [NSString stringWithFormat:@"PID:%@ MID:%@ SID:%@",pid,mid,sid];
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
    if ([[[UIDevice currentDevice] systemVersion] intValue] <= 6) {
        [_adinput addSubview:space];
    }else{
        [_adinput setValue:space forKey:@"accessoryView"];
    }
    
    UILabel * partner_label = [[UILabel alloc] init];
    partner_label.frame = CGRectMake(10, 5, 110, 30);
    partner_label.text = @"PID";
    [space addSubview:partner_label];
    
    partner_text = [[UITextField alloc] init];
    partner_text.frame = CGRectMake(120 , 5, 130, 30);
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
            if (!pid || [pid length] == 0) pid = banner_300_250_pid;
            
            mid = [ud objectForKey:[NSString stringWithFormat:@"%@_mid",key]];
            if (!mid || [mid length] == 0) mid = banner_300_250_mid;
            
            sid = [ud objectForKey:[NSString stringWithFormat:@"%@_sid",key]];
            if (!sid || [sid length] == 0) sid = banner_300_250_sid;
            
            adSize = CGSizeMake(300, 250);
            break;
        case 4:
            pid = [ud objectForKey:[NSString stringWithFormat:@"%@_pid",key]];
            if (!pid || [pid length] == 0) pid = inter_pid;
            
            mid = [ud objectForKey:[NSString stringWithFormat:@"%@_mid",key]];
            if (!mid || [mid length] == 0) mid = inter_mid;
            
            sid = [ud objectForKey:[NSString stringWithFormat:@"%@_sid",key]];
            if (!sid || [sid length] == 0) sid = inter_sid;
            
            break;
        case 5:
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
    
    if ([segue.identifier intValue] >= 1 && [segue.identifier intValue] <= 3) {
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

-(NSString *)titlereturn:(int)type{
    switch (type) {
        case 1:
            return @"320 × 50 バナー";
            break;
        case 2:
            return @"320 × 100 ビックバナー";
            break;
        case 3:
            return @"300 × 250 ミディアムレクタングル";
            break;
        case 4:
            return @"インタースティシャル";
            break;
        case 5:
            return @"テキストポップアップ";
            break;
        default:
            break;
    }
    return nil;
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
            key = @"300_250_iphone";
            break;
        case 4:
            key = @"inter_iphone";
            break;
        case 5:
            key = @"textpop_iphone";
            break;
        default:
            break;
    }
    return key;
}
- (void)willPresentAlertView:(UIAlertView *)alertView{
        CGRect frame = alertView.frame;
        frame.origin.y = 100;
        frame.size.height = 250;
        alertView.frame = frame;
        
        for (UIView* view in alertView.subviews){
            frame = view.frame;
            if (frame.origin.y > 44) {
                frame.origin.y += 110;
                view.frame = frame;
            }
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
