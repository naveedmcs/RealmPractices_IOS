//
//  SheetView.swift
//  Todo
//
//  Created by Adeel-IOS on 29/07/2021.
//

import SwiftUI

struct SheetView: View {
    
    // Properties
    @ObservedObject var viewModel: TodoViewModel
    @State var newName = ""
    @Binding var show: Bool
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Add task name")) {
                    TextField("Name", text: $newName )
                        
                        
                }
            }
            .navigationTitle(Text("Add Task"))
            .navigationBarItems(trailing:
                                    Button("Save") {
                                        viewModel.save(text: newName)
                                        self.show.toggle()
                                    })
        }
    }
}

//struct SheetView_Previews: PreviewProvider {
//    static var previews: some View {
//        SheetView(model: <#TodoViewModel#>, show: .constant(true))
//    }
//}
