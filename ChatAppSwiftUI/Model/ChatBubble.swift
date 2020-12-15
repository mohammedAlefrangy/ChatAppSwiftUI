//
//  ChatBubble.swift
//  ChatAppSwiftUI
//
//  Created by Mohammed on 12/14/20.
//

import Foundation
import SDWebImageSwiftUI
import SwiftUI

struct ChatBubble : Shape {
    
    var mymsg : Bool
    
    func path(in rect: CGRect) -> Path {
            
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight,mymsg ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 16, height: 16))
        
        return Path(path.cgPath)
    }
}
