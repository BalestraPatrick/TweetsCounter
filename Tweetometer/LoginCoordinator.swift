//
//  LoginCoordinator.swift
//  TweetsCounter
//
//  Created by Patrick Balestra on 12/1/16.
//  Copyright © 2016 Patrick Balestra. All rights reserved.
//

import UIKit

protocol LoginCoordinatorDelegate: class {
    func dismiss()
}

final class LoginCoordinator: Coordinator, LoginCoordinatorDelegate {

    lazy var controller: LogInViewController = {
        return StoryboardScene.Login.login.instantiate()
    }()
    var childCoordinators = [AnyObject]()

    let homeController: HomeViewController
    let linkOpener = LinkOpener()

    init(parent: HomeViewController) {
        self.homeController = parent
        linkOpener.coordinator = self
    }

    func start() {
        controller.coordinator = self
        homeController.present(controller, animated: true)
    }

    // MARK: Coordinator
    
    func presentSafari(_ url: URL) {
        let safari = linkOpener.openInSafari(url)
        controller.present(safari, animated: true, completion: nil)
    }

    // MARK: LoginCoordinatorDelegate

    func dismiss() {
        controller.dismiss(animated: true)
//        homeController.refreshTimeline()
//        homeController.requestProfilePicture()
    }
}
