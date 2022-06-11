//
//  AlimentoView.swift
//  examen2-minaya
//
//  Created by Donatto on 9/06/22.
//

import SwiftUI

struct AlimentoView: View {
    @ObservedObject var alimentoViewModel : AlimentoViewModel
    @State var textAlimento: String = ""
    @State var textPrecio: String = ""
    
    var body: some View {
        Button(action: {
            alimentoViewModel.obtenerAlimentos()
        }) {
            Text("obtener")
        }
        VStack {
            TextEditor(text: $textAlimento).frame(height: 35)
            TextEditor(text: $textPrecio).frame(height: 35)
            
            Button(action: {
                alimentoViewModel.agregarAlimento(alimento: textAlimento, precio: textPrecio)
            }) {
                Text("Insertar")
            }
            
            List {
                ForEach(alimentoViewModel.alimentos) { alimento in
                    
                    VStack {
                        Text(alimento.alimento).bold().lineLimit(4).padding(.bottom, 8)
                        Text(alimento.precio).foregroundColor(.gray).font(.caption)
                        
                        HStack {
                            Spacer()
                            if alimento.favorito {
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .foregroundColor(.yellow)
                                    .frame(width: 10, height: 10)
                            }
                            
                            Button(action: {
                                alimentoViewModel.eliminar(alimento: alimento)
                            }) {
                                Text("Eliminar")
                            }
                            
                          
                        }
                    }
                    
                }
            }
        }
    }
}

struct AlimentoView_Previews: PreviewProvider {
    static var previews: some View {
        AlimentoView(alimentoViewModel: AlimentoViewModel())
    }
}
