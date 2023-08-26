//
//  FormEntryVC.swift
//  KpuRecordApp
//
//  Created by Prizega  on 22/08/23.
//

import UIKit
import Photos
import AVFoundation

class FormEntryVC: UIViewController {
    @IBOutlet weak var navigationBar: NavigationBar!
    @IBOutlet weak var vwNIK: InputTextField!
    @IBOutlet weak var vwName: InputTextField!
    @IBOutlet weak var vwPhoneNumber: InputTextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var vwDate: InputTextField!
    @IBOutlet weak var vwAddress: InputTextField!
    @IBOutlet weak var btnSelMale: UIButton!
    @IBOutlet weak var imgSelMale: UIImageView!
    @IBOutlet weak var lblMale: UILabel!
    @IBOutlet weak var btnSelFemale: UIButton!
    @IBOutlet weak var imgSelFemale: UIImageView!
    @IBOutlet weak var lblFemale: UILabel!
    @IBOutlet weak var btnShowLocation: UIButton!
    @IBOutlet weak var lblImage: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnCapture: UIButton!
    @IBOutlet weak var btnSelectFile: UIButton!
    @IBOutlet weak var btnSubmit: UIButton!
    
    var presenter: VTPFormEntryProtocol?
    var maps = PopUpMaps()
    
    var isMale = false
    var isFemale = false
    
    var nik: String?
    var name: String?
    var phoneNumb: String?
    var date: String?
    var address: String?
    var gender: String?
    var image: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpAction()
       
    }
    
    func setUpView(){
        self.navigationController?.isNavigationBarHidden = true
        navigationBar.setTitle("Form Entry")
        navigationBar.delegate = self
        vwNIK.setText("NIK", "Please enter your NIK")
        vwName.setText("Name", "Please enter your name")
        vwPhoneNumber.setText("Phone Number", "Please enter your phone number")
        vwDate.setText("Date", "Write today date, ex : 22-01-2023")
        vwAddress.setText("Address", "Please input your address, or select on Map")
        
        btnSelMale.setTitle("", for: .normal)
        btnSelFemale.setTitle("", for: .normal)
        
        imgSelMale.image = UIImage(named: "RadioOff")
        imgSelFemale.image = UIImage(named: "RadioOff")
        
        lblMale.text = "Male"
        lblFemale.text = "Female"
        
        btnShowLocation.setTitle("Check Location", for: .normal)
        btnCapture.setTitle("Capture Image", for: .normal)
        btnCapture.tintColor = .white
        btnCapture.backgroundColor = .blue
        btnCapture.layer.cornerRadius = 10
        btnSelectFile.setTitle("Select from File", for: .normal)
        btnSelectFile.tintColor = .white
        btnSelectFile.backgroundColor = .blue
        btnSelectFile.layer.cornerRadius = 10
        
        lblImage.text = "Image"
        
        btnSubmit.setTitle("Submit", for: .normal)
        btnSubmit.tintColor = .white
        btnSubmit.backgroundColor = .blue
        btnSubmit.layer.cornerRadius = 20
        
        
    }
    
    func setUpAction(){
        btnSelMale.addTarget(self, action: #selector(male), for: .touchUpInside)
        btnSelFemale.addTarget(self, action: #selector(female), for: .touchUpInside)
        btnShowLocation.addTarget(self, action: #selector(selectLocation), for: .touchUpInside)
        btnCapture.addTarget(self, action: #selector(capture), for: .touchUpInside)
        btnSelectFile.addTarget(self, action: #selector(selectFile), for: .touchUpInside)
        btnSubmit.addTarget(self, action: #selector(submit), for: .touchUpInside)
    }
    
    
    @objc func male(){
        if isMale == false {
            isMale = true
            isFemale = false
            imgSelMale.image = UIImage(named: "RadioOn")
            imgSelFemale.image = UIImage(named: "RadioOff")
            gender = "Male"
            print(gender)
        }
        
    }
    
    @objc func female(){
        if isFemale == false {
            isMale = false
            isFemale = true
            imgSelMale.image = UIImage(named: "RadioOff")
            imgSelFemale.image = UIImage(named: "RadioOn")
            gender = "Female"
            print(gender)
        }
        
    }
    
    @objc func selectLocation(){
        maps.modalPresentationStyle = .overCurrentContext
        maps.delegate = self
        self.present(maps, animated: true)
    }
    
    @objc func capture(){
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            present(imagePicker, animated: true, completion: nil)
        } else {
            print("Camera not available.")
        }
    }
    
    @objc func selectFile(){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @objc func submit(){
        nik = vwNIK.getEnteredText()
        name = vwName.getEnteredText()
        date = vwDate.getEnteredText()
        address = vwAddress.getEnteredText()
        phoneNumb = vwPhoneNumber.getEnteredText()
        
    }


   
}

extension FormEntryVC: PTVFormEntryProtocol{
    func success(message: String, nav: UINavigationController) {
        Alert.showGeneralAlert(title: "Success", message: message, viewController: self)
    }
    
    func failed(message: String, nav: UINavigationController) {
        Alert.showGeneralAlert(title: "Failed", message: message, viewController: self)
    }
    
    
}

extension FormEntryVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        if let selectedImage = info[.originalImage] as? UIImage {
            image = imageToString(selectedImage)
            imgView.image = selectedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

extension FormEntryVC: NavigationBarDelegate, PopUpMapsDelegate{
    func pressBack() {
        self.navigationController!.popViewController(animated: true)
    }
    
    func actConfirm(loc: String) {
        address = loc
        vwAddress.setInputText(text: loc)
        self.dismiss(animated: true)
    }
    
    func actBack() {
        self.dismiss(animated: true)
    }
    
    
    
}
