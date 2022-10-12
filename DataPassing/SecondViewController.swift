//
//  SecondViewController.swift
//  DataPassing
//
//  Created by Vishal Jagtap on 14/09/22.
//

import UIKit

protocol BackDataPassingProtocol{          //backward 1
    func passData(textToPass : String?)
}

class SecondViewController: UIViewController {

    @IBOutlet weak var dataLabelOnSecondViewController: UILabel!
    
    @IBOutlet weak var textFieldOnSecondViewController: UITextField!
    
    var delegateSVC : BackDataPassingProtocol?               //backward 2
    var dataFromFirstViewController : String?                //forward 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataLabelOnSecondViewController.text = dataFromFirstViewController
        //forward 4
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func btnClickToNavigateToFirstViewController(_ sender: Any) {
        guard let delegate = delegateSVC else {                 //backward 3
            print("The object of delegateSVC is not created")
            return
        }
        
      let textRetrivedFromTextFieldOnSVC = self.textFieldOnSecondViewController.text
        delegate.passData(textToPass: textRetrivedFromTextFieldOnSVC)
        
        self.navigationController?.popViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
