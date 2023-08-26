//
//  DataDetailVC.swift
//  KpuRecordApp
//
//  Created by Prizega  on 22/08/23.
//

import UIKit

class DataDetailVC: UIViewController {
    @IBOutlet weak var navigation: NavigationBar!
    @IBOutlet weak var vwNIK: ListLabel!
    @IBOutlet weak var vwName: ListLabel!
    @IBOutlet weak var vwPhoneNumb: ListLabel!
    @IBOutlet weak var vwGender: ListLabel!
    @IBOutlet weak var vwDate: ListLabel!
    @IBOutlet weak var vwAddress: ListLabel!
    @IBOutlet weak var vwImage: ListLabel!
    @IBOutlet weak var imgData: UIImageView!
    
    var presenter: VTPDataDetailProtocol?
    
    var nik: String?
    var name: String?
    var phoneNumb: String?
    var date: String?
    var address: String?
    var gender: String?
    var image: String?
    
    var data: DataDetailModule?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView(){
        self.navigationController?.isNavigationBarHidden = true
        navigation.setTitle("Data Detail")
        navigation.delegate.self
        vwNIK.setDetail("NIK", nik ?? "1201230")
        vwName.setDetail("Name", name ?? "jokko")
        vwPhoneNumb.setDetail("Phone Number", phoneNumb ?? "0812121")
        vwGender.setDetail("Gender", gender ?? "Male")
        vwDate.setDetail("Date", date ?? "12 / 03 /2023")
        vwAddress.setDetail("Address", address ?? "Katanya Sleman")
        vwImage.setTitle("Image")
        if let decodedImage = stringToImage(image ?? "") {
            imgData.image = decodedImage
        }
    }
    
    

}

extension DataDetailVC: PTVDataDetailProtocol, NavigationBarDelegate{
    func pressBack() {
        self.navigationController!.popViewController(animated: true)
    }
    
    
}


