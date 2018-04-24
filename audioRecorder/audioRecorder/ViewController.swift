//
//  ViewController.swift
//  audioRecorder
//
//  Created by Darkhan on 09.04.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController, AVAudioRecorderDelegate,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    var audioPlayer: AVAudioPlayer!
    var numberOfRecords = 0
    @IBOutlet weak var buttonLabel: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        recordingSession = AVAudioSession.sharedInstance()
        AVAudioSession.sharedInstance().requestRecordPermission { (isPermitted) in
            if isPermitted{
                print("Success!")
            }
        }
        if let number: Int = UserDefaults.standard.object(forKey: "myNumber") as? Int{
            numberOfRecords = number
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    func getDirectory() -> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    func displayAlert(_ title: String, _ message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "dissmiss", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    @IBAction func recordAction(_ sender: UIButton) {
        if audioRecorder == nil{
            numberOfRecords += 1
            let fileName = getDirectory().appendingPathComponent("\(numberOfRecords).m4a")
            let settings = [AVFormatIDKey: Int(kAudioFormatMPEG4AAC), AVSampleRateKey: 12000, AVNumberOfChannelsKey: 1, AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue]
            
            do
            {
                audioRecorder = try AVAudioRecorder(url: fileName, settings: settings)
                audioRecorder.delegate = self
                audioRecorder.record()
                
                buttonLabel.setTitle("Stop", for: .normal)
            }catch{
                audioRecorder = nil
                displayAlert("Ups!", "Recording failed")
            }
        }else{
            audioRecorder.stop()
            audioRecorder = nil
            UserDefaults.standard.setValue(numberOfRecords, forKey: "myNumber")
            buttonLabel.setTitle("Record", for: .normal)
            tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRecords
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
        cell?.textLabel?.text = String(indexPath.row+1)
        
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let path = getDirectory().appendingPathComponent("\(indexPath.row+1).m4a")
        do{
            audioPlayer = try AVAudioPlayer.init(contentsOf: path)
            audioPlayer.play()
        }catch{
            
        }
    }
}

