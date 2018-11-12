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
        "img1",
        "img2",
        "img3",
        "img4",
        "img5",
        "img6",
        "img7",
        "img8",
        "img9",
        "img10",
        "img11",
        "img12",
        "img13",
        "img14",
        "img15",
        "img16",
        "img17",
        "img18",
        "img19",
        "img20",
        "img21",
        "img22",
        "img23",
        "img24",
        "img25",
        "img26",
        "img27",
        "img28",
        "img29",
        "img30",
        "img31",
        "img32",
        "img33",
        "img34",
        "img35",
        "img36",
        "img37",
        "img38",
        "img39",
        "img40",
        "img41",
        "img42",
        "img43",
        "img44",
        "img45",
        "img46",
        "img47",
        "img48",
        "img49",
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

