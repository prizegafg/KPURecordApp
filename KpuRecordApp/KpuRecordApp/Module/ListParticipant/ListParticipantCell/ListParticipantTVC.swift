//
//  ListParticipantTVC.swift
//  KpuRecordApp
//
//  Created by Prizega  on 26/08/23.
//

import UIKit

class ListParticipantTVC: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    
    static let identifier = "ListParticipantTVC"
    
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        lblTitle.text = ""
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
