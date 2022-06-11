//
//  RegisterEmmailView.swift
//  examen2-minaya
//
//  Created by Donatto on 3/06/22.
//

import SwiftUI

struct RegisterEmmailView: View {
    @ObservedObject var viewModel: AuthenticationViewModel
    @State var textFieldEmail: String = ""
    @State var textFieldPassword: String = ""
    
    
    var body: some View {
        VStack {
            Group {
                Text("Bienvenido a").padding(.top, 10)
                Text("Examen2-Minaya")
                    .bold().underline()
            }
            .padding(.horizontal, 8)
            .multilineTextAlignment(.center)
            .font(.largeTitle)
            .listItemTint(.primary)
            
            Group {
                Text("Registrate para visualisar los usuarios")
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                
                TextField("Añade tu correo electrònico", text: $textFieldEmail).padding(.top, 10)
                TextField("Añade tu contraseña", text: $textFieldPassword).padding(.top, 10)
                
                Button("Aceptar") {
                    viewModel.createNewUser(email: textFieldEmail, password: textFieldPassword)
                }
                .padding(.top, 10)
            }
            .padding(.horizontal, 64)
            Spacer()
        }
    }
}

struct RegisterEmmailView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterEmmailView(viewModel: AuthenticationViewModel())
    }
}
