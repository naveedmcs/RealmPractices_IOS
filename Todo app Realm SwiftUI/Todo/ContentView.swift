//
//  ContentView.swift
//  Todo
//
//  Created by Adeel-IOS on 29/07/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView(viewModel: TodoViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
