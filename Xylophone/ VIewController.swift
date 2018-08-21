//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    var audioPlayer: AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaultNote: URL = Bundle.main.url(forResource: "note1", withExtension: "wav")!
        prepareToPlay(defaultNote)
    }
    
    @IBAction func notePressed(_ sender: UIButton) {
        sender.showsTouchWhenHighlighted = true

        guard let url = Bundle.main.url(forResource: "note\(sender.tag)", withExtension: "wav")
            else {return}

        audioPlayer?.replaceCurrentItem(with: AVPlayerItem(url: url))
        audioPlayer?.playImmediately(atRate: 1.0)
    }
    
    func prepareToPlay(_ url: URL) {
        // Create asset to be played
        let asset = AVAsset(url: url)
        
        let assetKeys = [
            "playable",
            "hasProtectedContent"
        ]
        // Create a new AVPlayerItem with the asset and an
        // array of asset keys to be automatically loaded
        let playerItem = AVPlayerItem(asset: asset,
                                  automaticallyLoadedAssetKeys: assetKeys)
        
        
        // Associate the player item with the player
        audioPlayer = AVPlayer(playerItem: playerItem)
    }
    
}

