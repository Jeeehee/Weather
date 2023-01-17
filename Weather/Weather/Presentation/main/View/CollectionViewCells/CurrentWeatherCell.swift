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
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.spacing = 7
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
        cityLabel.font = .init(name: Font.Roboto.regular, size: 18)
        
        temperatureLabel.textColor = .white
        temperatureLabel.font = .init(name: Font.Roboto.regular, size: 70)
        
        let labelsInStackView = [weatherStateLabel, minimumLabel, maximumLabel]
        labelsInStackView.forEach {
            $0.textColor = .white
            $0.font = .init(name: Font.NotoSans.regular, size: 15)
        }
    }
    
    private func layout() {
        setupLabels()
        
        contentView.addSubview(cityLabel)
        contentView.addSubview(stackView)
        contentView.addSubview(temperatureLabel)
        
        stackView.addArrangedSubview(weatherStateLabel)
        stackView.addArrangedSubview(minimumLabel)
        stackView.addArrangedSubview(maximumLabel)
        
        cityLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(cityLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview()
        }
        
        temperatureLabel.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
        }
    }
}
    
