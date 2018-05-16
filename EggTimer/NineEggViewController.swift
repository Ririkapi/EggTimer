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

class NineEggViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    var tmr: Timer!

    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var lbTimer: UILabel!
    @IBOutlet weak var back2: UIButton!
    @IBOutlet weak var cancele2: UIButton!
    
    
    let noodleTime: TimeInterval = 60 * 1
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        cancele2.isHidden = true
        
    }
    
    func setAudioPlayer(soundName: String, type: String){
        let soundFilePath = Bundle.main.path(forResource: soundName, ofType: type)!
        let fileURL = URL(fileURLWithPath: soundFilePath)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: fileURL)
        }catch{
            
        }
    }

    
    @IBAction func countDown(sender: UIButton) {
        
        tmr = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.tickTimer(_:)), userInfo: nil, repeats: true)
        tmr.fire()
        
        button.isHidden = true
        back2.isHidden = true
        cancele2.isHidden = false
        
        
        
        
    }
    @objc func tickTimer(_ timer: Timer) {
        let df:DateFormatter = DateFormatter()
        df.dateFormat = "mm:ss"
        let dt:Date = df.date(from: lbTimer.text!)!
        let dt02 = Date(timeInterval: -1.0, since: dt)
        self.lbTimer.text = df.string(from:dt02)
        
        
        
        if self.lbTimer.text == "00:00"{
            timer.invalidate()
            
            let alert = UIAlertController(title: "Finish", message:
                "9min passed!", preferredStyle: .alert)
           
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
        
        let img8 = UIImage(named:"8egg.PNG")!
        if self.lbTimer.text == "08:59"{
            imageView.image = img8
        }
        let img9 = UIImage(named:"9egg.PNG")!
        if self.lbTimer.text == "00:10"{
            imageView.image = img9
        }
        
    }
    
    
    @IBAction func cancele() {
        if tmr.isValid == true {
            tmr.invalidate()
        }
    }
    
    @IBAction func back(){
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "Egg")
        present(nextView, animated: true, completion: nil)
    }

    
    


override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}

}






