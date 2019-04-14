//
//  PSTimerViewController.swift
//  PSUIKitUtils
//
//  Created by Philipp Schunker on 14.04.19.
//  Copyright © 2019 Philipp Schunker. All rights reserved.
//

import UIKit

open class PSTimerViewController: PSViewController {
    
    open var timer: Timer?
    open var timerInterval: TimeInterval?
    open var timerTolerance: TimeInterval?
    open var timerPauseDate: Date?
    open var timerPreviousFireDate: Date?

    override open func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.startTimer()
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.stopTimer()
    }
    
    override open func appDidEnterBackground(notification: Notification) {
        self.stopTimer()
    }
    
    override open func appWillEnterForeground(notification: Notification) {
        if self.isViewLoaded && self.view.window != nil {
            self.startTimer()
        }
    }
    
    // MARK: - Timer
    
    open func startTimer() -> Void {
        guard let interval = self.timerInterval else {
            return
        }
        
        if self.timer == nil {
            let timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(self.onTick(timer:)), userInfo: nil, repeats: true)
            RunLoop.current.add(timer, forMode: RunLoop.Mode.common)
            if case let tolerance? = self.timerTolerance {
                timer.tolerance = tolerance
            } else {
                timer.tolerance = 1.0
            }
            
            self.timer = timer
        }
    }
    
    open func stopTimer() -> Void {
        if case let ctimer? = self.timer {
            ctimer.invalidate()
            self.timer = nil
        }
    }
    
    open func pauseTimer() -> Void {
        if case let ctimer? = self.timer {
            self.timerPauseDate = Date.init()
            self.timerPreviousFireDate = ctimer.fireDate
            ctimer.fireDate = Date.distantFuture
        }
    }
    
    open func resumeTimer() -> Void {
        guard let pauseDate = self.timerPauseDate else {
            return
        }
        
        guard let previousFireDate = self.timerPreviousFireDate else {
            return
        }
        
        guard let timer = self.timer else {
            return
        }
        
        //if the date object is earlier than the current date and time, this property’s value is negative.
        let seconds: TimeInterval = pauseDate.timeIntervalSinceNow*(-1)
        //a negative value means the receiver will be earlier than refDate
        timer.fireDate = Date(timeInterval: seconds, since: previousFireDate)
    }
    
    @objc open func onTick(timer: Timer) -> Void {
        //for subclass overriding
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
