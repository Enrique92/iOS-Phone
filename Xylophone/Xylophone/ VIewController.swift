//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
// Audio import
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate{
    
    // Create a instance of the AudioPlayer
    var audioPlayer: AVAudioPlayer!
    
    // Set all the sounds
    var soundArray = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    
    var selectedSoundFileName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func notePressed(_ sender: UIButton) {
        // Send the tag to the method
        selectedSoundFileName = soundArray[sender.tag - 1]
        
        // Call the playSound
        playSound()
    }
    
    func playSound() {
        // Pass the url of the audio and type
        let soundUrl = Bundle.main.url(forResource: selectedSoundFileName, withExtension: "wav")!
        
        do {
            // Create the sound for the note
            audioPlayer = try AVAudioPlayer(contentsOf: soundUrl)
        } catch {
            print(error)
        }
        
        // Play the audio
        //audioPlayer.prepareToPlay()
        audioPlayer.play()
    }
}

