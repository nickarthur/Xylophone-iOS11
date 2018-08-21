//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController{
    
    var sounds : [SystemSoundID] = [1, 2, 3, 4, 5, 6, 7]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 0...sounds.count-1 {
            let fileName : String = "note\(sounds[index])"
            
            if let soundURL = Bundle.main.url(forResource: fileName, withExtension: "wav") {
                AudioServicesCreateSystemSoundID(soundURL as CFURL, &sounds[index])
            }
        }
    }
    
    @IBAction func notePressed(_ sender: UIButton) {
        sender.showsTouchWhenHighlighted = true
        
        switch sender.tag {
        case 1:
            AudioServicesPlaySystemSound(sounds[0])
        case 2:
            AudioServicesPlaySystemSound(sounds[1])
        case 3:
            AudioServicesPlaySystemSound(sounds[2])
        case 4:
            AudioServicesPlaySystemSound(sounds[3])
        case 5:
            AudioServicesPlaySystemSound(sounds[4])
        case 6:
            AudioServicesPlaySystemSound(sounds[5])
        default:
            AudioServicesPlaySystemSound(sounds[6])
        }
    }
}

