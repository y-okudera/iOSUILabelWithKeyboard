//
//  ViewController.swift
//  iOSUILabelWithKeyboard
//
//  Created by YukiOkudera on 2019/01/22.
//  Copyright © 2019 Yuki Okudera. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var control: FirstResponderControl!
    @IBOutlet private weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Setup
extension ViewController {
    
    /// 初期処理
    private func setup() {
        setupFirstResponderControl()
    }
    
    /// FirstResponderControlの初期処理
    private func setupFirstResponderControl() {
        control.addTarget(control, action: #selector(becomeFirstResponder), for: .touchUpInside)
        let datePicker = UIDatePicker(frame: .zero)
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datePickerDidChangeValue), for: .valueChanged)
        control.inputView = datePicker
        
        let toolbar = UIToolbar(frame: .init(x: 0, y: 0, width: 0, height: 35))
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([flexibleSpace, doneItem], animated: true)
        control.inputAccessoryView = toolbar
        
        label.text = dateToString(date: datePicker.date)
    }
}

// MARK: - Selector
extension ViewController {
    @objc func datePickerDidChangeValue(sender: UIDatePicker) {
        label.text = dateToString(date: sender.date)
    }
    
    @objc func done() {
        self.view.resignFirstResponder()
    }
}

// MARK: - Others
extension ViewController {
    
    /// DateをStringに変換する
    private func dateToString(date: Date = Date()) -> String {
        let dateFormater = DateFormatter()
        let locale = Locale(identifier: "ja_JP")
        dateFormater.dateFormat = DateFormatter.dateFormat(
            fromTemplate: "ydMMMEEE",
            options: 0,
            locale: locale
        )
        return dateFormater.string(from: date)
    }
}
