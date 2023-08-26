//
//  ListParticipantRouter.swift
//  KpuRecordApp
//
//  Created by Prizega  on 22/08/23.
//

import Foundation
import UIKit

class ListParticipantRouter: PTRListParticipantProtocol{
    static func createListParticipantModule() -> ListParticipantVC {
        let view = ListParticipantVC()
        let presenter = ListParticipantPresenter()
        let interactor: PTIListParticipantProtocol = ListParticipantInteractor()
        let router : PTRListParticipantProtocol = ListParticipantRouter()
                
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
                
        interactor.presenter = presenter
        view.presenter = presenter
                
        return view
    }
    
    
}
