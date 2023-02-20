//
//  WeatherViewController.swift
//  Weather
//
//  Created by Нахид Гаджалиев on 20.02.2023.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    lazy var backgroundImage = BackgroundImageView(frame: .zero)
    lazy var mainStackView = MainStackView(frame: .zero)
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewUpdate()
        setupConstraints()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() // запрос на геолокацию
        locationManager.requestLocation()
        
        mainStackView.topStack.searchTFView.delegate = self
        weatherManager.delegate = self
    }
    
}

// MARK: - ADDING ACTIONS
extension WeatherViewController {
    
    @objc private func searchPressed() {
        mainStackView.topStack.searchTFView.endEditing(true)
    }
    
    @objc private func locationPressed() {
        locationManager.requestLocation()
    }
}

// MARK: - ADDING METHODS
extension WeatherViewController {
    
    private func viewUpdate() {
        view.addSubview(backgroundImage)
        view.addSubview(mainStackView)
        
        mainStackView.topStack.searchButtonView.addTarget(self, action: #selector(searchPressed), for: .touchUpInside)
        mainStackView.topStack.locationButtonView.addTarget(self, action: #selector(locationPressed), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
        ])
    }
    
}

// MARK: - CLLocationManagerDelegate
extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(longitude: lon, latitude: lat)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}

//MARK: - WeatherManagerDelegate
extension WeatherViewController: WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)  {
        
        DispatchQueue.main.async { [weak self] in
            self?.mainStackView.temperatureStack.temperatureLabel.text = weather.temperatureString
            self?.mainStackView.conditionalImage.image = UIImage(systemName: weather.conditionName)
            self?.mainStackView.cityNameLabel.text = weather.cityName
        }
        
    }
    
    func didFailWithError(error: Error) {
        print(error.localizedDescription)
    }
    
}

//MARK: - UITextFieldDelegate
extension WeatherViewController: UITextFieldDelegate {
    
    // По нажатию кнопки снизу закрывает клавиатуру
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mainStackView.topStack.searchTFView.endEditing(true)
        return true
    }
    
    // Действия по закрытии клавиатуры
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let city = mainStackView.topStack.searchTFView.text else { return }
        weatherManager.fetchWeather(cityName: city)
    }
    
    // Проверка, нужно ли закрыть клавиатуру и действия в каждом случае
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if mainStackView.topStack.searchTFView.text != "" {
            return true
        } else {
            return false
        }
        
    }
    
}
