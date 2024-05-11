//
//  TodoItemView.swift
//  Todo
//
//  Created by Aslam Thachapalli on 24/04/24.
//

import SwiftUI

struct TodoItemView: View {
    @StateObject var viewModel = TodoItemViewViewModel()
    let item : TodoItem
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.title2)
                
                Text("\(Date(timeIntervalSince1970: item.dueData).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Button(action: {
                viewModel.toggleDoneStatus(item: item)
            }
                   , label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.blue)
            })
        }
    }
}

#Preview {
    TodoItemView(item: .init(
        id: "325jla",
        title: "Todo",
        dueData: Date().timeIntervalSince1970,
        createdDate: Date().timeIntervalSince1970,
        isDone: true
    ))
}
