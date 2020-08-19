//
//  SettingsViewModel.swift
//  True.
//
//  Created by Julien Segers on 22/07/2020.
//  Copyright © 2020 Julien Segers. All rights reserved.
//

import Foundation

enum SettingsSection: Int, CaseIterable {
    case name
    case profession
    case age
    case bio
    case ageRange
    
    var description: String {
        switch self {
            case .name: return "Name"
            case .profession: return "Profession"
            case .age: return "Age"
            case .bio: return "Bio"
            case .ageRange: return "Seeking Age Range"
        }
    }
}



struct SettingsViewModel {
    
    private let user: User
    let section: SettingsSection
    
    let placeholderText: String
    var value: String?
    
    var shouldHideInputField: Bool {
        return section == .ageRange
    }
    
    var shouldHideSlider: Bool {
        return section != .ageRange
    }
    
    var minAgeSliderValue: Float {
        return Float(user.minSeekingAge)
    }
    
    var maxAgeSliderValue: Float {
        return Float(user.maxSeekingAge)
    }
    
    
    func minAgeLabelText(forValue value: Float) -> String {
        return "Min: \(Int(value))"
    }
    
    
    func maxAgeLabelText(forValue value: Float) -> String {
        return "Max: \(Int(value))"
    }
    
    
    
    init(user: User, section: SettingsSection) {
        self.user = user
        self.section = section
        self.placeholderText = "Enter \(section.description.lowercased())"
        
        switch section {
        case .name:
            value = user.name
        case .profession:
            value = user.profession
        case .age:
            value = "\(user.age)"
        case .bio:
            value = user.bio
        case .ageRange:
            break
        }
        
    }
    
    
    
}
