//
//  DetailsViewController.swift
//  stock-calculator-app
//
//  Created by Filip Hercig on 01.05.2022..
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class DetailsViewController: UIViewController {
    
    private let viewModel: DetailsViewModeling
    private let disposeBag = DisposeBag()
    
    private lazy var contentView = DetailsContentView()
    
    init(viewModel: DetailsViewModeling) {
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
}


// MARK: UI Setup

private extension DetailsViewController {
    
    func setupUI() {
        view.backgroundColor = .white
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
            .backButton
            .rx.tap
            .subscribe(onNext: { [weak self] in
                self?.viewModel.onBackButtonTap()
            })
            .disposed(by: disposeBag)
    }
}
