//
//  Debouncer.swift
//  Tubi TV Blake Challenge
//
//  Created by Blake Barrett on 2/26/19.
//  Copyright © 2019 Blake Barrett. All rights reserved.
//  Props to: https://bradfol.com/how-can-i-debounce-a-method-call-in-swift-4/
//  for giving me a place to riff from.
//

import Foundation

typealias Callback = ()-> Void

protocol Debouncable {
    func renew(_ callback: @escaping Callback)
}

class Debouncer: Debouncable {
    
    private var interval: TimeInterval
    private var timer: Timer?
    private var callback: (()->Void)?
    
    init(_ interval:TimeInterval = 0.5) {
        self.interval = interval
    }
    
    func renew(_ callback: @escaping Callback) {
        self.callback = callback
        self.timer?.invalidate()
        self.timer = Timer.scheduledTimer(timeInterval: self.interval,
                                          target: self,
                                          selector: #selector(Debouncer.handleTimer),
                                          userInfo: nil,
                                          repeats: false)
    }
    
    @objc func handleTimer() {
        if self.timer?.isValid ?? false {
            DispatchQueue.main.async {
                self.callback?()
            }
        }
    }
}
