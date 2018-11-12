//
//  BigimageViewController.swift
//  SlideshowApp
//
//  Created by 山中祐樹 on 2018/11/06.
//  Copyright © 2018 山中祐樹. All rights reserved.
//

import UIKit

class BigimageViewController: UIViewController {

    @IBOutlet weak var bigimageView: UIImageView!
    
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bigimageView.image = self.image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
