//
//  AuthenticationViewModel.swift
//  examen2-minaya
//
//  Created by Donatto on 3/06/22.
//

import Foundation

final class AuthenticationViewModel: ObservableObject {
    @Published var user: User?
    @Published var messageError: String?
    private let repository: AuthenticationRepository
    
    init(repository: AuthenticationRepository = AuthenticationRepository()) {
        self.repository = repository
        getCurrentUser()
    }
    
    func getCurrentUser() {
        self.user = repository.getCurrentUser()
    }
    
    func createNewUser(email: String, password: String) {
        repository.createNewUser(email: email, password: password) { [weak self] result in
            switch result {
            case .success(let user):
                self?.user = user
            case .failure(let error):
                self?.messageError = error.localizedDescription
            }
        }
    }
    
    func login(email: String, password: String) {
        repository.login(email: email, password: password) { [weak self] result in
            switch result {
            case .success(let user):
                self?.user = user
            case .failure(let error):
                self?.messageError = error.localizedDescription
            }
        }
    }
    
    func logout() {
        do {
            try repository.logout()
            self.user = nil
        } catch {
            print("Error al cerrar sesion")
        }
    }
}
