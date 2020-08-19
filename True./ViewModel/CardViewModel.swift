//
//  CardViewModel.swift
//  True.
//
//  Created by Julien Segers on 18/07/2020.
//  Copyright © 2020 Julien Segers. All rights reserved.
//

import UIKit

class CardViewModel {
    
    let user: User
    let imageURLs: [String]
    let userInfoText: NSAttributedString
    
    private var imageIndex = 0
    var index: Int  { return imageIndex }
    
    var imageUrl: URL?
    
    
    init(user: User) {
        self.user = user
        
        let attributedText = NSMutableAttributedString(string: user.name, attributes: [.font: UIFont.systemFont(ofSize: 32, weight: .heavy), .foregroundColor: UIColor.white])
        
        attributedText.append(NSAttributedString(string: "  \(user.age)", attributes: [.font: UIFont.systemFont(ofSize: 24, weight: .medium), .foregroundColor: UIColor.white]))
        
        self.userInfoText = attributedText
        
//        self.imageUrl = URL(string: user.profileImageUrl)
        self.imageURLs = user.imageURLs
        if let imgUrl = self.imageURLs.first {
            self.imageUrl = URL(string: imgUrl)
        }
    }
    
    
    func showNextPhoto() {
        guard imageIndex < imageURLs.count - 1 else { return }
        imageIndex += 1
        imageUrl = URL(string: imageURLs[imageIndex])
    }
    
    
    func showPreviousPhoto() {
        guard imageIndex >= 0 else { return }
        imageIndex -= 1
        imageUrl = URL(string: imageURLs[imageIndex])
    }
    
}
