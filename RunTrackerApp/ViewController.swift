//
//  ViewController.swift
//  RunTrackerApp
//
//  Created by Ashwin Kasargode on 4/18/19.
//  Copyright © 2019 Ashwin Kasargode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timeV = Double(0)
    var minutesV = 0
    var hoursV = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopwatch" {
            if let dvc = segue.destination as? StopwatchViewController {
                dvc.time = self.timeV
                dvc.minutes = self.minutesV
                dvc.hours = self.hoursV
            }
        }
    }
}

