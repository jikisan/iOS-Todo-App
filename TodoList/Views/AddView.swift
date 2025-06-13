//
//  AddView.swift
//  TodoList
//
//  Created by Kyle Mac on 6/13/25.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel : ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .frame(height: 55)
                    .padding(.horizontal)
                    .background(Color(UIColor.secondarySystemFill))
                    .cornerRadius(10)
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
            
        }
        .navigationTitle("Add an Item 🖋️")
        .alert(isPresented: $showAlert, content: { getAlert() })
    }
    
    func saveButtonPressed() {
        
        if textIsValid() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    
    func textIsValid() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Must be at least 3 characters long. 😿"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert (title: Text(alertTitle))
    }
}

#Preview {
    NavigationView {
        AddView()
    }
    .environmentObject(ListViewModel())
    
}
