//
//  buttonAttruibute.swift
//  JuiceMaker
//
//  Created by Jason on 2023/01/16.
//

import UIKit

protocol SingleJuiceGettable {
    var singleFruitJuice: SingleFruitJuice { get }
}

protocol MixJuiceGettable {
    var mixFruitJuice: MixFruitJuice { get }
}

final class StrawberrySingleButton: UIButton, SingleJuiceGettable {
    var singleFruitJuice: SingleFruitJuice = .strawberry
}

final class BananaSingleButton: UIButton, SingleJuiceGettable {
    var singleFruitJuice: SingleFruitJuice = .banana
}

final class PineAppleSingleButton: UIButton, SingleJuiceGettable {
    var singleFruitJuice: SingleFruitJuice = .pineApple
}

final class KiwiSingleButton: UIButton, SingleJuiceGettable {
    var singleFruitJuice: SingleFruitJuice = .kiwi
}

final class MangoSingleButton: UIButton, SingleJuiceGettable {
    var singleFruitJuice: SingleFruitJuice = .mango
}

final class StrawberryBananaMixButton: UIButton, MixJuiceGettable {
    var mixFruitJuice: MixFruitJuice = .strawberryBanana
}

final class MangoKiwiMixButton: UIButton, MixJuiceGettable {
    var mixFruitJuice: MixFruitJuice = .mangoKiwi
}
