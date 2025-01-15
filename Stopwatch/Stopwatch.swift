//
//  Stopwatch.swift
//  Stopwatch
//

import Foundation

class Stopwatch {
  
    
//Fields
    private var startTime: NSDate?
    
//Calculate elapsed time
    var elapsedTime: TimeInterval {
            if let startTime = self.startTime {
                return -1 * startTime.timeIntervalSinceNow
                // could also just say -startTime.timeIntervalSinceNow

            } else {
                    return 0
                  }
            }
    
    private var isRunning: Bool{
        startTime != nil
    }

//Methods
    
  func start() {
      startTime = NSDate()

  }

  func stop() {
      startTime = nil

  }


  
//Getters
    
var elapsedTimeAsString: String {
    let elapsed = elapsedTime
    let seconds = Int(elapsed) % 60
    let minutes = (Int(elapsed) / 60) % 60
    let decaseconds = (Int(elapsed * 10) % 10)
    
            
            return String(format: "%02d:%02d:%01d", minutes, seconds, decaseconds)
        }
   
    
func getIsRunning() -> Bool {
        return isRunning
    }
   
}


