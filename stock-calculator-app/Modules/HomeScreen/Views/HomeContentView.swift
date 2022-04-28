//
//  HomeContentView.swift
//  stock-calculator-app
//
//  Created by Filip Hercig on 28.04.2022..
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

// MARK: - HomeContentView

class HomeContentView: UIView {

    lazy var firstFavouriteStockButton: FavoriteStockButton = {
        let button = FavoriteStockButton()
        button.updateUI(with: FavoriteStockButtonViewModel(
            stockName: "Apple",
            stockSymbol: "AAPL",
            backgroundColor: .appBrown
        ))
        
        return button
    }()
    
    lazy var secondFavouriteStockButton: FavoriteStockButton = {
        let button = FavoriteStockButton()
        button.updateUI(with: FavoriteStockButtonViewModel(
            stockName: "Amazon",
            stockSymbol: "AMZN",
            backgroundColor: .appRed
        ))
        
        return button
    }()
    
    lazy var thirdFavouriteStockButton: FavoriteStockButton = {
        let button = FavoriteStockButton()
        button.updateUI(with: FavoriteStockButtonViewModel(
            stockName: "Tesla",
            stockSymbol: "TSLA",
            backgroundColor: .appPurple
        ))
        
        return button
    }()
    
    lazy var fourthFavouriteStockButton: FavoriteStockButton = {
        let button = FavoriteStockButton()
        button.updateUI(with: FavoriteStockButtonViewModel(
            stockName: "Google",
            stockSymbol: "GOOG",
            backgroundColor: .appGreen
        ))
        
        return button
    }()
    
    private lazy var vStack: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.axis = .vertical
        
        return stackView
    }()
    
    private lazy var firstRowStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    private lazy var secondRowStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.axis = .horizontal
        
        return stackView
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

private extension HomeContentView {
    
    func addSubviews() {
        addSubview(vStack)
        vStack.addArrangedSubview(firstRowStackView)
        vStack.addArrangedSubview(secondRowStackView)
        firstRowStackView.addArrangedSubview(firstFavouriteStockButton)
        firstRowStackView.addArrangedSubview(secondFavouriteStockButton)
        secondRowStackView.addArrangedSubview(thirdFavouriteStockButton)
        secondRowStackView.addArrangedSubview(fourthFavouriteStockButton)
    }

    func setConstraints() {
        vStack.snp.remakeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
    }
}
