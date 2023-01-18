//
//  FiveDaysWeatherCell.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/16.
//

import UIKit
import SnapKit
import Alamofire
import AlamofireImage

final class FiveDaysWeatherCell: UICollectionViewCell {
    static var identifier: String {
        return "\(self)"
    }
    
    private let backGroundView = BackgroundView()
    private let dayLabel = UILabel()
    private let temperatureImage = UIImageView()
    
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
        temperatureImage.contentMode = .scaleAspectFill
        
        dayLabel.textColor = .white
        dayLabel.font = .init(name: Font.NotoSans.bold, size: 15)
        
        let labelsInStackView = [minimumLabel, maximumLabel]
        labelsInStackView.forEach {
            $0.textColor = .white
            $0.font = .init(name: Font.Roboto.bold, size: 15)
            stackView.addArrangedSubview($0)
        }
    }
    
    private func layout() {
        setUpView()
        
        contentView.addSubview(backGroundView)
        contentView.addSubview(stackView)
        contentView.addSubview(dayLabel)
        contentView.addSubview(temperatureImage)
        
        backGroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        dayLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.centerY.equalToSuperview()
        }
        
        temperatureImage.snp.makeConstraints {
            $0.width.height.equalTo(30)
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview().offset(-90)
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
        
        getIcon(with: model.weather.map { $0.icon }.joined())
        
        dayLabel.text = String.getDay(date: model.date)
        minimumLabel.text = "최저  \(String.fahrenheitTocelsius(fahrenheit: model.temp.min))°"
        maximumLabel.text = "최고  \(String.fahrenheitTocelsius(fahrenheit: model.temp.max))°"
    }
    
    private func getIcon(with icon: String) {
        guard let url = URL(string: "https://openweathermap.org/img/wn/\(icon)@2x.png") else { return }
        
        AF.request(url)
            .responseImage { response in
                guard let data = response.data else { return }
                self.temperatureImage.image = UIImage(data: data, scale: 1)
            }
    }
}
