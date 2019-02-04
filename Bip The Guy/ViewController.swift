//
//  ViewController.swift
//  Bip The Guy
//
//  Created by 18ericz on 2/4/19.
//  Copyright © 2019 18ericz. All rights reserved.
//

import UIKit
import AVFoundation



class ViewController: UIViewController {

    @IBOutlet weak var imageToPunch: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    var audioPlayer = AVAudioPlayer()

    func animateImage(){
        let bounds = self.imageToPunch.bounds
        let shrinkValue: CGFloat = 60
        self.imageToPunch.bounds = CGRect(x: self.imageToPunch.bounds.origin.x+shrinkValue, y: self.imageToPunch.bounds.origin.y+shrinkValue, width: self.imageToPunch.bounds.size.width-shrinkValue, height: self.imageToPunch.bounds.size.height-shrinkValue)
        
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: [], animations: {self.imageToPunch.bounds = bounds}, completion: nil )
    }
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer){
        if let sound = NSDataAsset(name: soundName){
            //check if sound.data is actual
            do{
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            }catch{
                print("Error: data in \(soundName) could not be played as a sound")
            }
            
        }else{
            //if reading didnt work
            print("Error: Sound \(soundName) did not load")
        }
    }
    
    @IBAction func libraryPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func cameraPressed(_ sender: UIButton) {
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        animateImage()
        playSound(soundName: "punchSound", audioPlayer: &audioPlayer)
    }
    
}

