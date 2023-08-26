//
//  DataDetailRouter.swift
//  KpuRecordApp
//
//  Created by Prizega  on 22/08/23.
//

import Foundation
import UIKit

class DataDetailRouter: PTRDataDetailProtocol{
    static func createDataDetailModule() -> DataDetailVC {
        let view = DataDetailVC()
        let presenter = DataDetailPresenter()
        let interactor: PTIDataDetailProtocol = DataDetailInteractor()
        let router : PTRDataDetailProtocol = DataDetailRouter()
                
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
                
        interactor.presenter = presenter
        view.presenter = presenter
                
        return view
    }
    
    func goToHome(nav: UINavigationController) {
        let view = MenuRouter.createMainMenuModule()
        nav.pushViewController(view, animated: true)
    }
    
    
    
    
}
