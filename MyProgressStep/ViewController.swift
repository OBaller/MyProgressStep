//
//  ViewController.swift
//  MyProgressStep
//
//  Created by Naseem Oyebola on 05/04/2022.
//

import UIKit

class ViewController: UIViewController {
    var steps = [StepperData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        steps = createData()
        let stepper = StepperView(frame: self.view.frame, steps: steps)
        try? stepper.configureView(mode:
                . vertical)
        self.view.addSubview(stepper)
    }

    
}

