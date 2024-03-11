//
//  BaseBackground.swift
//  Be a Stoic
//
//  Created by Benjámin Szilágyi on 11/03/2024.
//

import SwiftUI

struct BaseBackground<Content: View>: View {
    let content: () -> Content
    
    init(content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        VStack{
            content()
        }
    }
}


#Preview {
    BaseBackground(content: {
        Text("")
    })
}
