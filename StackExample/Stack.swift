//
//  Stack.swift
//  StackExample
//
//  Created by Omar Ashraf on 26/11/2024.
//

import Foundation

struct Stack<Element> {
    private var storage: [Element] = []
    
    init() { }
    
    init(elements: [Element]) {
        storage = elements
    }
    
    mutating func push(element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    mutating func pop() -> Element? {
        return storage.popLast()
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        return storage.map { "\($0)" }.joined(separator: " ")
    }
}
