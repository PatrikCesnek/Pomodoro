//
//  WorkViewController.swift
//  Pomodoro
//
//  Created by Patrik Cesnek on 12/05/2020.
//  Copyright © 2020 Patrik Cesnek. All rights reserved.
//

import UIKit
import AVFoundation

class WorkViewController: UIViewController {
    
    @IBOutlet weak var workProgress: UIProgressView!
    @IBOutlet weak var timeLeft: UILabel!
    @IBOutlet var workLabel: UILabel!
    
    var totalTime: Float = 0
    var secondsPassed: Float = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        var bgTask = UIBackgroundTaskIdentifier(rawValue: 2)
            bgTask = UIApplication.shared.beginBackgroundTask(expirationHandler: {
                UIApplication.shared.endBackgroundTask(bgTask)
            })
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        RunLoop.current.add(timer, forMode: RunLoop.Mode.default)

        
         updateTimer()
        
        workLabel.text = "Dedicate this time to work and focus on your task."
    }
    
    @objc func updateTimer () {
        let userDefaults = UserDefaults.standard
        //get the time from UserDefaults
        totalTime = userDefaults.object(forKey: "workTime") as? Float ?? 0.0
//        var newTotal = totalTime * 60
//        if secondsPassed < newTotal {
        if secondsPassed < totalTime {
            secondsPassed += 1
//            workProgress.progress = Float(secondsPassed) / Float(newTotal)
            workProgress.progress = Float(secondsPassed) / Float(totalTime)
        } else {
            AudioServicesPlayAlertSound(SystemSoundID(1054))
            timer.invalidate()
            print("Work time has passed")
            self.performSegue(withIdentifier: "timeToChill", sender: self)
        }
        
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
  
        self.performSegue(withIdentifier: "timeToChill", sender: self)
    }
    
    
}
