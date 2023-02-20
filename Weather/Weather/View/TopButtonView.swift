//
//  TopButtonView.swift
//  Weather
//
//  Created by Нахид Гаджалиев on 20.02.2023.
//

import UIKit

class TopButtonView: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tintColor = UIColor(named: "AccentColor")
        translatesAutoresizingMaskIntoConstraints = false
        setSize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setSize() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 40),
            widthAnchor.constraint(equalToConstant: 40),
        ])
    }
    
}
