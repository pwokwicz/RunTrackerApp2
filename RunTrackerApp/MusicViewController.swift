//
//  MusicViewController.swift
//  RunTrackerApp
//
//  Created by Ashwin Kasargode on 5/21/19.
//  Copyright © 2019 Ashwin Kasargode. All rights reserved.
//

import UIKit

class MusicViewController: UIViewController {



    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func spotifyTapped(_ sender: UIButton) { UIApplication.shared.open(URL(string:"https://open.spotify.com")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func soundcloudTapped(_ sender: UIButton) {
        UIApplication.shared.open(URL(string:"https://soundcloud.com")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func pandoraTapped(_ sender: UIButton) {
        UIApplication.shared.open(URL(string:"https://www.pandora.com")! as URL, options: [:], completionHandler: nil)
    }
}


