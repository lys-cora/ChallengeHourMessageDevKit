//
//  ViewController.swift
//  hour-message
//
//  Created by Cora on 18/09/22.
//

import UIKit

class HourMessageViewController: UIViewController {
    
    var morning: Bool?
    var evening: Bool?
    var night: Bool?
    var dateNow: Date?
    var hourMessageProtocol: HourMessageProtocol
    
    private lazy var hourMessageView: HourMessageView = {
        let view = HourMessageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(hourMessageProtocol: HourMessageProtocol) {
        self.hourMessageProtocol = hourMessageProtocol
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(hourMessageView)
        
        verifyPeriod(dateNow: dateNow ?? Date.now)
        
        setupConstraints()
    }
    
    func verifyPeriod(dateNow: Date) {
        let hour = Calendar.current.dateComponents([.hour, .minute, .second], from: dateNow).hour ?? 0
        verifyHour(hour: hour)
        
        if morning ?? false {
            updateHourMessageView(message: HourMessageString.messageMorning.localized, image: "morning")
            
            return
        }
        
        if evening ?? false {
            updateHourMessageView(message: HourMessageString.messageEvening.localized, image: "evening")
            
            return
        }
        
        if night ?? false {
            updateHourMessageView(message: HourMessageString.messageNight.localized, image: "night")
            
            return
        }
        
        updateHourMessageView(message: HourMessageString.messageDawn.localized, image: "dawn")
    }
    
    func verifyHour(hour: Int) {
        morning = hour >= 6 && hour < 12
        evening = hour >= 12 && hour < 18
        night = hour >= 18 && hour < 24
        
    }
    
    func updateHourMessageView(message: String, image: String) {
        hourMessageView.messageLabel.text = message
        hourMessageView.image.image = UIImage(named: image)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            hourMessageView.topAnchor.constraint(equalTo: view.topAnchor),
            hourMessageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hourMessageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hourMessageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

    }
}
