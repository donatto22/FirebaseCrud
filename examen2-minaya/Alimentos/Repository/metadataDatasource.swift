//
//  metadataDatasource.swift
//  examen2-minaya
//
//  Created by Donatto on 10/06/22.
//

import Foundation
import LinkPresentation

enum CustomMetadataError: Error {
    case badURL
}

final class MetadataDatasource {
    private var provider: LPMetadataProvider?
    
    
    
    func getMetadata(alimento: String, precio: String, completionBlock: @escaping (Result<AlimentoModel, Error>) -> Void) {
        guard let url = URL(string: "https://www.google.com") else {
            completionBlock(.failure(CustomMetadataError.badURL))
            return
        }
        
        provider = LPMetadataProvider()
        provider?.startFetchingMetadata(for: url, completionHandler: { metadata, error in
            if let error = error {
                print("Error en getMetadata")
                completionBlock(.failure(error))
                return
            }
            
            let alimentoModel = AlimentoModel(alimento: alimento, favorito: false, precio: precio)
            completionBlock(.success(alimentoModel))
        })
        
        
    }
}
