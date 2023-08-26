//
//  FormEntryProtocol.swift
//  KpuRecordApp
//
//  Created by Prizega  on 22/08/23.
//

import Foundation
import UIKit

protocol PTVFormEntryProtocol: AnyObject {
    func success(message: String, nav: UINavigationController)
    func failed(message: String, nav: UINavigationController)
}

protocol VTPFormEntryProtocol: AnyObject {
    var view: PTVFormEntryProtocol? {get set}
    var interactor: PTIFormEntryProtocol? {get set}
    var router: PTRFormEntryProtocol? {get set}
    
    func startFetchData(data: formEntryModel, nav: UINavigationController)
    
    
}

protocol PTRFormEntryProtocol: AnyObject {
    static func createFormEntryModule() -> FormEntryVC
    func goToMenu(nav: UINavigationController)
    
    
    
    
}

protocol PTIFormEntryProtocol: AnyObject {
    var presenter: ITPFormEntryProtocol? {get set}
    
    func fetchData(data: formEntryModel, nav: UINavigationController)
    
}

protocol ITPFormEntryProtocol: AnyObject {
    func onSuccess(message: String, nav: UINavigationController)
    func onFailed(message: String, nav: UINavigationController)
}
