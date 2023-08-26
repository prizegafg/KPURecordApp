//
//  MenuPresenter.swift
//  KpuRecordApp
//
//  Created by Prizega  on 22/08/23.
//

import Foundation
import UIKit

class MenuPresenter: VTPMenuProtocol{
    var view: PTVMenuProtocol?
    var interactor: PTIMenuProtocol?
    var router: PTRMenuProtocol?
    
    func navToInformation(nav: UINavigationController) {
        router?.goToInformation(nav: nav)
    }
    
    func navToFillData(nav: UINavigationController) {
        router?.goToFillData(nav: nav)
    }
    
    func navToShowData(nav: UINavigationController) {
        router?.goToShowData(nav: nav)
    }
    
    
}

extension MenuPresenter: ITPMenuProtocol{
    
}
