//
//  ContentView.swift
//  examen2-minaya
//
//  Created by Donatto on 3/06/22.
//

import SwiftUI

enum AuthenticationSheetview: String, Identifiable {
    case register
    case login
    
    var id: String {
        return rawValue
    }
}

struct ContentView: View {
    @ObservedObject var viewModel: AuthenticationViewModel
    @State private var asv: AuthenticationSheetview?
    
    var body: some View {
        VStack {
            Image("firebase-1").resizable()
                .frame(width: 200, height: 200)
            VStack {
                Button(action: {
                    asv = .login
                }, label: {
                    Label("Ingresar con Email", systemImage: "envelope.fill")
                })
            }
            .padding(.top, 60)
            Spacer()
            
            HStack {
                Button {
                    asv = .register
                } label: {
                    Text("si no tienes cuenta")
                    Text("Registrate").underline()
                }
            }
        }
        .sheet(item: $asv) { sheet in
            switch sheet {
            case .register: RegisterEmmailView(viewModel: viewModel)
            case .login: LoginEmailView(viewModel: viewModel)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: AuthenticationViewModel())
    }
}
