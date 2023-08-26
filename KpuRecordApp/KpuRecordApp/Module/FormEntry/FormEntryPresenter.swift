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
        
    }
    
    
    
}

extension FormEntryPresenter: ITPFormEntryProtocol{
    func onSuccess(message: String, nav: UINavigationController) {
        
    }
    
    func onFailed(message: String, nav: UINavigationController) {
        
    }
    
    
}
