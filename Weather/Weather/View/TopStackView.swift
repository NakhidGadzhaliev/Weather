//
//  TopStackView.swift
//  Weather
//
//  Created by Нахид Гаджалиев on 20.02.2023.
//

import UIKit

class TopStackView: UIStackView {
    
    lazy var locationButtonView = TopButtonView(frame: .zero)
    lazy var searchButtonView = TopButtonView(frame: .zero)
    lazy var searchTFView = SearchTFView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .horizontal
        spacing = 10
        addArrangedSubview(locationButtonView)
        addArrangedSubview(searchTFView)
        addArrangedSubview(searchButtonView)
        addingTitleImage()
    }
    
    private func addingTitleImage() {
        locationButtonView.setBackgroundImage(UIImage(systemName: "location.circle.fill"), for: .normal)
        searchButtonView.setBackgroundImage(UIImage(systemName: "magnifyingglass"), for: .normal)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
