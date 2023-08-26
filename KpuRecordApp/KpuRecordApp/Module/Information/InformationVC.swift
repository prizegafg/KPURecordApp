//
//  InformationVC.swift
//  KpuRecordApp
//
//  Created by Prizega  on 22/08/23.
//

import UIKit

class InformationVC: UIViewController {
    var presenter: VTPInformationProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

    }


}

extension InformationVC: PTVInformationProtocol{
    
}
