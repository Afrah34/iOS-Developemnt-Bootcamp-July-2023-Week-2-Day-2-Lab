//
//  ContentView.swift
//  Projectweek2Lab2
//
//  Created by Afrah Faisal on 14/01/1 445 AH.
//

import SwiftUI
struct CardData: Identifiable {
    let id: UUID = UUID()
}
struct ContentView: View {
    let names: Array<String> = [
        "janesmith",
        "nadim",
    ]
    @State private var isPresented = false
    @State private var isDarkMode = true
    let cards: Array<CardData> = Array(
        repeating: CardData(
        ),
        count: 2
    )
    var body: some View {
        NavigationStack{
            HStack{
                Text("")
                    .navigationTitle("Week29")
                    .navigationBarTitleDisplayMode(.large)
                
              
            }
            HStack{
                ZStack {
                    Rectangle()
                        .fill(Color.black.opacity(0.1))
                    VStack{
                    Image("horse-5")
                            .resizable()
                            .scaledToFill()
                           .frame(width: 150,height: 50)
                        
                        Text("Mon")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .frame(height: 100)
                Spacer()
                    .padding(12)
            }
            
            HStack {
                ForEach(names, id: \.self) { category in
                    Text(category)
                    Image(systemName: "person.crop.circle")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(cards) { card in
                        ZStack {
                            Rectangle()
                                .fill(Color.black.opacity(0.1))
                            Image("book12")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 300 ,height: 150)
                          
                            VStack {
                                Spacer()
                            }
                        }
                        .frame(width: 300, height: 150)
                    }
                }
            }
            Button {
                print("Button pressed")
            } label: {
                Text("Show details")
                    .padding(20)
            }
            .contentShape(Rectangle())
            Button("dark") {
                    isPresented = true
                }
                .sheet(isPresented: $isPresented) {
                    List {
                        Toggle("Dark Mode", isOn: $isDarkMode)
                    }
                    .preferredColorScheme(isDarkMode ? .dark : .light)
                }
            }
        }
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
