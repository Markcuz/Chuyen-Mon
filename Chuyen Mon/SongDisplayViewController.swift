//
//  SongDisplayViewController.swift
//  Chuyen Mon
//
//  Created by Marcus Pham on 5/05/2016.
//  Copyright © 2016 Marcus Pham. All rights reserved.
//

import UIKit
import AVFoundation

class SongDisplayViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var pdfDisplay: UIWebView!
    @IBOutlet weak var playTime: UILabel!
    @IBOutlet weak var toggleButton: UIButton!

    @IBOutlet weak var sliderPosition: UISlider!
    
    var doc: PDF!
    var audioPlayer =  AVAudioPlayer()
    var isPlaying = false
    var timer:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let pdf = Bundle.main.url(forResource: doc.path, withExtension: "pdf", subdirectory: "Documents", localization: nil)  {
            let req = URLRequest(url: pdf)
            pdfDisplay.loadRequest(req)
            pdfDisplay.scalesPageToFit = true
            self.view.addSubview(pdfDisplay)
        }
        
        pdfDisplay.scalesPageToFit = true
        
        let path = Bundle.main.url(forResource: doc.path2, withExtension: "mp3", subdirectory: "Music", localization: nil)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: path!)
            sliderPosition.minimumValue = 0
            sliderPosition.maximumValue = Float(audioPlayer.duration)
        }
        catch {
            print("Failed to open song")
        }
    }
    
    // MARK: Actions
    
    @IBAction func stopButton(_ sender: UIButton) {
        
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        isPlaying = false
        
        self.toggleButton.setImage(UIImage(named: "PlayButton"), for: UIControlState());
        
    }
    
    @IBAction func playPauseButton(_ sender: UIButton) {
        if(!isPlaying) {
            audioPlayer.play()
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(SongDisplayViewController.updateTime), userInfo: nil, repeats: true)
            isPlaying = true
            self.toggleButton.setImage(UIImage(named: "PauseButton"), for: UIControlState());
        }
        else {
            audioPlayer.pause()
            isPlaying = false
            self.toggleButton.setImage(UIImage(named: "PlayButton"), for: UIControlState());
        }
    }
    
    func updateTime() {
        let currentTime = Int(audioPlayer.currentTime)
        let minutes = currentTime/60
        let seconds = currentTime - minutes * 60
        
        playTime.text = NSString(format: "%02d:%02d", minutes,seconds) as String

        sliderPosition.value = Float(audioPlayer.currentTime)
        if(audioPlayer.currentTime > audioPlayer.duration-1) {
            isPlaying = false
            self.toggleButton.setImage(UIImage(named: "PlayButton"), for: UIControlState());
        }
    }
    
    
    @IBAction func slider(_ sender: UISlider) {
        audioPlayer.currentTime = Double(sliderPosition.value)
    }
    
    //MARK: Navigation
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if (isPlaying)
        {
            audioPlayer.stop()
        }
    }


}
