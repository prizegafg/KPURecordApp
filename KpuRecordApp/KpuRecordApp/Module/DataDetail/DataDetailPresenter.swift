//
//  DataDetailPresenter.swift
//  KpuRecordApp
//
//  Created by Prizega  on 22/08/23.
//

import Foundation
import UIKit

class DataDetailPresenter: VTPDataDetailProtocol{
    var view: PTVDataDetailProtocol?
    var interactor: PTIDataDetailProtocol?
    var router: PTRDataDetailProtocol?
    
    func startReadData(nav: UINavigationController) {
        interactor?.readData(nav: nav)
    }
    
    func startDeleteData(nav: UINavigationController) {
        interactor?.deleteData(nav: nav)
    }
    
    func goToHome(nav: UINavigationController) {
        router?.goToHome(nav: nav)
    }
    
    
    
    
    
}

extension DataDetailPresenter: ITPDataDetailProtocol{
    func onSuccessRead(data: DataDetailModel) {
        view?.successRead(data: data)
    }
    
    func onSuccessDelete(message: String) {
        view?.successDelete(message: message)
    }
    
    func onFailed(message: String) {
        view?.failed(message: message)
    }
    
    
}
