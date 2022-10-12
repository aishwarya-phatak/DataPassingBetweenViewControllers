//
//  ViewController.swift
//  DataPassing
//
//  Created by Vishal Jagtap on 14/09/22.
//

import UIKit

class ViewController: UIViewController, BackDataPassingProtocol{              //backward 4

    @IBOutlet weak var textFieldOnFirstViewController: UITextField!
    
    @IBOutlet weak var dataLabelOnFirstViewController: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textFieldOnFirstViewController.text = ""
    }

    @IBAction func btnClickToNavgiateToSecondViewController(_ sender: Any) {
        
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        let dataToBePassed = self.textFieldOnFirstViewController.text  //forward 1
        secondViewController.dataFromFirstViewController = dataToBePassed                      //forward 3
        
        secondViewController.delegateSVC = self //backward 6
        
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    func passData(textToPass: String?) {         //backward 5
        self.dataLabelOnFirstViewController.text = textToPass
    }
}
