//
//  IdeaModelTest.swift
//  Be a StoicTests
//
//  Created by Benjámin Szilágyi on 11/03/2024.
//

import XCTest
@testable import Be_a_Stoic

class IdeaModelTest : XCTestCase{
    
    func test_myFilter() throws {
        let list = [
            Idea(text: "", isShared: false, isDraft: true),
            Idea(text: "", isShared: false, isDraft: false),
            Idea(text: "", isShared: false, isDraft: true),
            Idea(text: "", isShared: false, isDraft: false)
        ]
        let newArray = filterOnlyNotDraft(ideas: list)
        XCTAssertEqual(newArray.count, 2)
    }
    
    func test_shouldBeAmptyList() throws {
        let list = [
            Idea(text: "", isShared: false, isDraft: true),
            Idea(text: "", isShared: false, isDraft: true),
        ]
        let emptyArray = filterOnlyNotDraft(ideas: list)
        XCTAssertEqual(emptyArray.count, 0)
    }
    
    func test_pareameterAsNil() throws {
        let emptyArray = filterOnlyNotDraft(ideas: nil)
        XCTAssertEqual(emptyArray.count, 0)
    }
}
