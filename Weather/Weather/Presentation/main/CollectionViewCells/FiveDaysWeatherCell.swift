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
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .init(name: Font.NotoSans.bold, size: 15)
        return label
    }()
    
    private let temperatureImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .trailing
        stackView.spacing = 5
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout()
        backgroundColor = .white
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("Init with coder is unavailable")
    }
    
    private func setupLabels() {
        let minimumLabel = UILabel()
        let maximumLabel = UILabel()
        let labelsInStackView = [minimumLabel, maximumLabel]
        
        labelsInStackView.forEach {
            $0.font = .init(name: Font.Roboto.regular, size: 15)
            stackView.addArrangedSubview($0)
        }
    }
    
    private func layout() {
        setupLabels()
        
        contentView.addSubview(stackView)
        contentView.addSubview(dateLabel)
        contentView.addSubview(temperatureImage)
        
        dateLabel.snp.makeConstraints {
            $0.leading.centerY.equalToSuperview()
        }
        
        temperatureImage.snp.makeConstraints {
            $0.width.height.equalTo(20)
            $0.centerX.centerY.equalToSuperview()
        }
        
        stackView.snp.makeConstraints {
            $0.trailing.centerY.equalToSuperview()
        }
    }
}
