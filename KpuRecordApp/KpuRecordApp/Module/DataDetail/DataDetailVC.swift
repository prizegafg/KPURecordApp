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
    @IBOutlet weak var btnUpdate: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    
    var presenter: VTPDataDetailProtocol?
    
    var nik: String?
    var name: String?
    var phoneNumb: String?
    var date: String?
    var address: String?
    var gender: String?
    var imageData: String?
    var isInputted: Bool?
    
    var data: DataDetailModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        setUpAction()
    }
    
    func setUpView(){
        if let navigation = navigationController{
            presenter?.startReadData(nav: navigation)
        }
        self.navigationController?.isNavigationBarHidden = true
        navigation.setTitle("Data Detail")
        navigation.delegate = self
        btnUpdate.setTitle("Update Data", for: .normal)
        btnDelete.setTitle("Delete Data", for: .normal)
        
        btnUpdate.tintColor = .white
        btnDelete.tintColor = .white
        btnUpdate.backgroundColor = .blue
        btnDelete.backgroundColor = .blue
        
        btnUpdate.layer.cornerRadius = 20
        btnDelete.layer.cornerRadius = 20
        btnUpdate.isHidden = true
    }
    
    func setUpAction(){
        btnUpdate.addTarget(self, action: #selector(updateData), for: .touchUpInside)
        btnDelete.addTarget(self, action: #selector(deleteData), for: .touchUpInside)
    }
    
    @objc func updateData(){
        
    }
    
    @objc func deleteData(){
        if let navigation = navigationController{
            presenter?.startDeleteData(nav: navigation)
        }
    }
    
    

}

extension DataDetailVC: PTVDataDetailProtocol, NavigationBarDelegate{
    func successRead(data: DataDetailModel) {
        nik = data.nik
        name = data.name
        phoneNumb = data.phoneNumb
        date = data.date
        address = data.address
        gender = data.gender
        imageData = data.image
        isInputted = data.inputted ?? true
        
        vwNIK.setDetail("NIK", nik ?? "1201230")
        vwName.setDetail("Name", name ?? "jokko")
        vwPhoneNumb.setDetail("Phone Number", phoneNumb ?? "0812121")
        vwGender.setDetail("Gender", gender ?? "Male")
        vwDate.setDetail("Date", date ?? "12 / 03 /2023")
        vwAddress.setDetail("Address", address ?? "Katanya Sleman")
        vwImage.setTitle("Image")
        if let decodedImage = stringToImage(imageData ?? "") {
            imgData.image = decodedImage
        }
    }
    
    func successDelete(message: String) {
        Alert.showGeneralAlert(title: "Success Delete", message: message, viewController: self)
        if let navigation = navigationController{
            presenter?.goToHome(nav: navigation)
        }
        
        
    }
    
    func failed(message: String) {
        Alert.showGeneralAlert(title: "Error", message: message, viewController: self)
    }
    
    func pressBack() {
        print("back button pressed")
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
}


