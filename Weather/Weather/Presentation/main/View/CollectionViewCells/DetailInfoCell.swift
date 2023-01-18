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
    
    private let backGroundView = BackgroundView()
    
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
        imageView.contentMode = .center
        titleLabel.textColor = .white
        titleLabel.font = .init(name: Font.NotoSans.regular, size: 13)
        descriptionLabel.textColor = .white
        descriptionLabel.font = .init(name: Font.Roboto.bold, size: 23)
    }
    
    private func layout() {
        setUpView()
        
        contentView.addSubview(backGroundView)
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        
        imageView.snp.makeConstraints {
            $0.width.height.equalTo(25)
        }
        
        backGroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(15)
            $0.bottom.trailing.equalToSuperview().offset(-15)
        }
        
        stackView.setCustomSpacing(30, after: imageView)
    }
    
}

// MARK: Inject Cell Data
extension DetailInfoCell {
    func configureCell(with model: Any, image: UIImage?, title: String) {
        guard let image = image else { return }
        
        imageView.image = image
        titleLabel.text = title
        descriptionLabel.text = "\(model)"
    }
}
