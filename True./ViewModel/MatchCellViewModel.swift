//
//  MatchCellViewModel.swift
//  True.
//
//  Created by Julien Segers on 03/08/2020.
//  Copyright © 2020 Julien Segers. All rights reserved.
//

import UIKit

struct MatchCellViewModel {
    
    let nameLabel: String
    var profileImageUrl: URL?
    let uid: String
    
    init(match: Match) {
        nameLabel = match.name
        profileImageUrl = URL(string: match.profileImageUrl)
        uid = match.uid
    }
    
}
