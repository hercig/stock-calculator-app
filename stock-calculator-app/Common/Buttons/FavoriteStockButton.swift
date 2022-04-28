//
//  FavoriteStockButton.swift
//  stock-calculator-app
//
//  Created by Filip Hercig on 28.04.2022..
//

import UIKit
import SnapKit

// MARK: - FavoriteStockButtonViewModel

class FavoriteStockButtonViewModel {
    
    let stockName: String
    let stockSymbol: String
    let backgroundColor: UIColor
    
    init(stockName: String, stockSymbol: String, backgroundColor: UIColor) {
        self.stockName = stockName
        self.stockSymbol = stockSymbol
        self.backgroundColor = backgroundColor
    }
}

// MARK: - FavoriteStockButton

class FavoriteStockButton: UIControl {
    
    private lazy var containterView: UIView = {
        let view = UIView()
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowRadius = 4
        view.layer.cornerRadius = 8
        
        return view
    }()
    
    private lazy var buttonTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.appFont(with: 22, weight: .semibold)
        
        return label
    }()
    
    private lazy var buttonSubtitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.appFont(with: 18)
        
        return label
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

// MARK: - UI Setup

private extension FavoriteStockButton {
    
    func addSubviews() {
        addSubview(containterView)
        containterView.addSubview(buttonTitleLabel)
        containterView.addSubview(buttonSubtitleLabel)
    }
    
    func setConstraints() {
        containterView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        buttonTitleLabel.snp.remakeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.trailing.equalToSuperview().inset(4)
        }
        
        buttonSubtitleLabel.snp.remakeConstraints { make in
            make.top.equalTo(buttonTitleLabel.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(4)
            make.bottom.equalToSuperview().offset(-8)
        }
    }
}

// MARK: - Public Methods

extension FavoriteStockButton {
    
    func updateUI(with viewModel: FavoriteStockButtonViewModel) {
        containterView.backgroundColor = viewModel.backgroundColor
        buttonTitleLabel.text = viewModel.stockName
        buttonSubtitleLabel.text = viewModel.stockSymbol
    }
}
