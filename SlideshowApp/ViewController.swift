//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 山中祐樹 on 2018/11/06.
//  Copyright © 2018 山中祐樹. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var timer : Timer?
    var timer_sec: Float = 0
    
    var dispImageNo = 0
    func dispImage() {
        let imageName = [
        "1.jpg",
        "2.jpg",
        "3.jpg",
        "4.jpg",
        "5.jpg",
        "6.jpg",
        "7.jpg",
        "8.jpg",
        "9.jpg",
        "10.jpg",
        "11.jpg",
        "12.jpg",
        "13.jpg",
        "14.jpg",
        "15.jpg",
        "16.jpg",
        "17.jpg",
        "18.jpg",
        "19.jpg",
        "20.jpg",
        "21.jpg",
        "22.jpg",
        "23.jpg",
        "24.jpg",
        "25.jpg",
        "26.jpg",
        "27.jpg",
        "28.jpg",
        "29.jpg",
        "30.jpg",
        "31.jpg",
        "32.jpg",
        "33.jpg",
        "34.jpg",
        "35.jpg",
        "36.jpg",
        "37.jpg",
        "38.jpg",
        "39.jpg",
        "41.jpg",
        "40.jpg",
        "42.jpg",
        "43.jpg",
        "44.jpg",
        "45.jpg",
        "46.jpg",
        "47.jpg",
        "48.jpg",
        "49.jpg",
        ]
        
        if dispImageNo < 0 {
            dispImageNo = 48
        }
        
        if dispImageNo > 48 {
            dispImageNo = 0
        }
        
        let name = imageName[dispImageNo]
        let image = UIImage(named: name)
        imageView.image = image
    }
    
    @IBAction func onTapImage(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "bigimage", sender: nil)
        //画像をタップして遷移させるにはTap Gesture Recognizerを使う
        self.timer?.invalidate()
        self.timer = nil
    }
    
    @objc func updateTimer(_ timer: Timer){
        self.timer_sec += 1.0  //タイマーを1秒ずつ進める
        dispImageNo += 1  //配列から1個ずつ画像を順番に取り出す
        dispImage()
    }
    
    @IBOutlet weak var back: UIButton!
    @IBAction func back(_ sender: Any) {
        //戻るボタン　①押すと一つ前の画像に戻る　②画像１が表示されている時押すと画像３が表示される
            dispImageNo -= 1
            dispImage()
    }
    
    @IBOutlet weak var startstop: UIButton! //ボタンを押した時の表示を変える用のアウトレット接続
    @IBAction func startstop(_ sender: Any) {
        
        //タイマーが無のとき、
        if self.timer == nil {
        //再生ボタンをタップすると自動送りが始まり２秒毎にスライドする
            self.timer = Timer.scheduledTimer(timeInterval:2.0,target: self,selector: #selector(updateTimer(_:)),userInfo: nil,repeats: true)
            startstop.setTitle("停止", for: UIControlState.normal)
            back.isEnabled = false
            go.isEnabled = false
            
        //再生ボタンをタップすると停止ボタン、停止ボタンを押すと再生ボタンに変わる
        }else{
            self.timer?.invalidate()
            self.timer = nil
            startstop.setTitle("再生", for: UIControlState.normal)
            back.isEnabled = true
            go.isEnabled = true
            }
        
        //自動送り中は進む戻るボタンは使用不可
    }
    
    @IBOutlet weak var go: UIButton!
    @IBAction func go(_ sender: Any) {
        //進むボタン
        dispImageNo += 1
        dispImage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let image = UIImage(named:"img1")
        imageView.image = image
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let bigimageViewController:BigimageViewController = segue.destination as! BigimageViewController
        bigimageViewController.image = imageView.image
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        self.timer?.invalidate()
        self.timer = nil
        startstop.setTitle("再生", for: UIControlState.normal)
        back.isEnabled = true
        go.isEnabled = true
    }

}

