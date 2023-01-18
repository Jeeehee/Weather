//
//  TodayWeatherCell.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/16.
//

import UIKit
import SnapKit
import Alamofire
import AlamofireImage

final class TodayWeatherCell: UICollectionViewCell {
    static var identifier: String {
        return "\(self)"
    }
    private let backGroundView = BackgroundView()
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()
    
    private let temperatureImage = UIImageView()
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
        temperatureImage.contentMode = .scaleAspectFill
        
        timeLabel.textColor = .white
        timeLabel.font = .init(name: Font.Roboto.regular, size: 13)
        
        temperatureLabel.textColor = .white
        temperatureLabel.font = .init(name: Font.Roboto.bold, size: 20)
    }
    
    private func layout() {
        setUpView()
        
        contentView.addSubview(backGroundView)
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(timeLabel)
        stackView.addArrangedSubview(temperatureImage)
        stackView.addArrangedSubview(temperatureLabel)
        
        backGroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        temperatureImage.snp.makeConstraints {
            $0.width.height.equalTo(35)
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
    func configureCell(with model: Hourly?, _ current: Current?) {
        guard let model = model else { return }
        guard let weatherInfo = current?.weather else { return }
        
        getIcon(with: weatherInfo.map { $0.icon }.joined())
        timeLabel.text = String.getHour(date: model.date)
        temperatureLabel.text = "\(String.fahrenheitTocelsius(fahrenheit: model.temp))°"
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
