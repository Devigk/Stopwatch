//
//  ViewController.swift
//  Stopwatch
//
//  Created by Devi Kurup on 13/01/2025.
//

import UIKit

class ViewController: UIViewController {
    //instance of stopwatch model
    let stopwatch = Stopwatch()
    
    @IBOutlet weak var elapsedTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func startButtonTapped(sender: UIButton) {
      // code to start the clock
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateElapsedTimeLabel), userInfo: nil, repeats: true)

        stopwatch.start()
    }

    @IBAction func stopButtonTapped(sender: UIButton) {
      // code to stop the clock
        stopwatch.stop()
    }
    @objc func updateElapsedTimeLabel(timer: Timer) {
        if stopwatch.getIsRunning() {
            elapsedTimeLabel.text = stopwatch.elapsedTimeAsString
      } else {
        timer.invalidate()
      }
    }

}

