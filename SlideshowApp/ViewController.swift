//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Keiko Arita on 2016/09/28.
//  Copyright © 2016年 Keiko.Kurokawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 表示する画像を配列として定義
    let imagePhoto = ["photo1.jpg","photo2.jpg","photo3.jpg","photo4.jpg","photo5.jpg"]
    
    //timer用の変数を宣言
    var timer: NSTimer!
    
    // 要素数を取得
//    var count = imagePhoto.count　　// エラーが発生する為いったん数値で記述
    var count = 4
    
    // 要素番号用の変数を宣言
    var i = 0
    
    
    // 画面を読み込んだ時にphoto1.jpgを表示する
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 表示する画像を設定
        let showPhoto = UIImage(named: imagePhoto[i])
        
        // 画像をUIImageViewに設定
        imageView.image = showPhoto
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // 画面遷移で値を渡す
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let zoomViewController:ZoomViewController = segue.destinationViewController as! ZoomViewController
        zoomViewController.i = i
        // timerを停止
        stopTimer()
        // timerを初期化
        timer = nil
        // 「停止」→「再生」に書き換える
        startStop.setTitle("再生", forState: .Normal)
        // 無効にしていたボタンを有効に戻す
        backButton.enabled = true
        nextButton.enabled = true

    }

    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var startStop: UIButton!
    
    // 「進む」ボタンをタップした時
    @IBAction func nextPhoto(sender: AnyObject) {
        // 要素番号に+1する（次の写真を表示するため）
        i = i + 1
        
        // もしiが要素数以上の場合は先頭の写真を表示させる
        if i  >= count {
            i = 0 // 先頭に戻る
        }

        // UIImageを設定
        let showPhoto = UIImage(named: imagePhoto[i])
        
        // 画像をUIImageViewに設定
        imageView.image = showPhoto
        
        // UIImageViewをViewに追加する
        self.view.addSubview(imageView)
    }
    
    // 「戻る」ボタンをタップした時
    @IBAction func backPhoto(sender: AnyObject) {
        // 配列の要素番号に-1
        i = i - 1

        // もしiがマイナスの場合は配列の一番最後の写真を表示させる
        if i  < 0 {
            i = count - 1 // 一番最後
        }

        // 定数にUIImageを設定
        let showPhoto = UIImage(named: imagePhoto[i])
        
        // 画像をUIImageViewに設定
        imageView.image = showPhoto
        
        // UIImageViewをViewに追加する
        self.view.addSubview(imageView)
    }
    

    @IBAction func startStop(sender: AnyObject) {
        // timerが動いている場合、
        if timer != nil {
            // timerを止める
            timer.invalidate()
            // timerの初期化
            timer = nil
            // 「停止」→「再生」に書き換える
            startStop.setTitle("再生", forState: .Normal)
            // 無効にしていたボタンを有効に戻す
            backButton.enabled = true
            nextButton.enabled = true

        }
        else{
            
           timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.temporalEvent(_:)), userInfo: nil, repeats: true)
            // 「再生」→「停止」に書き換える
            startStop.setTitle("停止", forState: .Normal)
            // 戻ると進むのボタンを無効化
            backButton.enabled = false
            nextButton.enabled = false
            
            }
    }

        //一定タイミングで繰り返し呼び出される関数
    func temporalEvent(sender:NSTimer){
                // 要素番号に+1する（次の写真を表示するため）
                i = i + 1
            
                // もしiが要素数以上の場合は先頭の写真を表示させる
                if i  >= count {
                    i = 0 // 先頭に戻る
                }
            
                // UIImageを設定
                let showPhoto = UIImage(named: imagePhoto[i])
            
                // 画像をUIImageViewに設定
                imageView.image = showPhoto
            
                // UIImageViewをViewに追加する
                self.view.addSubview(imageView)
        }
        
        func stopTimer(){
            if timer != nil {
                timer?.invalidate(); timer = nil 
            }
        }
    

    @IBAction func unwind(segue: UIStoryboardSegue) {
    }


}

