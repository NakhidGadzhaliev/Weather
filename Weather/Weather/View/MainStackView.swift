//
//  MainStackView.swift
//  Weather
//
//  Created by Нахид Гаджалиев on 20.02.2023.
//

import UIKit

class MainStackView: UIStackView {
    
    lazy var topStack = TopStackView(frame: .zero)
    lazy var conditionalImage = ConditionalImageView(frame: .zero)
    lazy var temperatureStack = TemperatureStackView(frame: .zero)
    lazy var cityNameLabel = CityNameLabelView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addArrangedSubview(topStack)
        addArrangedSubview(conditionalImage)
        addArrangedSubview(temperatureStack)
        addArrangedSubview(cityNameLabel)
        addArrangedSubview(EmptyView(frame: .zero))
        distribution = .fill
        axis = .vertical
        spacing = 10
        alignment = .trailing
        translatesAutoresizingMaskIntoConstraints = false
        setConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            topStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            topStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
}

