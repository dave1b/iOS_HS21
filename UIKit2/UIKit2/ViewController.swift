//
//  ViewController.swift
//  UIKit2
//
//  Created by Dave Brunner on 15.10.21.
//

import UIKit
import SwiftUI
class ViewController: UIViewController {

 
    @IBOutlet weak var TitleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func ShowSecondViewPressed(_ sender: Any) {
    }
    

    @IBAction func ShowSwiftUIViewPressed(_ sender: Any) {
        let swiftUIVC = UIHostingController(rootView: ContentView())
        self.present(swiftUIVC, animated: true)
    }
    
    
    
    
}




