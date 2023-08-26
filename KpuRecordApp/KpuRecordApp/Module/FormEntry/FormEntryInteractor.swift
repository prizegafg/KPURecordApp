//
//  FormEntryInteractor.swift
//  KpuRecordApp
//
//  Created by Prizega  on 22/08/23.
//

import Foundation
import UIKit
import CoreData

class FormEntryInteractor: PTIFormEntryProtocol{
    var presenter: ITPFormEntryProtocol?
    
    
    func fetchData(data: formEntryModel, nav: UINavigationController) {
        var nik = data.nik
        var name = data.name
        var phoneNumb = data.phoneNumb
        var address = data.address
        var date = data.date
        var image = data.image
        var gender = data.gender
        
//        private lazy var persistentContainer: NSPersistentContainer = {
//                NSPersistentContainer(name: "KPURecord")
//        }()
//        
//        
//        let context = CoreDataStack.shared.managedContext
//        let data =
    }
    
    
}
