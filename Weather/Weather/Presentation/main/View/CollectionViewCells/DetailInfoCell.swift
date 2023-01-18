//
//  DetailInfoCell.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/16.
//


import UIKit
import SnapKit

final class DetailInfoCell: UICollectionViewCell {
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
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    
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
        contentView.backgroundColor = .black
        contentView.alpha = 0.3
        
        imageView.contentMode = .scaleAspectFill
        titleLabel.textColor = .white
        titleLabel.font = .init(name: Font.NotoSans.regular, size: 14)
        descriptionLabel.textColor = .white
        descriptionLabel.font = .init(name: Font.Roboto.bold, size: 30)
    }
    
    private func layout() {
        setUpView()
        
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}

// MARK: Inject Cell Data
extension DetailInfoCell {
    func configureCell(with model: Current?) {
        guard let model = model else { return }
//        let titleArray = ["습도", "체감온도", "풍속", "기압"]
//        let descriptionArray: Any = [model.humidity, model.temp, model.windSpeed, model.pressure]
        
        imageView.image = UIImage(named: "temp")
        titleLabel.text = "\(model.pressure)"
        descriptionLabel.text = "\(model.humidity)"
    }
}
