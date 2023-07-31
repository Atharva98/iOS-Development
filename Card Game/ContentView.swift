//
//  ContentView.swift
//  War Card Game
//
//  Created by Atharva Pandit on 7/30/23.
//

import SwiftUI

struct ContentView: View {
    @State var playerCard = "card2"
    @State var cpuCard = "card3"
    
    @State var playerScore = 0
    @State var cpuScore = 0
    
    var body: some View {
        ZStack{
            Image("background-plain").resizable().ignoresSafeArea()
            VStack {
                Image("logo")
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                
                    Button{
                        deal()
                    }label: {
                        Image("button")
                    }
                    
                Button("Restart Game"){
                    reset_button()
                }.foregroundColor(.white).padding()
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
    
    func deal(){
        //Randomizing player and CPU cards
        let playerCardValue = Int.random(in:2...14)
        let cpuCardValue = Int.random(in: 2...14)
        playerCard = "card" + String(playerCardValue)
        cpuCard = "card" + String(cpuCardValue)
        
        //Scoring
        if playerCardValue > cpuCardValue{
            playerScore += 1
        }
        else if playerCardValue < cpuCardValue{
            cpuScore += 1
        }
        else{
            playerScore += 1
            
        }
    }
    func reset_button(){
        playerScore = 0
        cpuScore = 0
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
