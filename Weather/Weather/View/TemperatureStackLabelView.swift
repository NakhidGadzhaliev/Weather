//
//  TemperatureStackLabelBiew.swift
//  Weather
//
//  Created by Нахид Гаджалиев on 20.02.2023.
//

import UIKit

class TemperatureStackLabelView: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        textAlignment = .right
        textColor = UIColor(named: "AccentColor")
        font = .systemFont(ofSize: 80, weight: .medium)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
