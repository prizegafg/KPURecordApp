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
    
    var data = formEntryModel()
    var isInputted: Bool?
    
    
    func fetchData(data: formEntryModel, nav: UINavigationController) {
        var nik = data.nik
        var name = data.name
        var phoneNumb = data.phoneNumb
        var address = data.address
        var date = data.date
        var image = data.image
        var gender = data.gender
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        if let entityDescription = NSEntityDescription.entity(forEntityName: "KPURecord", in: context) {
            let item = KPURecord(entity: entityDescription, insertInto: context)
            item.nik = nik
            item.name = name
            item.phoneNumber = phoneNumb
            item.gender = gender
            item.address = address
            item.date = date
            item.image = image

            do {
                try context.save()
                presenter?.onSuccess(message: "Success Save Data")
            } catch {
                presenter?.onFailed(message: "Failed Save Data")
            }
        }
    }
    
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
                
                presenter?.onAlreadyInput(data: data)
            }
        } catch {
            presenter?.onNotInput()
            
            
        }
    }
    
    
    
    func updateData(data: formEntryModel, nav: UINavigationController) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedObjectContext = appDelegate.persistentContainer.viewContext

        // Fetch the data to update
        let fetchRequest: NSFetchRequest<KPURecord> = KPURecord.fetchRequest()
               
        do {
            let fetchedResults = try managedObjectContext.fetch(fetchRequest)
                if let objectToUpdate = fetchedResults.first {
                    // Update attributes of the object
                    objectToUpdate.nik = data.nik
                    objectToUpdate.name = data.name
                    objectToUpdate.address = data.address
                    objectToUpdate.gender = data.gender
                    objectToUpdate.phoneNumber = data.phoneNumb
                    objectToUpdate.date = data.date
                    objectToUpdate.image = data.image
                    objectToUpdate.inputted = data.inputted ?? true
                    
                    // Save the changes
                    try managedObjectContext.save()
                    presenter?.onSuccess(message: "Success Update Data")
                }
            
        } catch {
            presenter?.onFailed(message: "Failed Update Data")
            
        }
        
    }
    
}
    
    

