//
//  CreditCard.swift
//  CreditCardSwiftUI
//
//  Created by Gleb Zadonskiy on 29.08.2020.
//

import  SwiftUI

struct CreditCard<Content>: View where Content: View {
    
    var content: () -> Content
    
    var body: some View {
        content()
    }
}

struct CreditCardFront: View{
    var name = ""
    var expires = ""
    
    
    var body: some View {
      
        
        VStack(alignment: .leading){
            
            HStack(alignment: .top) {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(Color.white)
                Spacer()
                
                Text("VISA")
                    .foregroundColor(Color.white)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
            }
          Spacer()
            
            Text("**** **** **** 1234")
                .foregroundColor(.white)
                .font(.system(size: 32))
            
            Spacer()
            
            HStack{
                
                VStack(alignment: .leading){
                    Text("Card Holder")
                        .foregroundColor(Color.gray)
                        .font(.caption)
                        .fontWeight(.bold)
                    Text(name)
                        .foregroundColor(Color.white)
                        .font(.caption)
                        .fontWeight(.bold)
                    
                }
                Spacer()
                
                VStack{
                    Text("Expires")
                        .foregroundColor(Color.gray)
                        .font(.caption)
                        .fontWeight(.bold)
                    Text(expires)
                        .foregroundColor(Color.white)
                        .font(.caption)
                        .fontWeight(.bold)
                }
            }
            
            
        } .frame(width: 300, height: 200)
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color.init(#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)), Color.blue]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(10)
    }
}

struct CreditCardBack: View{
    var cvv = ""
    var body: some View {
        VStack{
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 20)
                .padding([.top])
            Spacer()
            
            HStack{
                
                Text(cvv)
                    .foregroundColor(Color.black)
                    .rotation3DEffect(
                        .degrees(180), axis: (x: 0.0, y: 1.0, z: 0.0))
                    .padding(5)
                    .frame(width: 100, height: 20)
                    .background(Color.white)
                
                Spacer()
            }.padding()
            
        } .frame(width: 300, height: 200)
        .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.green]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(10)
    }
}

struct CreditCard_Previews: PreviewProvider {
    static var previews: some View {
        CreditCard<CreditCardFront>(content: { CreditCardFront(name: "Gleb Zadonskiy", expires: "02/06") })
    }
}
