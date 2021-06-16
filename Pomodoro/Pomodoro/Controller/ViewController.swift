//
//  ViewController.swift
//  Pomodoro
//
//  Created by Patrik Cesnek on 12/05/2020.
//  Copyright © 2020 Patrik Cesnek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var workLabel: UILabel!
    @IBOutlet weak var workSlider: UISlider!
    @IBOutlet weak var chillLabel: UILabel!
    @IBOutlet weak var chillSlider: UISlider!
    
    var timerModel = TimerModel(workTimer: 0.0, chillTimer: 0.0)
    
    var workTime: Float = 0
    var chillTime: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true

    }

    @IBAction func workTimeChanged(_ sender: UISlider) {
        
        let workTimeString = String(format: "%.0f", sender.value)
        
        timerModel.workTimer = Float(workSlider.value)
                
        workLabel.text = workTimeString + " min"
    }
    
    @IBAction func chillTimeChanged(_ sender: UISlider) {
        
        let chillTimeString = String(format: "%.0f", sender.value)
        
        timerModel.chillTimer = Float(chillSlider.value)
        
        chillLabel.text = chillTimeString + " min"
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        workTime = workSlider.value
        chillTime = chillSlider.value
                       
    }
    
    
    
    @IBAction func startPressed(_ sender: UIButton) {
        
        workTime = workSlider.value
        chillTime = chillSlider.value
                
        let userDefaults = UserDefaults.standard
        
        //  store the time into UserDefaults
    
        userDefaults.set(workTime, forKey:"workTime")
        userDefaults.set(chillTime, forKey: "chillTime")
        
        print("work time: \(workTime) minutes, chill time: \(chillTime) minutes")
        
        self.performSegue(withIdentifier: "goToWork", sender: self)
    }
    
        
}

