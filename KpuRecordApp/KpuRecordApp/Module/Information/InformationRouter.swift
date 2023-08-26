//
//  InformationRouter.swift
//  KpuRecordApp
//
//  Created by Prizega  on 22/08/23.
//

import Foundation
import UIKit

class InformationRouter: PTRInformationProtocol{
    static func createInformationModule() -> InformationVC {
        let view = InformationVC()
        let presenter = InformationPresenter()
        let interactor: PTIInformationProtocol = InformationInteractor()
        let router : PTRInformationProtocol = InformationRouter()
                
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
                
        interactor.presenter = presenter
        view.presenter = presenter
                
        return view
    }
    
    
}
