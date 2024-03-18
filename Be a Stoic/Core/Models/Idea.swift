//
//  Idea.swift
//  Be a Stoic
//
//  Created by Benjámin Szilágyi on 08/03/2024.
//

import Foundation

struct Idea: Identifiable, Hashable, Equatable{
    
    let id = UUID()
    var text: String
    var isShared: Bool = false
    var isDraft: Bool = true
    var date: TimeInterval =  NSDate().timeIntervalSince1970
}


func filterOnlyNotDraft(ideas: [Idea]?) -> [Idea]{
    guard let list = ideas else { return [] }
    return list.filter{ idea in !idea.isDraft }
}


extension MyIdeaModel {
    func toIdea() -> Idea {
        return Idea(
            text: self.text!,
            isShared: self.isShared,
            isDraft: self.isDraft
        )
    }
}
