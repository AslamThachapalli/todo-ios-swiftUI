//
//  NewTodoItemView.swift
//  Todo
//
//  Created by Aslam Thachapalli on 24/04/24.
//

import SwiftUI

struct NewTodoItemView: View {
    @StateObject var viewModel = NewTodoItemViewViewModel()
    @Binding var newItemPresented : Bool
    
    var body: some View {
        VStack {
            Text("New Todo")
                .font(.system(size: 32))
                .bold().padding(.top, 100)
            
            Form{
                // Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // Save button
                TLButton(title: "Save", backgroundColor:.pink, action: {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                    
                }).padding()
            }.alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("Error"), message: Text("Title cannot be empty and select due date as today or newer"))
            })
        }
    }
}

#Preview {
    NewTodoItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
