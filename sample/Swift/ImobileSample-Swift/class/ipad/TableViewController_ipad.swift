//
//  TableViewController_ipad.swift
//  ImobileSample-Swift
//
//  Created by i-mobile on 2015/03/10.
//  Copyright (c) 2015年 i-mobile. All rights reserved.
//

import UIKit

class TableViewController_ipad: UITableViewController,UIAlertViewDelegate {
    //設定ラベル
    @IBOutlet weak var label_banner: UILabel!
    @IBOutlet weak var label_bigbanner: UILabel!
    @IBOutlet weak var label_padbanner: UILabel!
    @IBOutlet weak var label_padbigbanner: UILabel!
    @IBOutlet weak var label_skyscreiper: UILabel!
    @IBOutlet weak var label_wideskyscreiper: UILabel!
    @IBOutlet weak var label_square_small: UILabel!
    @IBOutlet weak var label_square: UILabel!
    @IBOutlet weak var label_m_rectangle: UILabel!
    @IBOutlet weak var label_rectangle: UILabel!
    @IBOutlet weak var label_halfpage: UILabel!
    @IBOutlet weak var label_inter: UILabel!
    @IBOutlet weak var label_textpopup: UILabel!
    
    
    var partner_text :UITextField!
    var media_text :UITextField!
    var ad_text :UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...13{
            keyreset(i)
        }
    }
    func keyreset( type : Int){
        
        let ud  = NSUserDefaults.standardUserDefaults()
        var key : String!
        var pid : String!
        var mid : String!
        var sid : String!
        
        key = keyreturn(type)
        
        pid = ud.stringForKey(key + "_pid")
        if(pid != nil){
            if(pid.characters.count == 0){
                pid = "未設定"
            }
        }else{
            pid = "未設定"
        }
        
        mid = ud.stringForKey(key + "_mid")
        if(mid != nil){
            if(mid.characters.count == 0){
                mid = "未設定"
            }
        }else{
            mid = "未設定"
        }
        
        
        sid = ud.stringForKey(key + "_sid")
        if(sid != nil){
            if(sid.characters.count == 0){
                sid = "未設定"
            }
        }else{
            sid = "未設定"
        }
        
        switch type{
        case 1:
            label_banner.text = "PID:"+pid+" MID:"+mid+" SID:"+sid
        case 2:
            label_bigbanner.text = "PID:"+pid+" MID:"+mid+" SID:"+sid
        case 3:
            label_padbanner.text = "PID:"+pid+" MID:"+mid+" SID:"+sid
        case 4:
            label_padbigbanner.text = "PID:"+pid+" MID:"+mid+" SID:"+sid
        case 5:
            label_skyscreiper.text = "PID:"+pid+" MID:"+mid+" SID:"+sid
        case 6:
            label_wideskyscreiper.text = "PID:"+pid+" MID:"+mid+" SID:"+sid
        case 7:
            label_square_small.text = "PID:"+pid+" MID:"+mid+" SID:"+sid
        case 8:
            label_square.text = "PID:"+pid+" MID:"+mid+" SID:"+sid
        case 9:
            label_m_rectangle.text = "PID:"+pid+" MID:"+mid+" SID:"+sid
        case 10:
            label_rectangle.text = "PID:"+pid+" MID:"+mid+" SID:"+sid
        case 11:
            label_halfpage.text = "PID:"+pid+" MID:"+mid+" SID:"+sid
        case 12:
            label_inter.text = "PID:"+pid+" MID:"+mid+" SID:"+sid
        case 13:
            label_textpopup.text = "PID:"+pid+" MID:"+mid+" SID:"+sid
        default:
            break
            
        }
    }
    func  keyreturn( type :Int) -> String{
        var key: String!
        
        switch type {
        case 1:
            key = "320_50"
        case 2:
            key = "320_100"
        case 3:
            key = "468_60"
        case 4:
            key = "728_90"
        case 5:
            key = "120_600"
        case 6:
            key = "160_600"
        case 7:
            key = "200_200"
        case 8:
            key = "250_250"
        case 9:
            key = "300_250"
        case 10:
            key = "336_280"
        case 11:
            key = "300_600"
        case 12:
            key = "inter"
        case 13:
            key = "textpop"
        default:
            break
            
        }
        return key
    }
    func titlereturn( type :Int)-> String{
        var title: String!
        
        switch type  {
        case 1:
            title = "320 × 50  バナー"
        case 2:
            title = "320 × 100 ビックバナー"
        case 3:
            title = "468 × 60 バナー"
        case 4:
            title = "728 × 90 ビックバナー"
        case 5:
            title = "120 × 600 スカイスクレイバー"
        case 6:
            title = "160 × 600 ワイドスカイスクレイバー"
        case 7:
            title = "200 × 200 スクエア（小）"
        case 8:
            title = "250 × 250 スクエア"
        case 9:
            title = "300 × 250 ミディアムレクタングル"
        case 10:
            title = "336 × 280 ビックレクタングル"
        case 11:
            title = "300 × 600 ハーフページ"
        case 12:
            title = "インタースティシャル"
        case 13:
            title = "テキストポップアップ"
        default:
            break
        }
        return title
    }
    @IBAction func button_setting(sender: UIButton) {
        let ud  = NSUserDefaults.standardUserDefaults()
        var key : String!
        var pid : String!
        var mid : String!
        var sid : String!
        var title : String!
        
        key = keyreturn(sender.tag)
        title = titlereturn(sender.tag)
        
        pid = ud.stringForKey(key + "_pid")
        mid = ud.stringForKey(key + "_mid")
        sid = ud.stringForKey(key + "_sid")
        
        let av = UIAlertView(title: "パラメータを入力してください", message:title, delegate: self, cancelButtonTitle: "Cancel", otherButtonTitles: "OK")
        av.tag = sender.tag
        
        let space:UIView = UIView(frame:CGRectMake(0, 0, 270, 120))
        av.setValue(space, forKey: "accessoryView")
        
        let partner_label = UILabel(frame: CGRectMake(10, 5, 110, 30))
        partner_label.text = "PID"
        space.addSubview(partner_label)
        
        partner_text = UITextField(frame: CGRectMake(120, 5, 130, 30))
        partner_text.textAlignment = .Right
        partner_text.keyboardType = UIKeyboardType.DecimalPad
        partner_text.layer.borderWidth = 1.0
        partner_text.placeholder = "未設定"
        if(pid != nil){
            if(pid.characters.count == 0){
                partner_text.text = pid
            }
        }
        space.addSubview(partner_text)
        
        let media_label = UILabel(frame: CGRectMake(10 , 40, 100, 30))
        media_label.text = "MID"
        space.addSubview(media_label)
        
        media_text = UITextField(frame: CGRectMake(120, 40, 130, 30))
        media_text.textAlignment = .Right
        media_text.keyboardType = UIKeyboardType.DecimalPad
        media_text.layer.borderWidth = 1.0
        media_text.placeholder = "未設定"
        if(mid != nil){
            if(mid.characters.count == 0){
                media_text.text = mid
            }
        }
        space.addSubview(media_text)
        
        
        let ad_label = UILabel(frame: CGRectMake(10 , 80, 100, 30))
        ad_label.text = "SID"
        space.addSubview(ad_label)
        
        ad_text = UITextField(frame: CGRectMake(120 , 80, 130, 30))
        ad_text.textAlignment = .Right
        ad_text.keyboardType = UIKeyboardType.DecimalPad
        ad_text.layer.borderWidth = 1.0
        ad_text.placeholder = "未設定"
        if(sid != nil){
            if(sid.characters.count == 0){
                ad_text.text = sid
            }
        }
        space.addSubview(ad_text)
        
        av.show()
    }
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if (buttonIndex == alertView.cancelButtonIndex) {
            //Canceled
        } else {
            var key : String!
            let ud  = NSUserDefaults.standardUserDefaults()
            
            key = keyreturn(alertView.tag)
            
            ud.setObject(partner_text.text, forKey: key + "_pid")
            ud.synchronize()
            ud.setObject(media_text.text, forKey: key + "_mid")
            ud.synchronize()
            ud.setObject(ad_text.text, forKey: key + "_sid")
            ud.synchronize()
            
            keyreset(alertView.tag)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let ud  = NSUserDefaults.standardUserDefaults()
        var key : String!
        var pid : String!
        var mid : String!
        var sid : String!
        var title : String!
        var adSize : CGSize!
        
        var cellNumber :Int!
        cellNumber = Int(segue.identifier!)
        key = keyreturn(cellNumber)
        title = titlereturn(cellNumber)
        
        pid = ud.stringForKey(key + "_pid")
        mid = ud.stringForKey(key + "_mid")
        sid = ud.stringForKey(key + "_sid")
        
        switch cellNumber{
        case 1:
            if(pid != nil){
                if(pid.characters.count == 0){
                    pid = Imobile_spot_info.banner_pid
                }
            }else{
                pid = Imobile_spot_info.banner_pid
            }
            
            if(mid != nil){
                if(mid.characters.count == 0){
                    mid = Imobile_spot_info.banner_mid
                }
            }else{
                mid = Imobile_spot_info.banner_mid
            }
            
            if(sid != nil){
                if(sid.characters.count == 0){
                    sid = Imobile_spot_info.banner_sid
                }
            }else{
                sid = Imobile_spot_info.banner_sid
            }
            adSize = CGSizeMake(320, 50)
        case 2:
            if(pid != nil){
                if(pid.characters.count == 0){
                    pid = Imobile_spot_info.bigbanner_pid
                }
            }else{
                pid = Imobile_spot_info.bigbanner_pid
            }
            
            if(mid != nil){
                if(mid.characters.count == 0){
                    mid = Imobile_spot_info.bigbanner_mid
                }
            }else{
                mid = Imobile_spot_info.bigbanner_mid
            }
            
            if(sid != nil){
                if(sid.characters.count == 0){
                    sid = Imobile_spot_info.bigbanner_sid
                }
            }else{
                sid = Imobile_spot_info.bigbanner_sid
            }
            adSize = CGSizeMake(320, 100)
        case 3:
            if(pid != nil){
                if(pid.characters.count == 0){
                    pid = Imobile_spot_info.tabbanner_pid
                }
            }else{
                pid = Imobile_spot_info.tabbanner_pid
            }
            
            if(mid != nil){
                if(mid.characters.count == 0){
                    mid = Imobile_spot_info.tabbanner_mid
                }
            }else{
                mid = Imobile_spot_info.tabbanner_mid
            }
            
            if(sid != nil){
                if(sid.characters.count == 0){
                    sid = Imobile_spot_info.tabbanner_sid
                }
            }else{
                sid = Imobile_spot_info.tabbanner_sid
            }
            adSize = CGSizeMake(468, 60)
        case 4:
            if(pid != nil){
                if(pid.characters.count == 0){
                    pid = Imobile_spot_info.tabbigbanner_pid
                }
            }else{
                pid = Imobile_spot_info.tabbigbanner_pid
            }
            
            if(mid != nil){
                if(mid.characters.count == 0){
                    mid = Imobile_spot_info.tabbigbanner_mid
                }
            }else{
                mid = Imobile_spot_info.tabbigbanner_mid
            }
            
            if(sid != nil){
                if(sid.characters.count == 0){
                    sid = Imobile_spot_info.tabbigbanner_sid
                }
            }else{
                sid = Imobile_spot_info.tabbigbanner_sid
            }
            adSize = CGSizeMake(728, 90)
        case 5:
            
            if(pid != nil){
                if(pid.characters.count == 0){
                    pid = Imobile_spot_info.skyscreiper_pid
                }
            }else{
                pid = Imobile_spot_info.skyscreiper_pid
            }
            
            if(mid != nil){
                if(mid.characters.count == 0){
                    mid = Imobile_spot_info.skyscreiper_mid
                }
            }else{
                mid = Imobile_spot_info.skyscreiper_mid
            }
            
            if(sid != nil){
                if(sid.characters.count == 0){
                    sid = Imobile_spot_info.skyscreiper_sid
                }
            }else{
                sid = Imobile_spot_info.skyscreiper_sid
            }
            adSize = CGSizeMake(120, 600)
        case 6:
            if(pid != nil){
                if(pid.characters.count == 0){
                    pid = Imobile_spot_info.wideskyscreiper_pid
                }
            }else{
                pid = Imobile_spot_info.wideskyscreiper_pid
            }
            
            if(mid != nil){
                if(mid.characters.count == 0){
                    mid = Imobile_spot_info.wideskyscreiper_mid
                }
            }else{
                mid = Imobile_spot_info.wideskyscreiper_mid
            }
            
            if(sid != nil){
                if(sid.characters.count == 0){
                    sid = Imobile_spot_info.wideskyscreiper_sid
                }
            }else{
                sid = Imobile_spot_info.wideskyscreiper_sid
            }
            adSize = CGSizeMake(160, 600)
        case 7:
            if(pid != nil){
                if(pid.characters.count == 0){
                    pid = Imobile_spot_info.smallsquare_pid
                }
            }else{
                pid = Imobile_spot_info.smallsquare_pid
            }
            
            if(mid != nil){
                if(mid.characters.count == 0){
                    mid = Imobile_spot_info.smallsquare_mid
                }
            }else{
                mid = Imobile_spot_info.smallsquare_mid
            }
            
            if(sid != nil){
                if(sid.characters.count == 0){
                    sid = Imobile_spot_info.smallsquare_sid
                }
            }else{
                sid = Imobile_spot_info.smallsquare_sid
            }
            adSize = CGSizeMake(200, 200)
        case 8:
            if(pid != nil){
                if(pid.characters.count == 0){
                    pid = Imobile_spot_info.square_pid
                }
            }else{
                pid = Imobile_spot_info.square_pid
            }
            
            if(mid != nil){
                if(mid.characters.count == 0){
                    mid = Imobile_spot_info.square_mid
                }
            }else{
                mid = Imobile_spot_info.square_mid
            }
            
            if(sid != nil){
                if(sid.characters.count == 0){
                    sid = Imobile_spot_info.square_sid
                }
            }else{
                sid = Imobile_spot_info.square_sid
            }
            adSize = CGSizeMake(250, 250)
        case 9:
            if(pid != nil){
                if(pid.characters.count == 0){
                    pid = Imobile_spot_info.m_rectangle_pid
                }
            }else{
                pid = Imobile_spot_info.m_rectangle_pid
            }
            
            if(mid != nil){
                if(mid.characters.count == 0){
                    mid = Imobile_spot_info.m_rectangle_mid
                }
            }else{
                mid = Imobile_spot_info.m_rectangle_mid
            }
            
            if(sid != nil){
                if(sid.characters.count == 0){
                    sid = Imobile_spot_info.m_rectangle_sid
                }
            }else{
                sid = Imobile_spot_info.m_rectangle_sid
            }
            adSize = CGSizeMake(300, 250)
        case 10:
            if(pid != nil){
                if(pid.characters.count == 0){
                    pid = Imobile_spot_info.rectangle_pid
                }
            }else{
                pid = Imobile_spot_info.rectangle_pid
            }
            
            if(mid != nil){
                if(mid.characters.count == 0){
                    mid = Imobile_spot_info.rectangle_mid
                }
            }else{
                mid = Imobile_spot_info.rectangle_mid
            }
            
            if(sid != nil){
                if(sid.characters.count == 0){
                    sid = Imobile_spot_info.rectangle_sid
                }
            }else{
                sid = Imobile_spot_info.rectangle_sid
            }
            adSize = CGSizeMake(336, 280)
        case 11:
            if(pid != nil){
                if(pid.characters.count == 0){
                    pid = Imobile_spot_info.halfpage_pid
                }
            }else{
                pid = Imobile_spot_info.halfpage_pid
            }
            
            if(mid != nil){
                if(mid.characters.count == 0){
                    mid = Imobile_spot_info.halfpage_mid
                }
            }else{
                mid = Imobile_spot_info.halfpage_mid
            }
            
            if(sid != nil){
                if(sid.characters.count == 0){
                    sid = Imobile_spot_info.halfpage_sid
                }
            }else{
                sid = Imobile_spot_info.halfpage_sid
            }
            adSize = CGSizeMake(300, 600)
        case 12:
            if(pid != nil){
                if(pid.characters.count == 0){
                    pid = Imobile_spot_info.inter_pid
                }
            }else{
                pid = Imobile_spot_info.inter_pid
            }
            
            if(mid != nil){
                if(mid.characters.count == 0){
                    mid = Imobile_spot_info.inter_mid
                }
            }else{
                mid = Imobile_spot_info.inter_mid
            }
            
            if(sid != nil){
                if(sid.characters.count == 0){
                    sid = Imobile_spot_info.inter_sid
                }
            }else{
                sid = Imobile_spot_info.inter_sid
            }
            
        case 13:
            if(pid != nil){
                if(pid.characters.count == 0){
                    pid = Imobile_spot_info.textpopup_pid
                }
            }else{
                pid = Imobile_spot_info.textpopup_pid
            }
            
            if(mid != nil){
                if(mid.characters.count == 0){
                    mid = Imobile_spot_info.textpopup_mid
                }
            }else{
                mid = Imobile_spot_info.textpopup_mid
            }
            
            if(sid != nil){
                if(sid.characters.count == 0){
                    sid = Imobile_spot_info.textpopup_sid
                }
            }else{
                sid = Imobile_spot_info.textpopup_sid
            }
        default:
            break
        }
        
        if (cellNumber >= 1 && cellNumber <= 11){
            let nextViewController: InlineViewController = segue.destinationViewController as! InlineViewController
            nextViewController.pid = pid
            nextViewController.mid = mid
            nextViewController.sid = sid
            nextViewController.title = title
            nextViewController.adsize = adSize
        }else{
            let nextViewController: FullScreenViewController = segue.destinationViewController as! FullScreenViewController
            nextViewController.pid = pid
            nextViewController.mid = mid
            nextViewController.sid = sid
            nextViewController.title = title
        }
    }
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        var tablecell = 0
        if (section == 0){
            tablecell = 11
        }else{
            tablecell = 2
        }
        return tablecell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44.0
    }
    
}
