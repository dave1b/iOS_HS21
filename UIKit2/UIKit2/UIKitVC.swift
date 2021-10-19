//
//  UIKitVC.swift
//  UIKit2
//
//  Created by Dave Brunner on 16.10.21.
//

import SwiftUI

struct UIKitVC: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: XibViewController, context: Context ) {
    }
    func makeUIViewController(context: Context) -> XibViewController  {
        return XibViewController(nibName: "XibViewController", bundle: nil)
    }
}
