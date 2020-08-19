//
//  Match.swift
//  True.
//
//  Created by Julien Segers on 03/08/2020.
//  Copyright © 2020 Julien Segers. All rights reserved.
//

import Foundation

struct Match {
    let name: String
    let profileImageUrl: String
    let uid: String
    
    init(dictionary: [String: Any]) {
        self.name = dictionary["name"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
    }
}
