//
//  HomeView.swift
//  examen2-minaya
//
//  Created by Donatto on 7/06/22.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: AuthenticationViewModel
    @StateObject var alimentoViewModel: AlimentoViewModel = AlimentoViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Bienvenido \(viewModel.user?.email ?? "No user")")
                    .padding(.top, 32)
                Spacer()
                AlimentoView(alimentoViewModel: AlimentoViewModel())
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Home")
            .toolbar {
                Button("Cerrar sesiòn") {
                    viewModel.logout()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: AuthenticationViewModel())
    }
}
