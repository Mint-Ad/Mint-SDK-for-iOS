//
//  TableViewController_iphone.swift
//  ImobileSample-Swift
//
//  Created by i-mobile on 2015/03/09.
//  Copyright (c) 2015年 i-mobile. All rights reserved.
//

import UIKit

class TableViewController_iphone: UITableViewController , UIAlertViewDelegate{
    @IBOutlet weak var label_banner_320_50: UILabel!
    @IBOutlet weak var label_banner_320_100: UILabel!
    @IBOutlet weak var label_banner_300_250: UILabel!
    
    @IBOutlet weak var label_inter: UILabel!
    @IBOutlet weak var label_textpopup: UILabel!
    
    var partner_text :UITextField!
    var media_text :UITextField!
    var ad_text :UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...5{
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
            label_banner_320_50.text = "PID:"+pid+" MID:"+mid+" SID:"+sid
        case 2:
            label_banner_320_100.text = "PID:"+pid+" MID:"+mid+" SID:"+sid
        case 3:
            label_banner_300_250.text = "PID:"+pid+" MID:"+mid+" SID:"+sid
        case 4:
            label_inter.text = "PID:"+pid+" MID:"+mid+" SID:"+sid
        case 5:
            label_textpopup.text = "PID:"+pid+" MID:"+mid+" SID:"+sid
        default:
            break
        }
    }
    func keyreturn( type :Int) -> String{
        var key: String!
        switch type {
        case 1:
            key = "320_50"
        case 2:
            key = "320_100"
        case 3:
            key = "300_250"
        case 4:
            key = "inter"
        case 5:
            key = "textpop"
        default:
            break
        }
        return key
    }
    func titlereturn( type :Int) -> String{
        var key: String!
        switch type {
        case 1:
            key = "320 × 50 バナー"
        case 2:
            key = "320 × 100 ビックバナー"
        case 3:
            key = "300 × 250 ミディアムレクタングル"
        case 4:
            key = "インタースティシャル"
        case 5:
            key = "テキストポップアップ"
        default:
            break
        }
        return key
    }
    
    @IBAction func button_setting(sender: UIButton) {
        
        let ud  = NSUserDefaults.standardUserDefaults()
        var key : String!
        var pid : String!
        var mid : String!
        var sid : String!
        var title : String!
        
        key = keyreturn(sender.tag)
        
        pid = ud.stringForKey(key + "_pid")
        mid = ud.stringForKey(key + "_mid")
        sid = ud.stringForKey(key + "_sid")
        
        title = titlereturn(sender.tag)
        
        let av = UIAlertView(title: "パラメータを入力してください", message:title, delegate: self, cancelButtonTitle: "Cancel", otherButtonTitles: "OK")
        av.tag = sender.tag
        
        let space:UIView = UIView(frame:CGRectMake(0, 0, 270, 120))
        av.setValue(space, forKey: "accessoryView")
        
        let partner_label = UILabel(frame: CGRectMake(10 , 5, 110, 30))
        partner_label.text = "PID"
        space.addSubview(partner_label)
        
        partner_text = UITextField(frame: CGRectMake(120 , 5, 130, 30))
        partner_text.textAlignment = .Right
        partner_text.keyboardType = UIKeyboardType.DecimalPad
        partner_text.layer.borderWidth = 1.0
        partner_text.placeholder = "未設定"
        if(pid != nil){
            if(pid.characters.count >= 0){
                partner_text.text = pid
            }
        }
        space.addSubview(partner_text)
        
        let media_label = UILabel(frame: CGRectMake(10 , 40, 100, 30))
        media_label.text = "MID"
        space.addSubview(media_label)
        
        media_text = UITextField(frame: CGRectMake(120 , 40, 130, 30))
        media_text.textAlignment = .Right
        media_text.keyboardType = UIKeyboardType.DecimalPad
        media_text.layer.borderWidth = 1.0
        media_text.placeholder = "未設定"
        if(mid != nil){
            if(mid.characters.count >= 0){
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
            if(sid.characters.count >= 0){
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
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44.0
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var tablecell = 0
        if (section == 0){
            tablecell = 3
        }else{
            tablecell = 2
        }
        return tablecell
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
            
            break
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
            
            break
        case 3:
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
            
            break
        case 4:
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
            break
        case 5:
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
            break
        default:
            break
        }
        
        if (cellNumber >= 1 && cellNumber <= 3){
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
    
}
