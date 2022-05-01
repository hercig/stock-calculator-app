//
//  DetailsContentView.swift
//  stock-calculator-app
//
//  Created by Filip Hercig on 01.05.2022..
//

import UIKit
import SnapKit

// MARK: - DetailsContentView

class DetailsContentView: UIView {
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.backgroundColor = .appBrown
        button.layer.cornerRadius = 8
        button.tintColor = .appBlack
        
        return button
    }()

    init() {
        super.init(frame: .zero)
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: UI Setup

private extension DetailsContentView {
    
    func addSubviews() {
        addSubview(backButton)
    }

    func setConstraints() {
        backButton.snp.remakeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).inset(16)
            make.leading.equalToSuperview().inset(16)
            make.width.height.equalTo(40)
        }
    }
}

