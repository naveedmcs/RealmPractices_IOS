//
//  HomeView.swift
//  Todo
//
//  Created by Adeel-IOS on 29/07/2021.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: TodoViewModel
    @State var showSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.freezedItems) { item in
                    Text(item.taskTitle)
                }
                .onDelete(perform: delete)
            }
            .navigationTitle(Text("Todo List"))
            .navigationBarItems(leading: EditButton().animation(.default), trailing: Button(action: {
                showSheet.toggle()
            }, label: {
                Text("Add")
            })
            .sheet(isPresented: $showSheet) {
                SheetView(viewModel: viewModel, show: $showSheet)
            }
            )
        }
    }
    
    func delete(at offsets: IndexSet) {
    
        viewModel.delete(deleteObject: offsets)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: TodoViewModel())
    }
}


