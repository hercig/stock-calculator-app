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
    
    private lazy var screenTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.appFont(with: 28, weight: .bold)
        label.text = "Favorite Stocks"
        
        return label
    }()

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
    
    private lazy var editFavoritesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Edit favorite stocks", for: .normal)
        
        return button
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.backgroundColor = .appBrown
        button.layer.cornerRadius = 8
        button.tintColor = .appBlack
        
        return button
    }()
    
    private lazy var settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "line.3.horizontal.decrease"), for: .normal)
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

private extension HomeContentView {
    
    func addSubviews() {
        addSubview(searchButton)
        addSubview(settingsButton)
        addSubview(screenTitleLabel)
        addSubview(vStack)
        vStack.addArrangedSubview(firstRowStackView)
        vStack.addArrangedSubview(secondRowStackView)
        firstRowStackView.addArrangedSubview(firstFavouriteStockButton)
        firstRowStackView.addArrangedSubview(secondFavouriteStockButton)
        secondRowStackView.addArrangedSubview(thirdFavouriteStockButton)
        secondRowStackView.addArrangedSubview(fourthFavouriteStockButton)
        addSubview(editFavoritesButton)
    }

    func setConstraints() {
        searchButton.snp.remakeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).inset(16)
            make.trailing.equalToSuperview().inset(16)
            make.width.height.equalTo(40)
        }
        
        settingsButton.snp.remakeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).inset(16)
            make.leading.equalToSuperview().inset(16)
            make.width.height.equalTo(40)
        }
        
        vStack.snp.remakeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
        
        screenTitleLabel.snp.remakeConstraints { make in
            make.bottom.equalTo(vStack.snp.top).offset(-16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        editFavoritesButton.snp.remakeConstraints { make in
            make.top.equalTo(vStack.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
    }
}
