//
//  FormEntryProtocol.swift
//  KpuRecordApp
//
//  Created by Prizega  on 22/08/23.
//

import Foundation
import UIKit

protocol PTVFormEntryProtocol: AnyObject {
    func success(message: String)
    func failed(message: String)
    func alreadyInput(data: formEntryModel)
    func notInput()
}

protocol VTPFormEntryProtocol: AnyObject {
    var view: PTVFormEntryProtocol? {get set}
    var interactor: PTIFormEntryProtocol? {get set}
    var router: PTRFormEntryProtocol? {get set}
    
    func startFetchData(data: formEntryModel, nav: UINavigationController)
    func startReadData(nav: UINavigationController)
    func startUpdateData(data: formEntryModel, nav: UINavigationController)
    
    
}

protocol PTRFormEntryProtocol: AnyObject {
    static func createFormEntryModule() -> FormEntryVC
    func goToMenu(nav: UINavigationController)
    
    
    
    
}

protocol PTIFormEntryProtocol: AnyObject {
    var presenter: ITPFormEntryProtocol? {get set}
    
    func fetchData(data: formEntryModel, nav: UINavigationController)
    func readData(nav: UINavigationController)
    func updateData(data: formEntryModel, nav: UINavigationController)
    
}

protocol ITPFormEntryProtocol: AnyObject {
    func onSuccess(message: String)
    func onFailed(message: String)
    func onAlreadyInput(data: formEntryModel)
    func onNotInput()
}
