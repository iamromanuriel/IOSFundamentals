//
//  ResultScreen.swift
//  IOSFundamentals
//
//  Created by Roman Uriel on 21/01/25.
//

import SwiftUI

struct ResultScreen: View {
    let userWeight: Double
    let userHeight: Double
    
    var body: some View {
        VStack{
            Text("Resultado").font(.title).foregroundColor(.white)
            Spacer()
            Text("Normal").font(.title3).bold().foregroundColor(.green).padding()
            Text("\(calculateIMC(userWeight: userWeight, userHeight: userHeight), specifier: "%.2f")").font(.largeTitle).bold().foregroundColor(.white).padding()
            Spacer()
            Text("Description").foregroundColor(.backgroundSelected)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundApp)
        
    }
}

func calculateIMC(userWeight: Double, userHeight: Double) -> Double {
    return userWeight / (userHeight/100)*2
}

#Preview {
    ResultScreen(userWeight: 60, userHeight: 168)
}
