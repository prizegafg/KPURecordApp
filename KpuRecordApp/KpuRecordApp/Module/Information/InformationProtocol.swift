//
//  InformationProtocol.swift
//  KpuRecordApp
//
//  Created by Prizega  on 22/08/23.
//

import Foundation
import UIKit

protocol PTVInformationProtocol: AnyObject {}

protocol VTPInformationProtocol: AnyObject {
    var view: PTVInformationProtocol? {get set}
    var interactor: PTIInformationProtocol? {get set}
    var router: PTRInformationProtocol? {get set}
    
    
}

protocol PTRInformationProtocol: AnyObject {
    static func createInformationModule() -> InformationVC
    
    
    
    
}

protocol PTIInformationProtocol: AnyObject {
    var presenter: ITPInformationProtocol? {get set}
}

protocol ITPInformationProtocol: AnyObject {}
