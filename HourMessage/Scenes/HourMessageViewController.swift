//
//  ViewController.swift
//  hour-message
//
//  Created by Cora on 18/09/22.
//

import UIKit

enum Period {
    case morning
    case evening
    case night
    case dawn
    case notFound
}

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
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(hourMessageView)
        
        verifyPeriod()
        setupConstraints()
        
        NotificationCenter.default.addObserver(self, selector: #selector(callVerifyPeriod), name: UIApplication.willEnterForegroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(printScreen), name: UIApplication.userDidTakeScreenshotNotification, object: nil)
    }
    
    @objc func printScreen() {
        print("printou")
    }
    
    @objc func callVerifyPeriod() {
        verifyPeriod()
    }
    
    @discardableResult func verifyPeriod() -> Period {
        let hour = Calendar.current.dateComponents([.hour], from: hourMessage.getCurrentDate()).hour ?? 0

        print("rodando função")
        
        if isMorning(hour: hour) {
            updateHourMessageView(message: HourMessageString.messageMorning.localized, image: "morning")
            return .morning
        } else if isEvening(hour: hour) {
            updateHourMessageView(message: HourMessageString.messageEvening.localized, image: "evening")
            return .evening
        } else if isNight(hour: hour) {
            updateHourMessageView(message: HourMessageString.messageNight.localized, image: "night")
            return .night
        } else {
            updateHourMessageView(message: HourMessageString.messageDawn.localized, image: "dawn")
            return .dawn
        }
        
        return .notFound
    }
    
    func isMorning(hour: Int) -> Bool {
        hour >= 6 && hour < 12
    }
    
    func isEvening(hour: Int) -> Bool {
        hour >= 12 && hour < 17
    }
    
    func isNight(hour: Int) -> Bool {
        hour >= 17 && hour < 24
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
