//
//  SubmitEventsViewController.swift
//  FoodTruck
//
//  Created by Jada White on 6/29/21.
//

import UIKit
import EventKitUI

class SubmitEventsViewController: UIViewController, EKEventViewDelegate, EKCalendarChooserDelegate {
    
    // Stores system calendar access request
    let store = EKEventStore()
    
    private func requestCalendarAccess(completion: @escaping EKEventStoreRequestAccessCompletionHandler) {
        // Request access to reminders.
        store.requestAccess(to: .reminder) { granted, error in
            // Handle the response to the request.
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add event button
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
//        self.dismiss(animated: true, completion: nil)

    }
    
    @objc func didTapAdd() {
        // Allows user to choose calendars stored on their phone
//        let viewCtrl = EKCalendarChooser()
//        viewCtrl.showsDoneButton = true
//        viewCtrl.showsCancelButton = true
//        // Make done and cancel buttons to work
//        viewCtrl.delegate = self
//        present(UINavigationController(rootViewController: viewCtrl), animated: true)
        
        // Request user access to calendar data
        // Weak self -- prevents memory leakage
        store.requestAccess(to: .event) { [weak self] success, error in
            if success, error == nil {
                DispatchQueue.main.async {
                    guard let store = self?.store else { return }
                    
                    // New event will get stored on the device
                    let newEvent = EKEvent(eventStore: store)
                    
                    // Event properties
                    newEvent.title = ""
                    newEvent.startDate = Date()
                    newEvent.endDate = Date()
                    newEvent.location = ""
                    
                    let viewCtrl = EKEventEditViewController()
                    viewCtrl.eventStore = store
                    // New event -- no info to show upon opening
                    viewCtrl.event = newEvent
                    self?.present(viewCtrl, animated: true, completion: nil)
                    
                    do {
                      try store.save(newEvent, span: .thisEvent)
                    } catch {
                        print("Error when saving event: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
    
    func eventViewController(_ controller: EKEventViewController, didCompleteWith action: EKEventViewAction) {
        // Dismisses modal view of adding event
        controller.dismiss(animated: true, completion: nil)
    }
    
}
