//
//  AuthenticationViewModel.swift
//  True.
//
//  Created by Julien Segers on 18/07/2020.
//  Copyright © 2020 Julien Segers. All rights reserved.
//

import Foundation

protocol AuthenticationViewModel {
    var formIsValid: Bool { get }
}


struct LoginViewModel: AuthenticationViewModel {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false &&
            password?.isEmpty == false
    }
    
    
}



struct RegistrationViewModel: AuthenticationViewModel {
    var name: String?
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return name?.isEmpty == false &&
            email?.isEmpty == false &&
            password?.isEmpty == false
    }
}
