//
//  AlertFactoryService.swift
//  JuiceMaker
//
//  Created by 김예준 on 2023/09/27.
//

import UIKit

protocol AlertFactoryService {
    func build(alertData: AlertViewData) -> UIAlertController
}
