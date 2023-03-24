
import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var topLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 300,"Medium": 420,"Hard": 720] //5,7,12 Minutes
    
    var counter = 10
    
    var totalTime = 0
    
    var secondsPassed = 0
    
    var timer = Timer()

    @objc func updateTimer(){
        
        
//        if counter > 0 {
//                print("\(counter) seconds to the eggs being done")
//
//            //progressBar.progress = Float(counter)
//                counter -= 1
//            }
        
        if secondsPassed < totalTime{
            
            secondsPassed += 1
            
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            
            progressBar.progress = percentageProgress
            
           
        }
            
        else {
            timer.invalidate()
            self.topLabel.text = "Eggs are done!!"
            playSound()
        }
    }
    
    func playSound(){
        
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        //progressBar.progress = 1.0
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        self.topLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        //        if hardness == "Soft"{
        //            print(softTime)
        //        }
        //        else if hardness == "Medium"{
        //            print(mediumTime)
        //        }
        //        else
        //        {
        //            print(hardTime)
        //        }
        
        switch hardness{
        case "Soft":
            print(eggTimes["Soft"]!)
        case "Medium":
            print(eggTimes["Medium"]!)
        case "Hard":
            print(eggTimes["Hard"]!)
        default:
            print("Error")
        }
    }
}
