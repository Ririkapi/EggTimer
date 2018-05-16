//
//  ViewController.swift
//  timer3
//
//  Created by Ririka on 2018/04/28.
//  Copyright © 2018年 litech. All rights reserved.
//

import UIKit
import AVFoundation
import UserNotifications


class ThreeViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    var tmr: Timer!

    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var lbTimer: UILabel!
    @IBOutlet weak var maru:UIImageView!
    let noodleTime: TimeInterval = 60 * 3
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cancele2: UIButton!
    @IBOutlet weak var back2: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        cancele2.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func countDown(sender: UIButton) {
        tmr = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.tickTimer(_:)), userInfo: nil, repeats: true)
        tmr.fire()
        
        button.isHidden = true
        maru.isHidden = true
        cancele2.isHidden = false
        back2.isHidden = true
        
        
        
    }
    func setAudioPlayer(soundName: String, type: String){
        let soundFilePath = Bundle.main.path(forResource: soundName, ofType: type)!
        let fileURL = URL(fileURLWithPath: soundFilePath)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: fileURL)
        }catch{
            
        }
    }
    
    
    @objc func tickTimer(_ timer: Timer) {
        let df:DateFormatter = DateFormatter()
        df.dateFormat = "mm:ss"
        let dt:Date = df.date(from: lbTimer.text!)!
        let dt02 = Date(timeInterval: -1.0, since: dt)
        self.lbTimer.text = df.string(from:dt02)
        
        if self.lbTimer.text == "00:00"{
            timer.invalidate()
            
            let trigger: UNNotificationTrigger
            trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60 * 3, repeats: false)
            
            let content = UNMutableNotificationContent()
            content.title = "Finish"
            content.body = "1minutes passed!"
            content.sound = UNNotificationSound.default()
            
            
            let request = UNNotificationRequest(identifier: "normal",
                                                content: content,
                                                trigger: trigger)
            
            
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            
            
            let alert = UIAlertController(title: "Finish", message:
                "3minutes passed!", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .destructive) { (action:UIAlertAction) in
                self.audioPlayer.stop()
                let storyboard: UIStoryboard = self.storyboard!
                let nextView = storyboard.instantiateViewController(withIdentifier: "View")
                self.present(nextView, animated: true, completion: nil)
                
            }
            
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            setAudioPlayer(soundName: "目覚ましアラーム", type: "mp3")
            audioPlayer.play()
            
        }
        if self.lbTimer.text == "00:10"{
            let trigger: UNNotificationTrigger
            trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
            
            let content = UNMutableNotificationContent()
            content.title = "Finish"
            content.body = "9minutes passed!"
            content.sound = UNNotificationSound.default()
            
            
            let request = UNNotificationRequest(identifier: "normal",
                                                content: content,
                                                trigger: trigger)
            
            
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        }
        let img1 = UIImage(named:"aka.png")!
        if self.lbTimer.text == "02:59"{
            imageView.image = img1
        }
        
        let img2 = UIImage(named:"kiiro.png")!
        if self.lbTimer.text == "02:30"{
            imageView.image = img2
        }
        
        let img3 = UIImage(named:"midori.png")!
        if self.lbTimer.text == "02:00"{
            imageView.image = img3
        }
        let img4 = UIImage(named:"mizuiro.png")!
        if self.lbTimer.text == "01:30"{
            imageView.image = img4
        }
        let img5 = UIImage(named:"aoo.png")!
        if self.lbTimer.text == "01:00"{
            imageView.image = img5
        }
        let img6 = UIImage(named:"ao.png")!
        if self.lbTimer.text == "00:30"{
            imageView.image = img6
        }
        
    }
    
    @IBAction func cancele() {
        if tmr.isValid == true {
            tmr.invalidate()
        }
    }
    
    @IBAction func back(){
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "Timer")
        present(nextView, animated: true, completion: nil)
    }
}







