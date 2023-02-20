//
//  CityNameLabelView.swift
//  Weather
//
//  Created by Нахид Гаджалиев on 20.02.2023.
//

import UIKit

class CityNameLabelView: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        textAlignment = .right
        textColor = UIColor(named: "AccentColor")
        font = .systemFont(ofSize: 30, weight: .medium)
        text = "In progres..."
        numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

