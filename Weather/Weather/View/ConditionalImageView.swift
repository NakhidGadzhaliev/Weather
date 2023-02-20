//
//  ConditionalImageView.swift
//  Weather
//
//  Created by Нахид Гаджалиев on 20.02.2023.
//

import UIKit

class ConditionalImageView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        image = UIImage(systemName: "sun.max")
        contentMode = .scaleAspectFit
        tintColor = UIColor(named: "AccentColor")
        translatesAutoresizingMaskIntoConstraints = false
        setSize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setSize() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 120),
            widthAnchor.constraint(equalToConstant: 120),
        ])
    }
    
}
