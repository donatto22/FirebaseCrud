//
//  AlimentoViewModel.swift
//  examen2-minaya
//
//  Created by Donatto on 9/06/22.
//

import Foundation

final class AlimentoViewModel: ObservableObject {
    @Published var alimentos: [AlimentoModel] = []
    @Published var mensajeError: String?
    private let repository: AlimentoRepository
    
    init(repository: AlimentoRepository = AlimentoRepository()) {
        self.repository = repository
    }
    
    func obtenerAlimentos() {
        repository.obtenerAlimentos { [weak self] result in
            switch result {
            case .success(let models):
                self?.alimentos = models
            case .failure(let error):
                self?.mensajeError = error.localizedDescription
            }
        }
    }
    
    func agregarAlimento(alimento: String, precio: String) {
        repository.agregarAlimento(alimento: alimento, precio: precio) { [weak self] result in
            switch result {
            case .success(let alimento):
                print("")
            
            case .failure(let error):
                print("")
            }
        }
    }
    
    func actualizarFavorito(alimento: AlimentoModel) {
        let actualiza = AlimentoModel(id: alimento.id, alimento: alimento.alimento, favorito: alimento.favorito ? false: true, precio: alimento.precio)
        
        repository.actualizarAlimento(alimento: actualiza)
    }
    
    func eliminar(alimento: AlimentoModel) {
        repository.eliminar(alimento: alimento)
    }
}
