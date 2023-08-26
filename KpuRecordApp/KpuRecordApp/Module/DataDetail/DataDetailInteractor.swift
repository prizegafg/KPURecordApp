//
//  DataDetailInteractor.swift
//  KpuRecordApp
//
//  Created by Prizega  on 22/08/23.
//

import Foundation
import UIKit
import CoreData

class DataDetailInteractor: PTIDataDetailProtocol{
    var presenter: ITPDataDetailProtocol?
    
    var data = DataDetailModel()
    
    func readData(nav: UINavigationController) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<KPURecord> = KPURecord.fetchRequest()
        do {
            let fetchedData = try managedObjectContext.fetch(fetchRequest)
            for object in fetchedData {
                data.nik = object.nik
                data.name = object.name
                data.address = object.address
                data.gender = object.gender
                data.phoneNumb = object.phoneNumber
                data.date = object.date
                data.image = object.image
                data.inputted = object.inputted
                
                presenter?.onSuccessRead(data: data)
            }
        } catch {
            presenter?.onFailed(message: "Error Read Data")
            
            
        }
    }
    
    func deleteData(nav: UINavigationController) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<KPURecord> = KPURecord.fetchRequest()
        do {
            let fetchedResults = try managedObjectContext.fetch(fetchRequest)
            // Delete the fetched objects
            for object in fetchedResults {
                managedObjectContext.delete(object)
            }
            
            // Save the changes
            try managedObjectContext.save()
            presenter?.onSuccessDelete(message: "Success Delete Data")
        } catch {
            presenter?.onFailed(message: "Error Delete Data")
        }
    }
    
    
}
