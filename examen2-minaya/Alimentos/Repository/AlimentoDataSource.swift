//
//  AlimentoDataSource.swift
//  examen2-minaya
//
//  Created by Donatto on 9/06/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct AlimentoModel: Decodable, Identifiable, Encodable {
    @DocumentID var id: String?
    let alimento: String
    let favorito: Bool
    let precio: String
}

final class AlimentoDataSource {
    private let database = Firestore.firestore()
    private let collection = "alimentos"
    
    func obtenerAlimentos(completionBlock: @escaping (Result<[AlimentoModel], Error>) -> Void) {
        database.collection(collection).addSnapshotListener { query, error in
            if let error = error {
                print("Error obteniendo todos los alimentos")
                completionBlock(.failure(error))
                return
            }
            
            guard let documents = query?.documents.compactMap({ $0 }) else {
                completionBlock(.success([]))
                return
            }
            
            let alimentos = documents.map {
                try? $0.data(as: AlimentoModel.self)
            }.compactMap{$0}
            completionBlock(.success(alimentos))
        }
    }
    
    func agregarAlimento(alimento: AlimentoModel, completionBlock: @escaping (Result<AlimentoModel, Error>) -> Void) {
        do {
            _ = try database.collection(collection).addDocument(from: alimento)
            completionBlock(.success(alimento))
        } catch {
            completionBlock(.failure(error))
        }
    }
    
    func actualizarAlimento(alimento: AlimentoModel) {
        guard let documentId = alimento.id else {
            return
        }
        
        do {
            _ = try database.collection(collection).document(documentId).setData(from: alimento)
        } catch {
            print("Error al actualizar")
        }
    }
    
    func eliminar(alimento: AlimentoModel) {
        guard let documentId = alimento.id else { return }
        database.collection(collection).document(documentId).delete()
    }
}
