//
//  IMCView.swift
//  IOSFundamentals
//
//  Created by Roman Uriel on 10/01/25.
//
import SwiftUI

struct IMCView: View{
    @State var selectedIndex : Int = 0
    @State var height : Double = 60
    @State var age: Double = 19
    @State var weight: Double = 160
    
    var body: some View {
        VStack{
            HStack{
                ToogleButton(text: "Male", imageName: "person.fill", index: 0, selectedIndex: $selectedIndex)
                ToogleButton(text: "Female", imageName: "star.fill", index: 1, selectedIndex: $selectedIndex)
            }
            HeightCaculator(selectedHeight: $weight)
            HStack{
                heightSelected(text: "Edad", selected: $age)
                heightSelected(text: "Peso", selected: $height)
            }
            ButtonBuildImc(weight: weight, height: height)
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
    @Binding var selectedIndex : Int
    
    var body: some View {
        
        let (primary, secondary) = if(index == selectedIndex){
            (Color.backgroundSelected,  Color.backgroundComponent)
        }else {
            (Color.backgroundComponent, Color.backgroundSelected)
        }
        
        VStack{
            Button(action:{
                selectedIndex = index
            }) {
                VStack{
                    Image(systemName: imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .foregroundColor(secondary )
                    InformationText(text: text)
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(primary)
            }
        }
    }
}

struct TitleText: View {
    let text: String
    var body: some View {
        Text(text).font(.title3).foregroundColor(.teal)
    }
}

struct InformationText: View {
    let text: String
    var body: some View {
        Text(text).font(.title2).bold().foregroundColor(.white)
    }
}

struct HeightCaculator: View{
    @Binding var selectedHeight: Double
    var body: some View {
        VStack{
            TitleText(text: "Altura")
            InformationText(text: "\(Int(selectedHeight))  cm")
            Slider(value: $selectedHeight, in: 100...250, step: 1).accentColor(.teal).padding(.horizontal, 16)
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundComponent)
    }
}

struct heightSelected: View {
    let text : String
    @Binding var selected : Double
    var body: some View {
        VStack{
            TitleText(text: text).padding()
            InformationText(text: "\(Int(selected))")
            HStack{
                Button(action:{ if(selected > 0 ) {selected -= 1 }}){
                    ZStack{
                        Circle()
                            .frame(width: 70, height: 70)
                            .foregroundColor(.purple)
                        Image(systemName: "minus")
                            .foregroundColor(.white)
                            .frame(width: 30, height: 30)
                    }
                    
                }
                Button(action:{ if(selected < 100){ selected += 1 }}){
                    ZStack{
                        Circle()
                            .frame(width: 70, height: 70)
                            .foregroundColor(.purple)
                     Image(systemName: "plus")
                            .foregroundColor(.white)
                            .frame(width: 30, height: 30)
                    }
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundComponent)
    }
}

struct ButtonBuildImc: View {
    let weight: Double
    let height: Double
    var body: some View {
        NavigationStack{
            NavigationLink(destination: ResultScreen(userWeight: weight, userHeight: height)){
                Text("Calcular")
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .font(.title2).bold().foregroundColor(.white).background(Color.purple)
            }
        }
    }
}
#Preview {
    //ToogleButton(text: "Hello", imageName: "", index: 0)
    IMCView()
}
