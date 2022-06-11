//
//  AuthenticationFirebaseDatasource.swift
//  examen2-minaya
//
//  Created by Donatto on 3/06/22.
//

import Foundation
import FirebaseAuth

struct User {
    let email: String
}

final class AuthenticationFirebaseDatasource {
    func getCurrentUser() -> User? {
        guard let email = Auth.auth().currentUser?.email else { return nil }
        return .init(email: email)
    }
    
    func createNewUser(email: String, password: String, completionBlock: @escaping(Result<User, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { AuthDataResult, Error in
            if let Error = Error {
                print("Error en la creaciòn de un usuario \(Error.localizedDescription)")
                completionBlock(.failure(Error))
                return
            }
            
            let email = AuthDataResult?.user.email ?? "No email"
            print("Nuevo usuario creado con el correo \(email)")
            completionBlock(.success(.init(email: email)))
        }
    }
    
    func login(email: String, password: String, completionBlock: @escaping(Result<User, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { AuthDataResult, Error in
            if let Error = Error {
                print("Error en el login de un usuario \(Error.localizedDescription)")
                completionBlock(.failure(Error))
                return
            }
            
            let email = AuthDataResult?.user.email ?? "No email"
            print("Usuario logeado con el correo \(email)")
            completionBlock(.success(.init(email: email)))
        }
    }
    
    func logout() throws {
        try Auth.auth().signOut()
    }
}
