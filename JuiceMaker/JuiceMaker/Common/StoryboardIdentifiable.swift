//
//  StoryboardIdentifiable.swift
//  JuiceMaker
//
//  Created by Effie on 12/12/23.
//

protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}
