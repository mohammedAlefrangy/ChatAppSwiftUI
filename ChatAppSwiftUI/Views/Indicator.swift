//
//  Indicator.swift
//  ChatAppSwiftUI
//
//  Created by Mohammed on 12/14/20.
//

// Indicator

import SwiftUI

struct Indicator : UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<Indicator>) -> UIActivityIndicatorView {
        
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.startAnimating()
        return indicator
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Indicator>) {
        
        
    }
}

//struct Indicator_Previews: PreviewProvider {
//    static var previews: some View {
//        Indicator()
//    }
//}
