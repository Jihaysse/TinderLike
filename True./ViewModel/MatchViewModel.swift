//
//  MatchViewModel.swift
//  True.
//
//  Created by Julien Segers on 01/08/2020.
//  Copyright © 2020 Julien Segers. All rights reserved.
//

import UIKit

struct MatchViewModel {
    
    private let currentUser: User
    let matchedUser: User
    
    let matchLabelText: String
    
    var currentUserImageURL: URL?
    var matchedUserImageURL: URL?
    
    
    init(currentUser: User, matchedUser: User) {
        self.currentUser = currentUser
        self.matchedUser = matchedUser
        
        matchLabelText = "You and \(matchedUser.name) have liked each other!"
        
        guard let imageUrlString = currentUser.imageURLs.first else { return }
        guard let matchedImageUrlString = matchedUser.imageURLs.first else { return }
        currentUserImageURL = URL(string: imageUrlString)
        matchedUserImageURL = URL(string: matchedImageUrlString)
    }
}
