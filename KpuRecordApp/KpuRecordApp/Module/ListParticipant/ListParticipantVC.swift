//
//  ListParticipantVC.swift
//  KpuRecordApp
//
//  Created by Prizega  on 22/08/23.
//

import UIKit

class ListParticipantVC: UIViewController {
    
    var presenter: VTPListParticipantProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }



}

extension ListParticipantVC: PTVListParticipantProtocol{
    
}
