    import UIKit
    import AVFoundation
    
    class TimerViewController: UIViewController {
        
        var audioPlayer: AVAudioPlayer!
        
        @IBOutlet weak var button: UIButton!
        @IBOutlet weak var lbTimer: UILabel!
        @IBOutlet weak var label1: UILabel!
        @IBOutlet weak var label2: UILabel!
        
        let oneTime: TimeInterval = 60 * 5
        
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
        @IBAction func onecountDown(sender: UIButton) {
            let tmr = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.tickTimer(_:)), userInfo: nil, repeats: true)
            tmr.fire()
            
            button.isHidden = true
            label1.isHidden = true
            label2.isHidden = true
            
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
                let alert = UIAlertController(title: "Finish", message:
                    "5minutes passed!", preferredStyle: .alert)
                
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
    
        
        let threetime: TimeInterval = 60 * 3
        
        @IBAction func threecountDown(sender: UIButton) {
            let tmr = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.tickTimer(_:)), userInfo: nil, repeats: true)
            tmr.fire()
            
            button.isHidden = true
            label1.isHidden = true
            label2.isHidden = true
            
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
                let alert = UIAlertController(title: "Finish", message:
                    "5minutes passed!", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "OK", style: .destructive) { (action:UIAlertAction) in
                    self.audioPlayer.stop()
                }
                
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
                setAudioPlayer(soundName: "目覚ましアラーム", type: "mp3")
                audioPlayer.play()
                
            }
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
