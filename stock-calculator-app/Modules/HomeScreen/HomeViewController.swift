//
//  HomeViewController.swift
//  stock-calculator-app
//
//  Created by Filip Hercig on 27.04.2022..
//

import UIKit
import SnapKit

// MARK: HomeViewController

class HomeViewController: UIViewController {
    
    private let viewModel: HomeViewModeling
    
    private lazy var testLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome!"
        label.textAlignment = .center

        return label
    }()
    
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
    }
}

// MARK: SetupUI

private extension HomeViewController {
    
    func setupUI() {
        view.backgroundColor = .white
    }
    
    func addSubviews() {
        view.addSubview(testLabel)
    }

    func setConstraints() {
        testLabel.snp.remakeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
