//
//  MainAssembly.swift
//  MyVPN
//
//  Created by Denis Kolesnev on 7.03.22.
//

import UIKit

final class MainAssembly {
    
    static func build() -> UIViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard
            let navigationController = storyboard.instantiateInitialViewController() as? UINavigationController,
            let viewController = navigationController.topViewController as? MainViewController
        else {
            return UIViewController()
        }

        let router = MainRouter()
        let presenter = MainPresenter()
        
        presenter.viewController = viewController
        presenter.router = router
        
        viewController.presenter = presenter
        router.presenter = presenter
        
        return navigationController
    }
}
