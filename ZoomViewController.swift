//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by Keiko Arita on 2016/09/29.
//  Copyright © 2016年 Keiko.Kurokawa. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController {

    @IBOutlet weak var zoomView: UIImageView!

    // 表示する画像を配列として定義
    let imagePhoto = ["photo1.jpg","photo2.jpg","photo3.jpg","photo4.jpg","photo5.jpg"]

    // スライドショー画面から受け取るための変数を宣言
    var i:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // 表示する画像を設定
        let showPhoto = UIImage(named: imagePhoto[i])
        
        // 画像をUIImageViewに設定
        zoomView.image = showPhoto
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
