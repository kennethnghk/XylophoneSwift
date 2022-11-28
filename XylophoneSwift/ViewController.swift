//
//  ViewController.swift
//  XylophoneSwift
//
//  Created by kenneth.ng@lifehikes.com on 28/11/2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        print("key pressed")
        
//        print(sender.titleLabel?.text)
        
        playSound(soundName: sender.titleLabel!.text ?? "C")
        
    }
    
    func playSound(soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "wav") else { return }
    
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try! AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    
    }
}
