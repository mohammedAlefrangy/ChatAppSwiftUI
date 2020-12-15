//
//  ContentView.swift
//  ChatAppSwiftUI
//
//  Created by Mohammed on 12/11/20.
//


import SwiftUI

struct ContentView: View {
    
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body: some View {
       
        VStack{
            
            if status{

                NavigationView{
                    
                  Home()
                    .environmentObject(MainObservable())
                }
                
            }
            else{

                NavigationView{

                     LogInPage()
                }
            }
            
            
        }.onAppear {
            
            NotificationCenter.default.addObserver(forName: NSNotification.Name("statusChange"), object: nil, queue: .main) { (_) in
                
               let status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                   
                self.status = status
            }
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
