//
//  OffGameViewController.swift
//  TicTacToe
//
//  Created by KIM HOSE on 2022/04/28.
//  Copyright © 2022 Uber. All rights reserved.
//

import RIBs
import RxSwift
import SnapKit
import UIKit

protocol OffGamePresentableListener: class {
  func startTicTacToe()
}

final class OffGameViewController: UIViewController, OffGamePresentable, OffGameViewControllable {
  var uiviewController: UIViewController {
    return self
  }
  
  weak var listener: OffGamePresentableListener?
  
  init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("Method is not supported")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor.yellow
    buildStartButton()
  }
  
  // MARK: - Private
  
  private func buildStartButton() {
    let startButton = UIButton()
    view.addSubview(startButton)
    startButton.snp.makeConstraints { (maker: ConstraintMaker) in
      maker.center.equalTo(self.view.snp.center)
      maker.leading.trailing.equalTo(self.view).inset(40)
      maker.height.equalTo(100)
    }
    startButton.setTitle("Start Game", for: .normal)
    startButton.setTitleColor(UIColor.white, for: .normal)
    startButton.backgroundColor = UIColor.black

    startButton.rx.tap
      .subscribe(onNext: { [weak self] in
        self?.listener?.startTicTacToe()
      })
      .disposed(by: disposeBag)
  }
  private let disposeBag = DisposeBag()
}
