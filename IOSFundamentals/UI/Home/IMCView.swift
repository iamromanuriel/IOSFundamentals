//
//  IMCView.swift
//  IOSFundamentals
//
//  Created by Roman Uriel on 10/01/25.
//
import SwiftUI

struct IMCView: View{
    var body: some View {
        VStack{
            HStack{
                ToogleButton(text: "Male", imageName: "person.fill", index: 0)
                ToogleButton(text: "Female", imageName: "person ", index: 1)
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundApp)
            .toolbar{
                ToolbarItem(placement: .principal){
                    Text("IMC Calculator").foregroundColor( .white)
                }
            }
    }
}

struct ToogleButton: View {
    let text : String
    let imageName : String
    let index : Int
    
    var body: some View {
        VStack{
            Button(action:{}) {
                VStack{
                    Image(systemName: "heart.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .foregroundColor(.white )
                    Text(text)
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.backgroundComponent)
            }
        }
    }
}

#Preview {
    //ToogleButton(text: "Hello", imageName: "", index: 0)
    IMCView()
}
