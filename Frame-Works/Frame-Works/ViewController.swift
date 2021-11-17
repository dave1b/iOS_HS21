//
//  ViewController.swift
//  Frame-Works
//
//  Created by Dave Brunner on 16.11.21.
//

import UIKit
import MapKit
import ContactsUI
import Contacts
import EventKitUI
import EventKit


class ViewController: UIViewController, EKEventEditViewDelegate, MKMapViewDelegate, CNContactPickerDelegate {
    let hsluAnnotation = MKPointAnnotation()
    func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
        //nothing
    }
    
    
    @IBOutlet weak var contactLabel: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contactLabel.text = ""
        self.lastNameLabel.text = ""
        
        
        hsluAnnotation.coordinate = CLLocationCoordinate2DMake(47.138618, 8.430880)
        hsluAnnotation.title = "HSLU"
        hsluAnnotation.subtitle = "Departement Informatik"
        self.mapView.addAnnotation(hsluAnnotation)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func getPersonButtonPressed(_ sender: UIButton) {
        let contactPicker = CNContactPickerViewController()
        contactPicker.delegate = self
        self.present(contactPicker, animated: true, completion: nil)
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact){
        self.contactLabel.text = contact.givenName
        self.lastNameLabel.text = contact.familyName
    }
    
    func eventViewController(controller: EKEvent, didComleteWith action: EKEventViewAction){
        
    }
    
    @IBAction func editEventButtonPressed(_ sender: UIButton) {
        switch EKEventStore.authorizationStatus(for: .event) {
        case .notDetermined:
            let eventStore = EKEventStore()
            eventStore.requestAccess(to: .event) { (granted, error) in
                if granted {
                    // watch out this is running in background
                    DispatchQueue.main.async {
                        self.openEventController()
                    }
                }
            }
        case .authorized:
            
            let eventVC = EKEventEditViewController()
            eventVC.editViewDelegate = self
            eventVC.eventStore = EKEventStore()
            
            let predicate = eventVC.eventStore.predicateForEvents(withStart: Date(), end: Date.distantFuture, calendars: nil)
            let events = eventVC.eventStore.events(matching: predicate)
            eventVC.event = events[0]
            
            self.present(eventVC, animated: true)
        default:
            break
        }
        
    }
    
    func openEventController() {
        
        let eventVC = EKEventEditViewController()
        eventVC.editViewDelegate = self
        eventVC.eventStore = EKEventStore()
        
        let predicate = eventVC.eventStore.predicateForEvents(withStart: Date(), end: Date.distantFuture, calendars: nil)
        let events = eventVC.eventStore.events(matching: predicate)
        eventVC.event = events[0]
        
        self.present(eventVC, animated: true)
    }
    
    @IBAction func showHSLUButtonPressed(_ sender: UIButton) {
        let mapEdgePadding = UIEdgeInsets(top: 100, left: 100, bottom: 100, right: 100)
        var zoomRect:MKMapRect = MKMapRect.null
        let annotation = hsluAnnotation
        let aPoint : MKMapPoint = MKMapPoint(annotation.coordinate)
        let rect : MKMapRect = MKMapRect(x: aPoint.x, y: aPoint.y, width: 1, height: 1)
        if zoomRect.isNull {
            zoomRect = rect
        } else {
            zoomRect = zoomRect.union(rect)
        }
        self.mapView.setVisibleMapRect(zoomRect, edgePadding: mapEdgePadding, animated: true)
    }
}

