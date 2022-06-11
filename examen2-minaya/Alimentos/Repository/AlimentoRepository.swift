//
//  AlimentoRepository.swift
//  examen2-minaya
//
//  Created by Donatto on 9/06/22.
//

import Foundation

final class AlimentoRepository {
    private let ads: AlimentoDataSource
    private let metadata: MetadataDatasource
    
    init(ads: AlimentoDataSource = AlimentoDataSource(), metadata: MetadataDatasource = MetadataDatasource()) {
        self.ads = ads
        self.metadata = metadata
    }
    
    func obtenerAlimentos(cb: @escaping (Result<[AlimentoModel], Error>) -> Void) {
        ads.obtenerAlimentos(completionBlock: cb)
    }
    
    func agregarAlimento(alimento: String, precio: String, cb: @escaping (Result<AlimentoModel, Error>) -> Void) {
        metadata.getMetadata(alimento: alimento, precio: precio) { [weak self] result in
            switch result {
            case .success(let alimentoModel):
                self?.ads.agregarAlimento(alimento: alimentoModel, completionBlock: cb)
            
            case .failure(let error):
                cb(.failure(error))
            }
        }
    }
    
    func actualizarAlimento(alimento: AlimentoModel) {
        ads.actualizarAlimento(alimento: alimento)
    }
    
    func eliminar(alimento: AlimentoModel) {
        ads.eliminar(alimento: alimento)
    }
}
