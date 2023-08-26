//
//  MenuVC.swift
//  KpuRecordApp
//
//  Created by Prizega  on 22/08/23.
//

import UIKit

class MenuVC: UIViewController {
    @IBOutlet weak var btnInformation: UIButton!
    @IBOutlet weak var btnFormEntry: UIButton!
    @IBOutlet weak var btnListData: UIButton!
    @IBOutlet weak var btnExit: UIButton!
    
    var presenter: VTPMenuProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpAction()
        
    }
    
    func setUpView(){
        self.navigationController?.isNavigationBarHidden = true
        btnInformation.setTitle("Information", for: .normal)
        btnFormEntry.setTitle("Form Entry", for: .normal)
        btnListData.setTitle("Show Data", for: .normal)
        btnExit.setTitle("Exit", for: .normal)
        
        btnInformation.backgroundColor = UIColor.blue
        btnFormEntry.backgroundColor = UIColor.blue
        btnListData.backgroundColor = UIColor.blue
        btnExit.backgroundColor = UIColor.blue
        
        btnInformation.layer.cornerRadius = 20
        btnFormEntry.layer.cornerRadius = 20
        btnListData.layer.cornerRadius = 20
        btnExit.layer.cornerRadius = 20
        
        
        btnInformation.tintColor = UIColor.white
        btnFormEntry.tintColor = UIColor.white
        btnListData.tintColor = UIColor.white
        btnExit.tintColor = UIColor.white
        
        
    }

    func setUpAction(){
        btnInformation.addTarget(self, action: #selector(infoPress), for: .touchUpInside)
        btnFormEntry.addTarget(self, action: #selector(formEntryPress), for: .touchUpInside)
        btnListData.addTarget(self, action: #selector(listDataPress), for: .touchUpInside)
        btnExit.addTarget(self, action: #selector(exitPress), for: .touchUpInside)
        
    }
    
    @objc func infoPress(){
        if let navigation = navigationController{
            presenter?.navToInformation(nav: navigation)
        }
    }
    
    @objc func formEntryPress(){
        if let navigation = navigationController{
            presenter?.navToFillData(nav: navigation)
        }
    }
    
    @objc func listDataPress(){
        if let navigation = navigationController{
            presenter?.navToShowData(nav: navigation)
        }
    }
    
    @objc func exitPress(){
        let exitConfirmation = UIAlertController(title: "Exit", message: "Are you sure you want to exit?", preferredStyle: .alert)
                
            let confirmAction = UIAlertAction(title: "Confirm", style: .default) { _ in
            // Perform any cleanup or tasks if needed
            UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
            // This will suspend the app, which is similar to putting it in the background
            }
                
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                
            exitConfirmation.addAction(confirmAction)
            exitConfirmation.addAction(cancelAction)
                
            present(exitConfirmation, animated: true, completion: nil)
    }
    
    

}

extension MenuVC: PTVMenuProtocol{
    
}
