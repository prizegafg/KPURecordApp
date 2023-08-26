//
//  MenuProtocol.swift
//  KpuRecordApp
//
//  Created by Prizega  on 22/08/23.
//

import Foundation
import UIKit

protocol PTVMenuProtocol: AnyObject {}

protocol VTPMenuProtocol: AnyObject {
    var view: PTVMenuProtocol? {get set}
    var interactor: PTIMenuProtocol? {get set}
    var router: PTRMenuProtocol? {get set}
    
    func navToInformation(nav: UINavigationController)
    func navToFillData(nav: UINavigationController)
    func navToShowData(nav: UINavigationController)
    
    
}

protocol PTRMenuProtocol: AnyObject {
    static func createMainMenuModule() -> MenuVC
    func goToInformation(nav: UINavigationController)
    func goToFillData(nav: UINavigationController)
    func goToShowData(nav: UINavigationController)
    
    
    
}

protocol PTIMenuProtocol: AnyObject {
    var presenter: ITPMenuProtocol? {get set}
}

protocol ITPMenuProtocol: AnyObject {}
