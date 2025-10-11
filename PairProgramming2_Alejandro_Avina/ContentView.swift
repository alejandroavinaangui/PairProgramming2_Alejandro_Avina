//
//  ContentView.swift
//  PairProgramming2_Alejandro_Avina
//
//  Created by Alejandro Avina on 10/11/25.
//

import SwiftUI


let emojis = ["🇺🇸","🇺🇾","🇺🇿","🇻🇺","🇻🇦","🇻🇪","🇻🇳","🇼🇫","🇪🇭","🇾🇪","🇿🇲","🇬🇧"]

private var gridItems = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]

struct ContentView: View {
   
    var body: some View {
        Text("Game").font(.system(size:40)).foregroundColor(.green).fontWeight(.bold)
        ScrollView{
            LazyVGrid(columns:gridItems,spacing:5){
                ForEach(emojis,id:\.self){
                    emoji in
                    EmojiCard(content:emoji)
                }
                
            }
        }
    }
    
}

struct EmojiCard: View{
    var content: String;
    @State var isFaceUp: Bool = true;
    var body: some View {
        ZStack{
            let shape = Rectangle().foregroundColor(.green).frame(width:100);
            Text(content).font(.system(size:70) ).fontWeight(.bold)
            if isFaceUp {
                shape.opacity(0)
            }
            else{
                shape.opacity(1)
            }
            
        }.padding(.horizontal)
            .onTapGesture {
                
                isFaceUp = !isFaceUp
            }
      
        
    }
}

#Preview {
    ContentView()
}
