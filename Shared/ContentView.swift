// https://www.youtube.com/watch?v=W1QhWpc7j4Y
//  ContentView.swift
//  Shared
//
//  Created by Gleb Zadonskiy on 29.08.2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var degrees: Double = 0
    @State private var flipped = false
    
    @State private var name = ""
    @State private var expires = ""
    @State private var cvv = ""
    
    var body: some View {
        
        VStack{
            
            CreditCard {
                
                VStack {
                    Group {
                        if flipped {
                            CreditCardBack(cvv: cvv)
                        }else{
                            CreditCardFront(name: name, expires: expires)
                        }
                    }
                }.rotation3DEffect(
                    .degrees(degrees),
                    axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
                    
                )
                
            }.onTapGesture{
                withAnimation{
                    degrees += 180
                    flipped.toggle()
                }
            }
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.top, .leading, .trailing])
            TextField("Expires", text: $expires)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.leading, .trailing])
            TextField("CVV", text: $cvv){ (editingChanged) in
                
                withAnimation{
                    degrees += 180
                    flipped.toggle()
                }
            } onCommit: {}
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.leading, .trailing])

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
