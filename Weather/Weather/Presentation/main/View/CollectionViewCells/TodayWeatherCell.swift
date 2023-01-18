//
//  TodayWeatherCell.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/16.
//

import UIKit
import SnapKit

final class TodayWeatherCell: UICollectionViewCell {
    static var identifier: String {
        return "\(self)"
    }
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()
    
    private let temperatureImage = UIImageView ()
    private let timeLabel = UILabel()
    private let temperatureLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("Init with coder is unavailable")
    }
    
    private func setUpView() {
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 35
        contentView.backgroundColor = .backGroundBlue
        
        temperatureImage.contentMode = .scaleAspectFill
        timeLabel.font = .init(name: Font.Roboto.regular, size: 14)
        temperatureLabel.font = .init(name: Font.Roboto.bold, size: 23)
    }
    
    private func layout() {
        setUpView()
        
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(timeLabel)
        stackView.addArrangedSubview(temperatureImage)
        stackView.addArrangedSubview(temperatureLabel)
        
        temperatureImage.snp.makeConstraints {
            $0.width.height.equalTo(25)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.bottom.equalToSuperview().offset(-15)
            $0.centerX.centerY.equalToSuperview()
        }
    }
}

// MARK: Inject Cell Data
extension TodayWeatherCell {
    func configureCell(with model: Hourly?) {
        guard let model = model else { return }
        
        temperatureImage.image = UIImage(named: "temp")
        timeLabel.text = String.getHour(date: model.date)
        temperatureLabel.text = String.fahrenheitTocelsius(fahrenheit: model.temp)
    }
}
