//
//  CurrentWeatherCell.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/16.
//

import UIKit
import SnapKit

final class CurrentWeatherCell: UICollectionViewCell {
    static var identifier: String {
        return "\(self)"
    }

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 7
        return stackView
    }()
    
    private let temperatureStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.spacing = 10
        return stackView
    }()
    
    private let cityLabel = UILabel()
    private let weatherStateLabel = UILabel()
    private let minimumLabel = UILabel()
    private let maximumLabel = UILabel()
    private let temperatureLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("Init with coder is unavailable")
    }
    
    private func setupLabels() {
        cityLabel.textColor = .white
        cityLabel.font = .init(name: Font.NotoSans.bold, size: 25)
        
        temperatureLabel.textColor = .white
        temperatureLabel.font = .init(name: Font.Roboto.bold, size: 65)
        
        let labelsInStackView = [weatherStateLabel, minimumLabel, maximumLabel]
        labelsInStackView.forEach {
            $0.textColor = .white
            $0.font = .init(name: Font.Roboto.regular, size: 16)
            temperatureStackView.addArrangedSubview($0)
        }
    }
    
    private func layout() {
        setupLabels()
        
        contentView.addSubview(stackView)
        contentView.addSubview(temperatureLabel)
        
        stackView.addArrangedSubview(cityLabel)
        stackView.addArrangedSubview(temperatureStackView)
        
        stackView.snp.makeConstraints {
            $0.centerY.leading.equalToSuperview()
        }
        
        temperatureLabel.snp.makeConstraints {
            $0.centerY.trailing.equalToSuperview()
        }
    }
}
    
// MARK: Inject Cell Data
extension CurrentWeatherCell {
    func configureCell(with model: Current?, and: Daily?) {
        guard let model = model else { return }
        guard let daily = and else { return }
    
        cityLabel.text = "아산"
        temperatureLabel.text = "\(String.fahrenheitTocelsius(fahrenheit: model.temp))°"
        minimumLabel.text = "최저 \(String.fahrenheitTocelsius(fahrenheit: daily.temp.min))°"
        maximumLabel.text = "최고 \(String.fahrenheitTocelsius(fahrenheit: daily.temp.max))°"
        weatherStateLabel.text = model.weather.map { $0.main }.joined().uppercased()
    }
}
