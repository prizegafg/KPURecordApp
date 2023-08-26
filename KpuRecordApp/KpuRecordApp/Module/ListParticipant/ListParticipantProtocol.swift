//
//  ListParticipantProtocol.swift
//  KpuRecordApp
//
//  Created by Prizega  on 22/08/23.
//

import Foundation
import UIKit

protocol PTVListParticipantProtocol: AnyObject {
    func onSuccess(data: [String])
}

protocol VTPListParticipantProtocol: AnyObject {
    var view: PTVListParticipantProtocol? {get set}
    var interactor: PTIListParticipantProtocol? {get set}
    var router: PTRListParticipantProtocol? {get set}
    
    func startFetchData(nav: UINavigationController)
    
    
}

protocol PTRListParticipantProtocol: AnyObject {
    static func createListParticipantModule() -> ListParticipantVC
    
    
    
    
}

protocol PTIListParticipantProtocol: AnyObject {
    var presenter: ITPListParticipantProtocol? {get set}
    
    func fetchData(nav: UINavigationController)
}

protocol ITPListParticipantProtocol: AnyObject {
    func onSuccess(data: [String])
}
