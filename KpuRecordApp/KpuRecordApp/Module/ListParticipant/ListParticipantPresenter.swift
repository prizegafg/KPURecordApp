//
//  ListParticipantPresenter.swift
//  KpuRecordApp
//
//  Created by Prizega  on 22/08/23.
//

import Foundation
import UIKit

class ListParticipantPresenter: VTPListParticipantProtocol{
    var view: PTVListParticipantProtocol?
    var interactor: PTIListParticipantProtocol?
    var router: PTRListParticipantProtocol?
    
    func startFetchData(nav: UINavigationController) {
        interactor?.fetchData(nav: nav)
    }
    
    
    
}

extension ListParticipantPresenter: ITPListParticipantProtocol{
    func onSuccess(data: [String]) {
        view?.onSuccess(data: data)
    }
    
    
}
