//
//  ViewController.swift
//  timer3
//
//  Created by Ririka on 2018/04/28.
//  Copyright © 2018年 litech. All rights reserved.
//

import UIKit
import AVFoundation

class TimerViewController: UIViewController {
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(){
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "View")
        present(nextView, animated: true, completion: nil)
    }
    
}




