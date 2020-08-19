//
//  MessagesController.swift
//  True.
//
//  Created by Julien Segers on 02/08/2020.
//  Copyright © 2020 Julien Segers. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"

class MessagesController: UITableViewController {
    
    //MARK: - Properties
    
    private let user: User
    
    private let headerView = MessageHeader()
    
    private var messages = [Message]()
    //MARK: - Lifecycle
    
    init(user: User) {
        self.user = user
        super.init(style: .plain)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        configureTableView()
        configureNavigationBar()
        fetchMatches()
    }
    
    //MARK: - Actions
    
    @objc func handleDismissal() {
            dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: - API
    
    func fetchMatches() {
        Service.fetchMatches { matches in
            self.headerView.matches = matches
        }
    }
    
    
    //MARK: - Helpers
    
    func presentConversationScreen() {
        let controller = ChatController(user: user)
//        let nav = UINavigationController(rootViewController: controller)
//        nav.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    func configureTableView() {
        tableView.rowHeight = 80
        tableView.tableFooterView = UIView()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        headerView.delegate = self
        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
        tableView.tableHeaderView = headerView
    }
    
    
    func configureNavigationBar() {
        let leftButton = UIImageView()
        leftButton.setDimensions(height: 32, width: 32)
        leftButton.isUserInteractionEnabled = true
        leftButton.image = #imageLiteral(resourceName: "app_icon").withRenderingMode(.alwaysTemplate)
        leftButton.tintColor = .lightGray
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleDismissal))
        leftButton.addGestureRecognizer(tap)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        
        let icon = UIImageView(image: #imageLiteral(resourceName: "top_messages_icon").withRenderingMode(.alwaysTemplate))
        icon.tintColor = .systemPink
        navigationItem.titleView = icon
    }
    
    
}


//MARK: - Extension - UITableViewDataSource

extension MessagesController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        return cell
    }
    
}


//MARK: - Extension - UITableViewDelegate

extension MessagesController {
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.9826375842, green: 0.3476698399, blue: 0.447683692, alpha: 1)
        label.text = "Messages"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        view.addSubview(label)
        label.centerY(inView: view, leftAnchor: view.leftAnchor, paddingLeft: 12)
        
        return view
    }
}


//MARK: - Extension - MessageHeaderDelegate

extension MessagesController: MessageHeaderDelegate {
    func messageHeader(_ header: MessageHeader, wantsToStartChatWith uid: String) {
        Service.fetchUser(withUid: uid) { user in
            print("DEBUG: Start chat with \(user.name)")
            self.presentConversationScreen()
        }
    }
}
