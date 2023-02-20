//
//  TemperatureStackView.swift
//  Weather
//
//  Created by Нахид Гаджалиев on 20.02.2023.
//

import UIKit

class TemperatureStackView: UIStackView {

    lazy var temperatureLabel = TemperatureStackLabelView(frame: .zero)
    lazy var metricLabelView = TemperatureStackLabelView(frame: .zero)
    lazy var metricLetterLabelView = TemperatureStackLabelView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addArrangedSubview(temperatureLabel)
        addArrangedSubview(metricLabelView)
        addArrangedSubview(metricLetterLabelView)
        axis = .horizontal
        spacing = 0
        addingText()
    }
    
    private func addingText() {
        temperatureLabel.text = "0"
        metricLabelView.text = "°"
        metricLetterLabelView.text = "C"
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

