//
//  Debouncer.swift
//  SchoolVerse
//
//  Created by Steven Yu on 9/26/22.
//

import Foundation

// source: https://betterprogramming.pub/implement-a-debouncer-in-swift-3b5c775f90b8
public class Debouncer {
    
    private let timeInterval: TimeInterval
    private var timer: Timer?
    
    typealias Handler = () -> Void
    var handler: Handler?
    
    init(timeInterval: TimeInterval) {
        self.timeInterval = timeInterval
    }
    
    public func renewInterval() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: false, block: { [weak self] (timer) in
            self?.timeIntervalDidFinish(for: timer)
        })
    }
    
    @objc private func timeIntervalDidFinish(for timer: Timer) {
        guard timer.isValid else {
            return
        }
        
        handler?()
        handler = nil
    }
    
}
