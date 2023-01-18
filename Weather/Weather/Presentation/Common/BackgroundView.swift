//
//  BackgroundView.swift
//  Weather
//
//  Created by Jihee hwang on 2023/01/18.
//

import UIKit

final class BackgroundView: UIView {
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .white
        alpha = 0.12
        layer.masksToBounds = true
        layer.cornerRadius = 10
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("Init with coder is unavailable")
    }

}
