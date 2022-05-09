//
//  DetailsContentView.swift
//  stock-calculator-app
//
//  Created by Filip Hercig on 01.05.2022..
//

import UIKit
import SnapKit
import RxSwift
import RxKeyboard

// MARK: - DetailsContentView

class DetailsContentView: UIView {
    
    private let disposeBag = DisposeBag()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.backgroundColor = .appBrown
        button.layer.cornerRadius = 8
        button.tintColor = .appBlack
        
        return button
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.keyboardDismissMode = .onDrag
        
        return scrollView
    }()
    
    private lazy var contentView = UIView()
    
    private lazy var symbolTextField: TextInputView = {
        let textField = TextInputView(placeholder: "Text")
        
        return textField
    }()
    
    private lazy var datePickerTextInputView: DatePickerTextInputView = {
        let textInputView = DatePickerTextInputView(placeholder: "Choose first ddate")
        textInputView.isDisabled = true
        
        return textInputView
    }()

    init() {
        super.init(frame: .zero)
        addSubviews()
        setConstraints()
        observe()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: UI Setup

private extension DetailsContentView {
    
    func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(symbolTextField)
        contentView.addSubview(datePickerTextInputView)
        addSubview(backButton)
    }

    func setConstraints() {
        backButton.snp.remakeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).inset(16)
            make.leading.equalToSuperview().inset(16)
            make.width.height.equalTo(40)
        }
        
        scrollView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.height)
            make.width.equalTo(UIScreen.main.bounds.width)
        }
        
        symbolTextField.snp.remakeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        datePickerTextInputView.snp.remakeConstraints { make in
            make.top.equalTo(symbolTextField.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    func observe() {
        RxKeyboard
            .instance
            .visibleHeight
            .drive(onNext: { [weak self] keyboardHeight in
                    guard let self = self else { return }
                    if keyboardHeight > 0 {
                        UIView.animate(withDuration: 0.2) {
                            self.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight + 30, right: 0)
                        }
                    } else {
                        self.scrollView.contentInset = UIEdgeInsets.zero
                    }
            })
            .disposed(by: disposeBag)
    }
}

