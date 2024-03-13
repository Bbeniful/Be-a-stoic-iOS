//
//  Playground.swift
//  Be a Stoic
//
//  Created by Benjámin Szilágyi on 13/03/2024.
//

import Foundation
import SwiftUI

class Playground : OnSettingsClick{
    
    
    
    func onSettingsClick() {
        
    }
}

struct MyView: View{
    
    var body: some View{
        BaseBackground(content: HStack(content: {
            Text("Asd")
        }),onSettingsClick: <#T##OnSettingsClick#>)
    }
}

class SettingsClick: OnSettingsClick {
    func onSettingsClick() {
        print("")
    }
}
