//
//  ProfileView.swift
//  SwiftUIBasics
//
//  Created by Ani's Mac on 06.12.23.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var dateOfBirth: String = ""
    @State private var country: String = ""
    
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 24) {
                Image("Avatar")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 166, height: 166)
                    .overlay(
                        Circle()
                            .stroke(Color(red: 36/255, green: 39/255, blue: 96/255), lineWidth: 1)
                            .frame(width: 170, height: 170)
                        
                            .overlay(alignment: .bottomTrailing, content: {
                                Image("Camera")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 32, height: 32)
                                    .padding(.trailing, 12)
                                    .padding(.bottom, 4)
                            })
                    )
                
                VStack(spacing: 40) {
                    VStack(spacing: 16) {
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Name")
                                .font(.system(size: 16))
                                .bold()
                                .padding(.leading, 24)
                            
                            TextField("test", text: $name)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal, 24)
                        }
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Email")
                                .font(.system(size: 16))
                                .bold()
                                .padding(.leading, 24)
                            
                            TextField("test@gmail.com", text: $email)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal, 24)
                        }
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Password")
                                .font(.system(size: 16))
                                .bold()
                                .padding(.leading, 24)
                            
                            TextField("************", text: $password)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal, 24)
                        }
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Date of Birth")
                                .font(.system(size: 16))
                                .bold()
                                .padding(.leading, 24)
                            
                            TextField("31/02/2000", text: $dateOfBirth)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal, 24)
                        }
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Country/Region")
                                .font(.system(size: 16))
                                .bold()
                                .padding(.leading, 24)
                            
                            TextField("Georgia", text: $country)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal, 24)
                        }
                    }
                    
                    Button {
                        print("🍭")
                    } label: {
                        Text("Save Changes")
                            .font(.system(size: 16))
                            .fontWeight(.medium)
                            .foregroundStyle(.white)
                            .frame(width: 220, height: 44)
                            .background(
                                Color(red: 36/255, green: 39/255, blue: 96/255)
                                    .cornerRadius(6)
                            )
                    }
                }
                
                Spacer()
            }
            
            .navigationBarItems(leading: Image(systemName: "chevron.left"))
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ProfileView()
}

