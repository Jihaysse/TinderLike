//
//  MessageHeader.swift
//  True.
//
//  Created by Julien Segers on 02/08/2020.
//  Copyright © 2020 Julien Segers. All rights reserved.
//

import UIKit

private let cellIdentifier = "MatchCell"


protocol MessageHeaderDelegate: class {
    func messageHeader(_ header: MessageHeader, wantsToStartChatWith uid: String)
}



class MessageHeader: UICollectionReusableView {
    
    var matches = [Match]() {
        didSet { collectionView.reloadData() }
    }
    
    weak var delegate: MessageHeaderDelegate?
    
    private let newMatchesLabel: UILabel = {
        let label = UILabel()
        label.text = "New Matches"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = #colorLiteral(red: 0.9826375842, green: 0.3476698399, blue: 0.447683692, alpha: 1)
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        cv.register(MatchCell.self, forCellWithReuseIdentifier: cellIdentifier)
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
//        if matches.count > 0 {
            addSubview(newMatchesLabel)
            newMatchesLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 12)
            
            addSubview(collectionView)
            collectionView.anchor(top: newMatchesLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor,
                                  paddingTop: 4, paddingLeft: 12, paddingBottom: 24, paddingRight: 12)
//        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


//MARK: - Extension - UICollectionViewDataSource

extension MessageHeader: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return matches.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! MatchCell
        cell.viewModel = MatchCellViewModel(match: matches[indexPath.row])
        return cell
    }
    
}


//MARK: - Extension - UICollectionViewDelegate

extension MessageHeader: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let uid = matches[indexPath.row].uid
        delegate?.messageHeader(self, wantsToStartChatWith: uid)
    }
}


//MARK: - Extension - UICollectionViewDelegateFlowLayout

extension MessageHeader: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 110)
    }
}
