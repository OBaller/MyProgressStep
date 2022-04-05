//
//  StepperView.swift
//  MyProgressStep
//
//  Created by Naseem Oyebola on 05/04/2022.
//

import UIKit

class StepperItem: UIStackView {
    
    var dateLabel = UILabel()
    
    var statusLabel = UILabel()
    
    var statusImageView = UIImageView()
    
    var lastStepIndexId = 0
    
    convenience init(step: StepperData, frame: CGRect, lastStepIndexId: Int) {
        self.init(frame: frame)
        distribution = .equalCentering
        axis = .vertical
        self.lastStepIndexId = lastStepIndexId
        configure(step: step)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(step: StepperData) {
        
        let stackView   = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.horizontal
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        setDateLabel(step: step)
        setStepLabel(step: step)
        setStepImage(completed: step.stepComplete)
        
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(statusImageView)
        stackView.addArrangedSubview(statusLabel)
        self.addArrangedSubview(stackView)
        
        if step.stepId != lastStepIndexId {
            self.addArrangedSubview(addStepSeparator())
        }
        
        self.alignment = UIStackView.Alignment.center
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func setDateLabel(step: StepperData) {
        dateLabel.text = step.date
        dateLabel.textColor = .black
        dateLabel.numberOfLines = 1
        dateLabel.textAlignment = .center
        dateLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        
        dateLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        dateLabel.isEnabled = step.stepComplete
    }
    
    private func setStepLabel(step: StepperData) {
        statusLabel.text = step.status
        statusLabel.textColor = .black
        statusLabel.textAlignment = .center
        statusLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        statusLabel.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        statusLabel.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        statusLabel.isEnabled = step.stepComplete
    }
    
    private func addStepSeparator(color: UIColor = .systemGreen) -> UIView {
        let separator = UIView()
        separator.widthAnchor.constraint(equalToConstant: 2).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 100).isActive = true
        separator.backgroundColor = color
        return separator
    }
    
    private func setStepImage(completed: Bool) {
        statusImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        statusImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        statusImageView.tintColor = .systemGreen
        
        if completed {
            statusImageView.image = UIImage(systemName: "checkmark.circle.fill")
        } else {
            statusImageView.image = UIImage(systemName: "circle")
            statusImageView.alpha = 0.5
        }
    }
}
