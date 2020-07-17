//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Sunhee Park on 2020/07/10.
//  Copyright © 2020 Sunhee Park. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    // MARK:- Properties
    var player: AVAudioPlayer!
    var timer: Timer!
    
    // MARK: IBOulets
    @IBOutlet var PlayPauesButton : UIButton!
    @IBOutlet var timeLabel : UILabel!
    @IBOutlet var progressSlider : UISlider!
    
    // MARK:- Methods
    // MARK: Custom Method
    func initializePlayer(){
        
        guard let soundAsset : NSDataAsset = NSDataAsset(name : "sound") else {
            print("음원 파일 에셋을 가져올 수 없습니다.")
            return
        }
        
        do {
            try self.player = AVAudioPlayer(data: soundAsset.data)
            self.player.delegate = self
        } catch let error as NSError {
            print("플레이어 초기화 실패")
            print("코드 : \(error.code), 메세지 : \(error.localizedDescription)")
        }
        
        self.progressSlider.maximumValue = Float(self.player.duration)
        self.progressSlider.minimumValue = 0
        self.progressSlider.value = Float(self.player.currentTime)
    }
    
    func updateTimeLabelText(time: TimeInterval) {
        let minute : Int = Int(time / 60 )
        let second : Int = Int(time.truncatingRemainder(dividingBy: 60))
        let milisecond : Int = Int(time.truncatingRemainder(dividingBy: 1) * 100)
        
        let timeText : String = String(format: "%02ld:%02ld:%02ld", minute, second, milisecond)
        
        self.timeLabel.text = timeText
        
    }
    
    func makeAndFireTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [unowned self] (timer : Timer) in
                
            if self.progressSlider.isTracking { return }
            
            self.updateTimeLabelText(time: self.player.currentTime)
            self.progressSlider.value = Float(self.player.currentTime)
        })
        self.timer.fire()
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        
        guard let error : Error = error else {
            print("오디오 플레이어 디코드 오류 발생")
            return
        }
        
        let message : String
        message = "오디오 플레이어 오류 발생 \(error.localizedDescription)"
        
        let alert : UIAlertController = UIAlertController(title: "알림", message: message, preferredStyle: UIAlertController.Style.alert)
        
        let okAction : UIAlertAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default) { (action: UIAlertAction) -> Void in
            
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        self.PlayPauesButton.isSelected = false
        self.progressSlider.value = 0
        self.updateTimeLabelText(time: 0)
        self.invalidateTimer()
    }
    
    func invalidateTimer() {
        self.timer.invalidate()
        self.timer = nil
    }
    
    func addViewWithCode() {
        self.addPlayPauseButton()
        self.addTimeLabel()
        self.addProgressSlider()
    }
    
    func addPlayPauseButton() {
        let button : UIButton = UIButton(type: UIButton.ButtonType.custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(button)
        
        button.setImage(UIImage(named: "button_play"), for: UIControl.State.normal)
        button.setImage(UIImage(named: "button_pause"), for: UIControl.State.selected)
        
        button.addTarget(self, action: #selector(self.TouchUpPlayPauseButton(_:)), for: UIControl.Event.touchUpInside)
        
        let centerX: NSLayoutConstraint
        centerX = button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        
        let centerY: NSLayoutConstraint
        centerY = NSLayoutConstraint(item: button, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 0.8, constant: 0)
        
        let width: NSLayoutConstraint
        width = button.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3)
        
        let ratio: NSLayoutConstraint
        ratio = button.heightAnchor.constraint(equalTo: button.widthAnchor, multiplier: 1)
        
        centerX.isActive = true
        centerY.isActive = true
        width.isActive = true
        ratio.isActive = true
        
        self.PlayPauesButton = button
    }
    
    func addTimeLabel() {
        let timeLabel: UILabel = UILabel()
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(timeLabel)
        
        timeLabel.textColor = UIColor.black
        timeLabel.textAlignment = NSTextAlignment.center
        timeLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        
        let centerX: NSLayoutConstraint
        centerX = timeLabel.centerXAnchor.constraint(equalTo: self.PlayPauesButton.centerXAnchor)
        
        let top: NSLayoutConstraint
        top = timeLabel.topAnchor.constraint(equalTo: self.PlayPauesButton.bottomAnchor, constant: 8)
        
        centerX.isActive = true
        top.isActive = true
        
        self.timeLabel = timeLabel
        self.updateTimeLabelText(time: 0)
        
    }
    
    func addProgressSlider() {
        let slider: UISlider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(slider)
        
        slider.minimumTrackTintColor = UIColor.red
        
        slider.addTarget(self, action: #selector(self.sliderValueChanged(_:)), for: UIControl.Event.valueChanged)
        
        let safeAreaGuide: UILayoutGuide = self.view.safeAreaLayoutGuide
        
        let centerX: NSLayoutConstraint
        centerX = slider.centerXAnchor.constraint(equalTo: self.timeLabel.centerXAnchor)
        
        let top:NSLayoutConstraint
        top = slider.topAnchor.constraint(equalTo: self.timeLabel.bottomAnchor, constant: 8)
        
        let leading: NSLayoutConstraint
        leading = slider.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16)
        
        let trailing: NSLayoutConstraint
        trailing = slider.leadingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16)
        
        centerX.isActive = true
        top.isActive = true
        leading.isActive = true
        trailing.isActive = true
        
        self.progressSlider = slider
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.addViewWithCode()
        self.initializePlayer()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func TouchUpPlayPauseButton(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            self.player?.play()
        } else {
            self.player?.pause()
        }
        
        if sender.isSelected {
            self.makeAndFireTimer()
        } else {
            self.invalidateTimer()
        }
        
    }
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        self.updateTimeLabelText(time: TimeInterval(sender.value))
        if sender.isTracking {return}
        self.player.currentTime = TimeInterval(sender.value)
    }
}

