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


class CarrotViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var lbTimer: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var carrot: UIImageView!
    
    let noodleTime: TimeInterval = 60 * 15
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func countDown(sender: UIButton) {
        let tmr = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.tickTimer(_:)), userInfo: nil, repeats: true)
        tmr.fire()
        
        button.isHidden = true
        label1.isHidden = true
        label2.isHidden = true
        label3.isHidden = true
        carrot.isHidden = true
        
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
            trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60 * 9, repeats: false)
            
            let content = UNMutableNotificationContent()
            content.title = "Finish"
            content.body = "9minutes passed!"
            content.sound = UNNotificationSound.default()
            
            
            let request = UNNotificationRequest(identifier: "normal",
                                                content: content,
                                                trigger: trigger)
            
            
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            
            
            let alert = UIAlertController(title: "Finish", message:
                "15minutes passed!", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .destructive) { (action:UIAlertAction) in
                self.audioPlayer.stop()
            }
            
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            setAudioPlayer(soundName: "目覚ましアラーム", type: "mp3")
            audioPlayer.play()
            
        }
    }
    
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}







