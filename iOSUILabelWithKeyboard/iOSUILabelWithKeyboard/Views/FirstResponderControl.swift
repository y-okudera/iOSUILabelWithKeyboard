//
//  FirstResponderControl.swift
//  iOSUILabelWithKeyboard
//
//  Created by YukiOkudera on 2019/01/22.
//  Copyright © 2019 Yuki Okudera. All rights reserved.
//

import UIKit

final class FirstResponderControl: UIControl, UITextInputTraits {
    
    private var _inputView: UIView?
    override var inputView: UIView? {
        get {
            return _inputView
        }
        set {
            _inputView = newValue
        }
    }
    
    private var _inputAccessoryView: UIView?
    override var inputAccessoryView: UIView? {
        get {
            return _inputAccessoryView
        }
        set {
            _inputAccessoryView = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addTarget(self, action: #selector(becomeFirstResponder), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addTarget(self, action: #selector(becomeFirstResponder), for: .touchUpInside)
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
}
