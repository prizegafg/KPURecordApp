//
//  DataDetailProtocol.swift
//  KpuRecordApp
//
//  Created by Prizega  on 22/08/23.
//

import Foundation
import UIKit

protocol PTVDataDetailProtocol: AnyObject {}

protocol VTPDataDetailProtocol: AnyObject {
    var view: PTVDataDetailProtocol? {get set}
    var interactor: PTIDataDetailProtocol? {get set}
    var router: PTRDataDetailProtocol? {get set}
    
    
}

protocol PTRDataDetailProtocol: AnyObject {
    static func createDataDetailModule() -> DataDetailVC
    
    
    
    
}

protocol PTIDataDetailProtocol: AnyObject {
    var presenter: ITPDataDetailProtocol? {get set}
}

protocol ITPDataDetailProtocol: AnyObject {}
