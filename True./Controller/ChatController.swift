//
//  ChatController.swift
//  True.
//
//  Created by Julien Segers on 04/08/2020.
//  Copyright © 2020 Julien Segers. All rights reserved.
//

import UIKit

class ChatController: UICollectionViewController {
    
    //MARK: - Properties
    
    private let user: User
    
    private lazy var customInputView: CustomInputAccessoryView = {
        let iv = CustomInputAccessoryView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        return iv
    }()
    
    //MARK: - Lifecycle
    
    init(user: User) {
        self.user = user
        super.init(collectionViewLayout: UICollectionViewLayout())
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    
    override var inputAccessoryView: UIView? {
        get { return customInputView }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        collectionView.backgroundColor = .blue
    }
    
    
    
}
