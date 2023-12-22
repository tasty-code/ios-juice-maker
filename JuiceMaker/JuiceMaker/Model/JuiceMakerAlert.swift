//
//  JuiceMakerAlert.swift
//  JuiceMaker
//
//  Created by 강창현 on 12/17/23.
//

import UIKit

protocol JuiceMakerAlert {
    /// JuiceMaker 프로젝트에서 필요한 Alert을 띄웁니다. 의도한 Alert Action을 순서에 맞게 입력해주세요.
    /// - Parameters:
    ///   - buttonTitles: Alert이 present 되었을 때, 필요한 버튼들의 제목을 순서대로 나열해주세요.
    ///   - message: Alert이 present 되었을 때, 표시할 메세지를 입력해주세요.
    ///   - styles: Alert 버튼의 스타일을 순서대로 지정해주세요.
    ///   - completions: Alert 버튼을 눌렀을 때 진행할 Action을 순서대로 입력해주세요.
    func showJuiceMakerAlert(buttonTitles: [String],
                             message: String,
                             styles: [UIAlertAction.Style],
                             completions: [(() -> Void)?])
}

extension JuiceMakerAlert where Self: UIViewController {
    func showJuiceMakerAlert(buttonTitles: [String],
                             message: String,
                             styles: [UIAlertAction.Style] = [.default],
                             completions: [(() -> Void)?] = [nil]) {
        guard buttonTitles.count == styles.count,
              buttonTitles.count > completions.count
        else {
            fatalError("InputError: showJuiceMakerAlert() - Please Check Parameters")
        }
        let alert = UIAlertController(title: "알림",
                                      message: message,
                                      preferredStyle: .alert)
        for (index, buttonTitle) in buttonTitles.enumerated() {
            let action = UIAlertAction(title: buttonTitle, 
                                       style: styles[index],
                                       handler: { _ in
                completions[index]?()
            })
            alert.addAction(action)
        }
        self.present(alert, animated: true)
    }
}
