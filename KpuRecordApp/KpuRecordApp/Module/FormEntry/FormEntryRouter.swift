//
//  FormEntryRouter.swift
//  KpuRecordApp
//
//  Created by Prizega  on 22/08/23.
//

import Foundation
import UIKit

class FormEntryRouter: PTRFormEntryProtocol{
    static func createFormEntryModule() -> FormEntryVC {
        let view = FormEntryVC()
        let presenter = FormEntryPresenter()
        let interactor: PTIFormEntryProtocol = FormEntryInteractor()
        let router : PTRFormEntryProtocol = FormEntryRouter()
                
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
                
        interactor.presenter = presenter
        view.presenter = presenter
                
        return view
    }
    
    func goToMenu(nav: UINavigationController) {
        
    }
    
    
    
}
