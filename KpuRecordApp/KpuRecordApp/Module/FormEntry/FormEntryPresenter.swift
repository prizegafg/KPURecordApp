//
//  FormEntryPresenter.swift
//  KpuRecordApp
//
//  Created by Prizega  on 22/08/23.
//

import Foundation
import UIKit

class FormEntryPresenter: VTPFormEntryProtocol{
    var view: PTVFormEntryProtocol?
    var interactor: PTIFormEntryProtocol?
    var router: PTRFormEntryProtocol?
    
    func startFetchData(data: formEntryModel, nav: UINavigationController) {
        interactor?.fetchData(data: data, nav: nav)
    }
    
    func startReadData(nav: UINavigationController){
        interactor?.readData(nav: nav)
    }
    
    func startUpdateData(data: formEntryModel, nav: UINavigationController) {
        interactor?.updateData(data: data, nav: nav)
    }
    
    
    
    
}

extension FormEntryPresenter: ITPFormEntryProtocol{
    func onSuccess(message: String) {
        view?.success(message: message)
    }
    
    func onFailed(message: String) {
        view?.failed(message: message)
        
    }
    
    func onAlreadyInput(data: formEntryModel) {
        view?.alreadyInput(data: data)
    }
    
    func onNotInput() {
        view?.notInput()
    }
    
    
}
