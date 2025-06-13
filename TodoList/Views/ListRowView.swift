//
//  ListRowView.swift
//  TodoList
//
//  Created by Kyle Mac on 6/13/25.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
            
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview {
    
    var item1 = ItemModel(title: "This is the first item", isCompleted: false)
    var item2 = ItemModel(title: "This is the second item", isCompleted: true)
    
    Group {
        ListRowView(item: item1)
        ListRowView(item: item2)
    }
    
    
}
