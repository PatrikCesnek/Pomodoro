//
//  ChillViewController.swift
//  Pomodoro
//
//  Created by Patrik Cesnek on 13/05/2020.
//  Copyright © 2020 Patrik Cesnek. All rights reserved.
//

import AVFoundation
import UIKit

class ChillViewController: UIViewController {
    
    @IBOutlet weak var chillProgress: UIProgressView!
    @IBOutlet weak var timeLeft: UILabel!
    @IBOutlet var chillLabel: UILabel!
    
    var totalTime: Float = ViewController().chillTime
    var secondsPassed: Float = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        
        let userDefaults = UserDefaults.standard
        self.totalTime = userDefaults.object(forKey: "chillTime") as? Float ?? 1
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        chillLabel.text = "Chill and take a break."
    }
    
    @objc func updateTimer () {
//        var newTotal = totalTime * 60
//        if secondsPassed < newTotal {
        if secondsPassed < totalTime {
            secondsPassed += 1
            chillProgress.progress = Float(secondsPassed) / Float(totalTime)
//            workProgress.progress = Float(secondsPassed) / Float(newTotal)

        } else {
            AudioServicesPlayAlertSound(SystemSoundID(1052))
            timer.invalidate()
            print("time has passed")
            self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)

        }
        
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        print("Done")
        
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
}
