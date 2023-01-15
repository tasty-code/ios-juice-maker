//
//  countLableAttribte.swift
//  JuiceMaker
//
//  Created by Jason on 2023/01/15.
//

import UIKit

//MARK: - JuiceViewController
final class StrawberryJuiceLabel: UILabel, Gettable {
    var fruit: Fruit = .strawberry
}

final class BananJuiceLabel: UILabel, Gettable {
    var fruit: Fruit = .banana
}

final class PineAppleJuiceLabel: UILabel, Gettable {
    var fruit: Fruit = .pineApple
}

final class KiwiJuiceLabel: UILabel, Gettable {
    var fruit: Fruit = .kiwi
}

final class MangoJuiceLabel: UILabel, Gettable {
    var fruit: Fruit = .mango
}

//MARK: - FruitViewController
final class StrawberryLabel: UILabel, Gettable {
    var fruit: Fruit = .strawberry
}

final class BananaLabel: UILabel, Gettable {
    var fruit: Fruit = .banana
}

final class PineAppleLabel: UILabel, Gettable {
    var fruit: Fruit = .pineApple
}

final class KiwiLabel: UILabel, Gettable {
    var fruit: Fruit = .kiwi
}

final class MangoLabel: UILabel, Gettable {
    var fruit: Fruit = .mango
}
