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
    
    private let temperatureImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .init(name: Font.Roboto.regular, size: 13)
        return label
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .init(name: Font.Roboto.bold, size: 25)
        return label
    }()
    
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
        contentView.layer.cornerRadius = 20
        contentView.backgroundColor = .backGroundBlue
    }
    
    private func layout() {
        setUpView()
        
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(temperatureImage)
        stackView.addArrangedSubview(timeLabel)
        stackView.addArrangedSubview(temperatureLabel)
        
        temperatureImage.snp.makeConstraints {
            $0.width.height.equalTo(25)
        }
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
}
