//
//  SecondViewController.swift
//  UIKit2
//
//  Created by Dave Brunner on 15.10.21.
//

import UIKit



class SecondViewController: ViewController {
    
    
    @IBOutlet weak var numberLabel: UILabel!
    var number : Int = 0
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.numberLabel.text = "Nr. " + String(self.number)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func ShowXipViewPressed(_ sender: Any) {
        self.present(XibViewController(nibName: "XibViewController", bundle: nil), animated: true, completion: nil)
    }
    
    @IBAction func BackToRootPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func ShowAnotherViewPressed(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! SecondViewController
        secondVC.number = self.number+1;
        //secondVC.numberLabel.text = number as String
    }
    
}
