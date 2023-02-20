//
//  SearchTFView.swift
//  Weather
//
//  Created by Нахид Гаджалиев on 20.02.2023.
//

import UIKit

class SearchTFView: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        placeholder = "Search"
        borderStyle = .roundedRect
        textAlignment = .right
        font = .systemFont(ofSize: 25)
        backgroundColor = .clear
        textColor = UIColor(named: "AccentColor")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
