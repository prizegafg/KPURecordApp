//
//  ListParticipantProtocol.swift
//  KpuRecordApp
//
//  Created by Prizega  on 22/08/23.
//

import Foundation
import UIKit

protocol PTVListParticipantProtocol: AnyObject {}

protocol VTPListParticipantProtocol: AnyObject {
    var view: PTVListParticipantProtocol? {get set}
    var interactor: PTIListParticipantProtocol? {get set}
    var router: PTRListParticipantProtocol? {get set}
    
    
}

protocol PTRListParticipantProtocol: AnyObject {
    static func createListParticipantModule() -> ListParticipantVC
    
    
    
    
}

protocol PTIListParticipantProtocol: AnyObject {
    var presenter: ITPListParticipantProtocol? {get set}
}

protocol ITPListParticipantProtocol: AnyObject {}
