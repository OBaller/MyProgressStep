//
//  StepperView.swift
//  MyProgressStep
//
//  Created by Naseem Oyebola on 05/04/2022.
//

import UIKit

enum StepperMode {
    case vertical
    case horizontal
}

enum StepperViewError: Error {
    case invalidData
}

class StepperView: UIView {
    
    var steps: [StepperData] = []
    
    let stepContainer = UIStackView()
    
    let scrollView = UIScrollView()
    
    let scrollViewContainer = UIStackView()
    
    
    convenience init(frame: CGRect, steps: [StepperData]) {
        self.init(frame: frame)
        self.steps = steps
        try? configureView(mode: .vertical)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configureView(mode: StepperMode = .vertical) throws {
        
        guard steps.count > 0,
              let lastIndex = steps.last?.stepId else {
            throw StepperViewError.invalidData
        }
        
        stepContainer.frame = self.frame
        stepContainer.axis = mode == .vertical ? .vertical : .horizontal
        stepContainer.distribution = .fillProportionally
        
        self.addSubview(stepContainer)
        
        steps.forEach { step in
            let step = StepperItem(step: step, frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 60), lastStepIndexId: lastIndex)
            stepContainer.addArrangedSubview(step)
        }
        
        self.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.addArrangedSubview(stepContainer)
        
        configureScrollView()
    }
    
    private func configureScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        scrollView.showsVerticalScrollIndicator = false
        
        scrollViewContainer.axis = .vertical
        scrollViewContainer.spacing = 10
        scrollViewContainer.translatesAutoresizingMaskIntoConstraints = false
        scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
    
}
