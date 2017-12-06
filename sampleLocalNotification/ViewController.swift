//
//  ViewController.swift
//  sampleLocalNotification
//
//  Created by Eriko Ichinohe on 2017/12/06.
//  Copyright © 2017年 Eriko Ichinohe. All rights reserved.
//

import UIKit
import UserNotifications    //ローカル通知に必要なフレームワーク

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //通知機能の許可を促す処理
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert,.sound]){(granted,error) in }
        
        
    }

    @IBAction func pushSecond(_ sender: UIButton) {
    
        // Notificationのインスタンス作成
        let content = UNMutableNotificationContent()
        
        // タイトル設定
        content.title = "ファイヤー！！"
        
        // 本文設定
        content.body = "10秒経ったよ"
        
        // 音設定
        content.sound = UNNotificationSound.default()
        
        // トリガー設定（いつ発火するかの設定。今回は10秒後)
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 10, repeats: false)
        
        // リクエストの生成（通知IDをセット）
        let request = UNNotificationRequest.init(identifier: "ID_TenSecond", content: content, trigger: trigger)
        
        // 通知のセット
        let center = UNUserNotificationCenter.current()
        center.add(request){(error) in }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

