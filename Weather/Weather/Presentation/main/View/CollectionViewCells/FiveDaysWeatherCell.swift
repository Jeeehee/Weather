//
//  FiveDaysWeatherCell.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/16.
//

import UIKit
import SnapKit

final class FiveDaysWeatherCell: UICollectionViewCell {
    static var identifier: String {
        return "\(self)"
    }
    
    private let dayLabel = UILabel()
    
    private let temperatureImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 15
        return stackView
    }()
    
    private let minimumLabel = UILabel()
    private let maximumLabel = UILabel()
    
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
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .white
        
//        dayLabel.textColor = .white
        dayLabel.font = .init(name: Font.NotoSans.bold, size: 15)
        
        let labelsInStackView = [minimumLabel, maximumLabel]
        labelsInStackView.forEach {
//            $0.textColor = .white
            $0.font = .init(name: Font.Roboto.bold, size: 15)
            stackView.addArrangedSubview($0)
        }
    }
    
    private func layout() {
        setUpView()
        
        contentView.addSubview(stackView)
        contentView.addSubview(dayLabel)
        contentView.addSubview(temperatureImage)
        
        dayLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.centerY.equalToSuperview()
        }
        
        temperatureImage.snp.makeConstraints {
            $0.width.height.equalTo(20)
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview().offset(-80)
        }
        
        stackView.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-20)
            $0.centerY.equalToSuperview()
        }
    }
}

// MARK: Inject Cell Data
extension FiveDaysWeatherCell {
    func configureCell(with model: Daily?) {
        guard let model = model else { return }
        
        dayLabel.text = String.getDay(date: model.date)
        temperatureImage.image = UIImage(named: "temp")
        minimumLabel.text = "최저  \(String.fahrenheitTocelsius(fahrenheit: model.temp.min))"
        maximumLabel.text = "최고  \(String.fahrenheitTocelsius(fahrenheit: model.temp.max))"
    }
}
