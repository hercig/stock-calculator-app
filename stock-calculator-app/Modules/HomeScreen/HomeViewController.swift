//
//  HomeViewController.swift
//  stock-calculator-app
//
//  Created by Filip Hercig on 27.04.2022..
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

// MARK: HomeViewController

class HomeViewController: UIViewController {
    
    private let viewModel: HomeViewModeling
    private let disposeBag = DisposeBag()
    
    private lazy var contentView = HomeContentView()
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addSubviews()
        setConstraints()
        observe()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
}

// MARK: UI Setup

private extension HomeViewController {
    
    func setupUI() {
        view.backgroundColor = .white
        navigationItem.backButtonTitle = ""
    }
    
    func addSubviews() {
        view.addSubview(contentView)
    }

    func setConstraints() {
        contentView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func observe() {
        contentView
            .firstFavouriteStockButton
            .rx.tap
            .subscribe(onNext: { [weak self] in
                guard let viewModel = self?.contentView.firstFavouriteStockButton.viewModel else { return }
                self?.viewModel.onFavoriteButtonTap(with: viewModel)
            })
            .disposed(by: disposeBag)
        
        contentView
            .secondFavouriteStockButton
            .rx.tap
            .subscribe(onNext: { [weak self] in
                guard let viewModel = self?.contentView.secondFavouriteStockButton.viewModel else { return }
                self?.viewModel.onFavoriteButtonTap(with: viewModel)
            })
            .disposed(by: disposeBag)
        
        contentView
            .thirdFavouriteStockButton
            .rx.tap
            .subscribe(onNext: { [weak self] in
                guard let viewModel = self?.contentView.thirdFavouriteStockButton.viewModel else { return }
                self?.viewModel.onFavoriteButtonTap(with: viewModel)
            })
            .disposed(by: disposeBag)
        
        contentView
            .fourthFavouriteStockButton
            .rx.tap
            .subscribe(onNext: { [weak self] in
                guard let viewModel = self?.contentView.fourthFavouriteStockButton.viewModel else { return }
                self?.viewModel.onFavoriteButtonTap(with: viewModel)
            })
            .disposed(by: disposeBag)
    }
}
