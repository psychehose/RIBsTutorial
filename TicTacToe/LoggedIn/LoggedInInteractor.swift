//
//  LoggedInInteractor.swift
//  TicTacToe
//
//  Created by KIM HOSE on 2022/04/28.
//  Copyright © 2022 Uber. All rights reserved.
//

import RIBs
import RxSwift

protocol LoggedInRouting: Routing {
  func cleanupViews()
  func routeToTicTacToe()
  func routeToOffGame()
}

protocol LoggedInListener: AnyObject {
  // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class LoggedInInteractor: Interactor, LoggedInInteractable, OffGameListener, TicTacToeListener {
  weak var router: LoggedInRouting?
  weak var listener: LoggedInListener?
  
  // TODO: Add additional dependencies to constructor. Do not perform any logic
  // in constructor.
  override init() {}
  
  override func didBecomeActive() {
    super.didBecomeActive()
    // TODO: Implement business logic here.
  }
  
  override func willResignActive() {
    super.willResignActive()
    
    router?.cleanupViews()
    // TODO: Pause any business logic.
  }
  func startTicTacToe() {
    router?.routeToTicTacToe()
  }
  func gameDidEnd() {
    router?.routeToOffGame()
  }
}
