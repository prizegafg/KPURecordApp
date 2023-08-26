//
//  InputTextField.swift
//  KpuRecordApp
//
//  Created by Prizega  on 25/08/23.
//

import Foundation
import UIKit

class InputTextField: UIView{
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtInput: UITextField!
    
    let screenSize:CGRect = UIScreen.main.bounds
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func loadViewFromNib(nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }

    private func setupView() {
        guard let view = self.loadViewFromNib(nibName: "InputTextField") else{ return }
        addSubview(view)

        // Configure constraints
        // ...

        // Customize appearance
        lblTitle.text = "Enter Text:"
        txtInput.borderStyle = .roundedRect
    }

    // Exposed methods to configure the text field
    func setPlaceholder(_ placeholder: String) {
        txtInput.placeholder = placeholder
    }

    // Method to set a custom lblTitle text
    func setText(_ text: String, _ placeholder: String) {
        lblTitle.text = text
        txtInput.placeholder = placeholder
    }
    
    func setInputText(text: String){
        txtInput.text = text
    }


    // Method to retrieve entered text from the text field
    func getEnteredText() -> String? {
        return txtInput.text
    }
    

}
