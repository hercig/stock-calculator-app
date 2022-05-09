//
//  DatePickerInputView.swift
//  stock-calculator-app
//
//  Created by Filip Hercig on 08.05.2022..
//

import UIKit
import RxSwift

class DatePickerTextInputView: TextInputView {
    
    private let disposeBag = DisposeBag()
    private let datePicker = UIDatePicker()
    private let toolbar = UIToolbar()
    
    var date: Date?
    
    private lazy var doneButton: UIBarButtonItem = UIBarButtonItem(
        barButtonSystemItem: .done,
        target: nil,
        action: #selector(donePressed)
    )
    
    override init(placeholder: String) {
        super.init(placeholder: placeholder)
        
        setupDatePicker()
        observe()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDate(date: Date?) {
        self.date = date
        guard let date = date else {
            textInput.text = nil
            return
        }
        textInput.text = DateFormatter.displayDateFormatter.string(from: date)
    }
}

// MARK: - Private Methods

private extension DatePickerTextInputView {
    
    @objc private func donePressed() {
        textInput.text = DateFormatter.displayDateFormatter.string(from: datePicker.date)
        setDate(date: datePicker.date)
        endEditing(true)
    }
    
    private func setupDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.sizeToFit()
        datePicker.maximumDate = Date().dayBefore
        textInput.inputView = datePicker
        
        toolbar.sizeToFit()
        toolbar.setItems([doneButton], animated: true)
        doneButton.tintColor = .appBlack
        textInput.inputAccessoryView = toolbar
    }
    
    func observe() {
        datePicker.rx.date
            .skip(1)
            .subscribe(onNext: { [weak self] date in
                guard let self = self else { return }
                self.setDate(date: date)
            })
            .disposed(by: disposeBag)
    }
}

