//
//  StopwatchViewController.swift
//  FinalProject
//
//  Created by Ashwin Kasargode on 12/7/18.
//  Copyright © 2018 Ashwin Kasargode. All rights reserved.
//

import UIKit

class StopwatchViewController: UIViewController {
    
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    
    var time = Double(0)
    var minutes = 0
    var hours = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        equalOut()
    }
    
    @objc func action() {
        time += 1
        equalOut()
        
        if time == 60 {
            minutes += 1
            time = 0
            equalOut()
        }
        
        if minutes == 60 {
            hours += 1
            minutes = 0
            time = 0
            equalOut()
        }
    }
    
    @IBAction func start(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(StopwatchViewController.action), userInfo: nil, repeats: true)
    }
    
    @IBAction func pause(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func reset(_ sender: Any) {
        timer.invalidate()
        time = 0
        minutes = 0
        hours = 0
        equalOut()
    }
    
    func equalOut() {
        secondLabel.text = String(time)
        minuteLabel.text = String(minutes)
        hourLabel.text = String(hours)
    }
    
    @IBAction func back(_ sender: Any) {
        time = Double(secondLabel.text!)!
        minutes = Int(minuteLabel.text!)!
        hours = Int(hourLabel.text!)!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backFromStopwatch" {
            if let dvc = segue.destination as? ViewController {
                dvc.timeV = self.time
                dvc.minutesV = self.minutes
                dvc.hoursV = self.hours
            }
        }
    }
}
