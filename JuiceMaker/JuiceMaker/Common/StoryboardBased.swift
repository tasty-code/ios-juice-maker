//
//  StoryboardBased.swift
//  JuiceMaker
//
//  Created by Effie on 12/19/23.
//

import UIKit

protocol StoryboardBased: StoryboardIdentifiable {
    static var sceneStoryboard: UIStoryboard { get }
}

extension StoryboardBased where Self: UIViewController {
    static var sceneStoryboard: UIStoryboard {
        return UIStoryboard(name: String(describing: self), bundle: nil)
    }
}
