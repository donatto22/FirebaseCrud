//
//  LoginEmailView.swift
//  examen2-minaya
//
//  Created by Donatto on 3/06/22.
//

import SwiftUI

struct LoginEmailView: View {
    @ObservedObject var viewModel: AuthenticationViewModel
    @State var textFieldEmail: String = ""
    @State var textFieldPassword: String = ""
    
    
    var body: some View {
        VStack {
            Group {
                Text("Bienvenido de nuevo a").padding(.top, 10)
                Text("Examen2-Minaya")
                    .bold().underline()
            }
            .padding(.horizontal, 8)
            .multilineTextAlignment(.center)
            .font(.largeTitle)
            .listItemTint(.primary)
            
            Group {
                Text("Ingresa de nuevo para visualisar los usuarios")
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                
                TextField("Añade tu correo electrònico", text: $textFieldEmail).padding(.top, 10)
                TextField("Añade tu contraseña", text: $textFieldPassword).padding(.top, 10)
                
                Button("Login") {
                    viewModel.login(email: textFieldEmail, password: textFieldPassword)
                }
                .padding(.top, 10)
            }
            .padding(.horizontal, 64)
            Spacer()
        }
    }
}

struct LoginEmailView_Previews: PreviewProvider {
    static var previews: some View {
        LoginEmailView(viewModel: AuthenticationViewModel())
    }
}
