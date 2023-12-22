//
//  Coordinator.swift
//  JuiceMaker
//
//  Created by Effie on 12/22/23.
//

protocol Coordinator : AnyObject {
    var childCoordinators : [Coordinator] { get set }
    func start()
}
