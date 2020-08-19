//
//  CustomInputAccessoryView.swift
//  True.
//
//  Created by Julien Segers on 05/08/2020.
//  Copyright © 2020 Julien Segers. All rights reserved.
//

import UIKit

class CustomInputAccessoryView: UIView {
    
    //MARK: - Properties
    
    private let messageInputTextView: UITextView = {
        let tv = UITextView()
        tv.font = UIFont.systemFont(ofSize: 16)
        tv.isScrollEnabled = false
        return tv
    }()
    
    private let sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Send", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.systemRed, for: .normal)
        return button
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        
        autoresizingMask = .flexibleHeight
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override var intrinsicContentSize: CGSize {
        return .zero
    }
    
    
}
