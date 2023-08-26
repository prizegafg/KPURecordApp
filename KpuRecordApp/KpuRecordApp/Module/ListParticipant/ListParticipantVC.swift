//
//  ListParticipantVC.swift
//  KpuRecordApp
//
//  Created by Prizega  on 22/08/23.
//

import UIKit

class ListParticipantVC: UIViewController {
    @IBOutlet weak var navigation: NavigationBar!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: VTPListParticipantProtocol?
    var data : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        if let navigation = navigationController{
            presenter?.startFetchData(nav: navigation)
        }
    }
    
    func setUpView(){
        navigation.setTitle("List Participant")
        navigation.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = true
        tableView.isScrollEnabled = true
        tableView.register(ListParticipantTVC.nib(), forCellReuseIdentifier: ListParticipantTVC.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        
    }



}

extension ListParticipantVC: PTVListParticipantProtocol, NavigationBarDelegate{
    func onSuccess(data: [String]) {
        self.data = data
        self.setUpView()
    }
    
    func pressBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension ListParticipantVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListParticipantTVC.identifier, for: indexPath) as! ListParticipantTVC

        let item = data[indexPath.row]
        cell.lblTitle.text = item

        return cell
    }
}
