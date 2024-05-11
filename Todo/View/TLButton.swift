//
//  TLButton.swift
//  Todo
//
//  Created by Aslam Thachapalli on 26/04/24.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        },label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }).padding(.vertical, 12)
    }
}

#Preview {
    TLButton(title: "Value", backgroundColor: .pink) {
        // action
    }
}
