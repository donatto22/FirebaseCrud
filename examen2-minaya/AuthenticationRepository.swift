//
//  AuthenticationRepository.swift
//  examen2-minaya
//
//  Created by Donatto on 3/06/22.
//

import Foundation

final class AuthenticationRepository {
    private let afd: AuthenticationFirebaseDatasource
    
    init(afd: AuthenticationFirebaseDatasource = AuthenticationFirebaseDatasource()) {
        self.afd = afd
    }
    
    func getCurrentUser() -> User? {
        afd.getCurrentUser()
    }
    
    func createNewUser(email: String, password: String, completionBlock: @escaping (Result<User, Error>) -> Void) {
        afd.createNewUser(email: email, password: password, completionBlock: completionBlock)
    }
    
    func login(email: String, password: String, completionBlock: @escaping (Result<User, Error>) -> Void) {
        afd.login(email: email, password: password, completionBlock: completionBlock)
    }
    
    func logout() throws {
        try afd.logout()
    }
}
