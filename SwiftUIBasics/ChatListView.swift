//
//  ChatListView.swift
//  SwiftUIBasics
//
//  Created by Ani's Mac on 06.12.23.
//

import SwiftUI

struct Person: Identifiable {
    let id = UUID()
    let avatar: Image
    let name: String
    let status: String
    let time: String
}

struct PersonList {
    static let persons = [
        Person(avatar: Image("Francisco"), name: "Francisco Miles", status: "I went there yesterday", time: "18:14"),
        Person(avatar: Image("Arlene"), name: "Arlene Fisher", status: "IDK what else is there to do", time: "22:31"),
        Person(avatar: Image("Darlene"), name: "Darlene Hawkins", status: "No, I can't come tomorrow.", time: "09:18"),
        Person(avatar: Image("Eduardo"), name: "Eduardo Mckinney", status: "Go to hell", time: "Yesterday"),
        Person(avatar: Image("Aubrey"), name: "Aubrey Cooper", status: "I hope it goes well.", time: "Friday"),
        Person(avatar: Image("Jorge"), name: "Jorge Nguyen", status: "So, what's your plan this weekend?", time: "Thursday"),
        Person(avatar: Image("Cody"), name: "Cody Cooper", status: "What's the progress on that task?", time: "Tuesday"),
        Person(avatar: Image("Kristin"), name: "Kristin Pena", status: "Yeah! You're right.", time: "7/22/20"),
        Person(avatar: Image("Brandie"), name: "Brandie Watson", status: "I went there yesterday", time: "8/19/20"),
        Person(avatar: Image("Stella"), name: "Stella Henry", status: "Martinique", time: "9/15/20")
    ]
}

struct ChatListView: View {
    
    @State var persons: [Person] = PersonList.persons
    @State var isChatCleared: Bool = false
    
    let backgroundColor = Color(red: 51/255, green: 51/255, blue: 51/255)
    
    var body: some View {
        NavigationStack {
            VStack {
                if persons.isEmpty {
                    Spacer()
                    Text("You've cleared all messages, but you can reset anytime 🦄")
                        .foregroundStyle(.white)
                        .font(.system(size: 16))
                        .frame(maxWidth: .infinity)
                    Spacer()
                } else {
                    List(persons) { person in
                        HStack(spacing: 12) {
                            person.avatar
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                HStack{
                                    Text(person.name)
                                        .font(.system(size: 16))
                                        .foregroundStyle(.white)
                                    
                                    Spacer()
                                    
                                    Text(person.time)
                                        .font(.system(size: 12))
                                        .foregroundStyle(.gray)
                                        .lineLimit(2)
                                }
                                
                                Text(person.status)
                                    .font(.system(size: 12))
                                    .foregroundStyle(.gray)
                                    .lineLimit(2)
                            }
                        }
                        .listRowBackground(backgroundColor)
                        .listRowSeparatorTint(Color.gray)
                    }
                    .listStyle(.grouped)
                    .background(backgroundColor)
                    .scrollContentBackground(.hidden)
                    
                    .navigationTitle("Chat")
                    .navigationBarTitleDisplayMode(.inline)
                }
                
                HStack(spacing: 16) {
                    Button {
                        persons.removeAll()
                        isChatCleared = true
                    } label: {
                        Text("Clear Chat")
                            .font(.system(size: 16))
                            .fontWeight(.medium)
                            .foregroundStyle(.white)
                            .frame(width: 150, height: 44)
                            .background(
                                Color(red: 36/255, green: 39/255, blue: 96/255)
                                    .cornerRadius(6)
                            )
                    }
                    
                    Button {
                        persons = PersonList.persons
                        isChatCleared = false
                    } label: {
                        Text("Reset")
                            .font(.system(size: 16))
                            .fontWeight(.medium)
                            .foregroundStyle(.white)
                            .frame(width: 150, height: 44)
                            .background(
                                Color(red: 36/255, green: 39/255, blue: 96/255)
                                    .cornerRadius(6)
                            )
                    }
                }
            }
            
            .background(backgroundColor)
        }
    }
}


#Preview {
    ChatListView()
}


