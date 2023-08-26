//
//  MenuRouter.swift
//  KpuRecordApp
//
//  Created by Prizega  on 22/08/23.
//

import Foundation
import UIKit

class MenuRouter: PTRMenuProtocol{
    static func createMainMenuModule() -> MenuVC {
        
        let view = MenuVC()
        let presenter = MenuPresenter()
        let interactor: PTIMenuProtocol = MenuInteractor()
        let router : PTRMenuProtocol = MenuRouter()
                
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
                
        interactor.presenter = presenter
        view.presenter = presenter
                
        return view
    }
    
    func goToInformation(nav: UINavigationController) {
//        let view = DataDetailRouter.createDataDetailModule()
        let view = InformationRouter.createInformationModule()
        nav.pushViewController(view, animated: true)
    }
    
    func goToFillData(nav: UINavigationController) {
        let view = FormEntryRouter.createFormEntryModule()
        nav.pushViewController(view, animated: true)
    }
    
    func goToShowData(nav: UINavigationController) {
        let view = DataDetailRouter.createDataDetailModule()
        nav.pushViewController(view, animated: true)
    }
    
    
}
