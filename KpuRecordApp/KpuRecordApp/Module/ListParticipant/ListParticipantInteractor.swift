//
//  ListParticipantInteractor.swift
//  KpuRecordApp
//
//  Created by Prizega  on 22/08/23.
//

import Foundation
import UIKit
import CoreData

class ListParticipantInteractor: PTIListParticipantProtocol{
    var presenter: ITPListParticipantProtocol?
    
    var data: [String] = []
    var dataNIK: [String] = []
    
    func fetchData(nav: UINavigationController) {
        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else {
            return
        }

        let fetchRequest: NSFetchRequest<KPURecord> = KPURecord.fetchRequest() // Replace with your managed object class

        do {
            let fetchedData = try context.fetch(fetchRequest)
            data = fetchedData.compactMap { $0.name }
            dataNIK = fetchedData.compactMap { $0.nik}
            
            presenter?.onSuccess(data: data)// Replace with your attribute name
            
        } catch {
            print("Error fetching data: \(error)")
        }
    }
    
    
    
    
}
