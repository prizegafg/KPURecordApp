//
//  DataDetailProtocol.swift
//  KpuRecordApp
//
//  Created by Prizega  on 22/08/23.
//

import Foundation
import UIKit

protocol PTVDataDetailProtocol: AnyObject {
    func successRead(data: DataDetailModel)
    func successDelete(message: String)
    func failed(message: String)
}

protocol VTPDataDetailProtocol: AnyObject {
    var view: PTVDataDetailProtocol? {get set}
    var interactor: PTIDataDetailProtocol? {get set}
    var router: PTRDataDetailProtocol? {get set}
    
    func startReadData(nav: UINavigationController)
    func startDeleteData(nav: UINavigationController)
    func goToHome(nav: UINavigationController)
    
    
}

protocol PTRDataDetailProtocol: AnyObject {
    static func createDataDetailModule() -> DataDetailVC
    func goToHome(nav: UINavigationController)
    
    
    
    
}

protocol PTIDataDetailProtocol: AnyObject {
    var presenter: ITPDataDetailProtocol? {get set}
    func readData(nav: UINavigationController)
    func deleteData(nav: UINavigationController)
}

protocol ITPDataDetailProtocol: AnyObject {
    func onSuccessRead(data: DataDetailModel)
    func onSuccessDelete(message: String)
    func onFailed(message: String)
}
