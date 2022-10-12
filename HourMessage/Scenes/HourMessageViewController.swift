//
//  ViewController.swift
//  hour-message
//
//  Created by Cora on 18/09/22.
//

import UIKit

class HourMessageViewController: UIViewController {
    
    private var hourMessage: HourMessage
    
    private lazy var hourMessageView: HourMessageView = {
        let view = HourMessageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(hourMessage: HourMessage = HourMessage()) {
        self.hourMessage = hourMessage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(hourMessageView)
        
        verifyPeriod(dateNow: hourMessage.getCurrentDate())
        setupConstraints()
    }
    
    func verifyPeriod(dateNow: Date) {
        let hour = Calendar.current.dateComponents([.hour], from: dateNow).hour ?? 0
        
        switch UIApplication.shared.applicationState {
        case .active:
            print("to recebendo eventos, foreground")// The app is running in the foreground and currently receiving events.
        case .inactive:
            print("to inativo")// The app is running in the foreground but is not receiving events. This might happen as a result of an interruption or because the app is transitioning to or from the background.
        case .background:
            print("to em background galera")// The app is running in the background.
        @unknown default:
            fatalError()
        }
        
        verifyIfPeriodIsMorning(hour: hour)
        verifyIfPeriodIsEvening(hour: hour)
        verifyIfPeriodIsNight(hour: hour)
        
        updateHourMessageView(message: HourMessageString.messageDawn.localized, image: "dawn")
    }
    
    func verifyIfPeriodIsMorning(hour: Int) {
        if hour >= 6 && hour < 12 {
            updateHourMessageView(message: HourMessageString.messageMorning.localized, image: "morning")
            
            return
        }
    }
    
    func verifyIfPeriodIsEvening(hour: Int) {
        if hour >= 12 && hour < 17 {
            updateHourMessageView(message: HourMessageString.messageEvening.localized, image: "evening")
            
            return
        }
    }
    
    func verifyIfPeriodIsNight(hour: Int) {
        if hour >= 17 && hour < 24 {
            updateHourMessageView(message: HourMessageString.messageNight.localized, image: "night")
            
            return
        }
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
