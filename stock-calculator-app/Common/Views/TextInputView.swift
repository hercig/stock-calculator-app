//
//  TextInputView.swift
//  stock-calculator-app
//
//  Created by Filip Hercig on 01.05.2022..
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift

class TextInputView: UIView {
    
    private lazy var containterView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .appBrown
        view.layer.cornerRadius = 8
        
        return view
    }()
    
    lazy var textInput: UITextField = {
        let input = UITextField()
        input.font = UIFont.appFont(with: 16)
        input.delegate = self
        
        return input
    }()
    
    init(placeholder: String) {
        super.init(frame: .zero)
        textInput.placeholder = placeholder
        
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Methods

private extension TextInputView {
    
    func addSubviews() {
        addSubview(containterView)
        containterView.addSubview(textInput)
    }
    
    func setConstraints() {
        containterView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        textInput.snp.remakeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
    }
}

// MARK: - Public Access

extension TextInputView {
    
    var isDisabled: Bool {
        get {
            return textInput.isUserInteractionEnabled
        }
        set {
            textInput.isUserInteractionEnabled = newValue
            if newValue {
                textInput.layer.opacity = 0.5
                textInput.isUserInteractionEnabled = false
            } else {
                textInput.layer.opacity = 1
                textInput.isUserInteractionEnabled = true
            }
        }
    }
}

// MARK: - UITextFieldDelegate

extension TextInputView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textInput.font = UIFont.appFont(with: 16, weight: .bold)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textInput.font = UIFont.appFont(with: 16, weight: .regular)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textInput.endEditing(true)
        return false
    }
}
