//
//  ViewController.swift
//  hour-message
//
//  Created by Cora on 18/09/22.
//

import UIKit

enum Hour {
    case morning
    case evening
    case night
    case dawn
}

class ViewController: UIViewController {

    var morning: Bool?
    var evening: Bool?
    var night: Bool?
    var dawn: Bool?
    var hour: Int
    var dateNow: Date
    
    private lazy var hourMessageView: HourMessageView = {
        let view = HourMessageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(dateNow: Date = Date.now) {
        self.dateNow = dateNow
        self.hour = Calendar.current.dateComponents([.hour, .minute, .second], from: dateNow).hour ?? 0
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(hourMessageView)
        getHour(dateNow: dateNow)
        
        NSLayoutConstraint.activate([
            hourMessageView.topAnchor.constraint(equalTo: view.topAnchor),
            hourMessageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hourMessageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hourMessageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func getHour(dateNow: Date) {
        
        let dateFormatter = DateFormatter()
        var calendar = Calendar.current
        dateFormatter.timeZone = TimeZone.current
        
        if let timeZone = TimeZone(identifier: "BRST") {
           calendar.timeZone = timeZone
           dateFormatter.timeZone = timeZone
        }
        
        print(dateNow)
        print(calendar)
        
        let morning1 = "06:00:00"
        let morning2 = "11:59:59"
        
        let evening1 = "12:00:00"
        let evening2 = "17:59:00"
        
        let night1 = "18:00:00"
        let night2 = "23:59:59"
        
        let dawn1 = "00:00:00"
        let dawn2 = "05:59:59"
        
        dateFormatter.dateFormat = "HH:mm:ss"
      
        let printAqui = calendar.dateComponents([.hour, .minute, .second], from: dateNow)
        hour = printAqui.hour ?? 0
        print(dateNow)
        
        guard let morningSixAm = dateFormatter.date(from: morning1) else { return  }
        guard let morningElevenAm = dateFormatter.date(from: morning2) else { return }
        
        guard let eveningMidDay = dateFormatter.date(from: evening1) else { return  }
        guard let eveningFivePm = dateFormatter.date(from: evening2) else { return }
        
        guard let nightSixPm = dateFormatter.date(from: night1) else { return  }
        guard let nightElevenPm = dateFormatter.date(from: night2) else { return }
        
        guard let dawnMidNight = dateFormatter.date(from: dawn1) else { return  }
        guard let dawnFiveAm = dateFormatter.date(from: dawn2) else { return }
        
        morning = (calendar.component(.hour, from: morningSixAm)...calendar.component(.hour, from: morningElevenAm)).contains(hour)
        evening = (calendar.component(.hour, from: eveningMidDay)...calendar.component(.hour, from: eveningFivePm)).contains(hour)
        night = (calendar.component(.hour, from: nightSixPm)...calendar.component(.hour, from: nightElevenPm)).contains(hour)
        dawn = (calendar.component(.hour, from: dawnMidNight)...calendar.component(.hour, from: dawnFiveAm)).contains(hour)
    
        if morning ?? false {
            hourMessageView.messageLabel.text = HourMessageString.messageMorning.localized
            hourMessageView.image.image = UIImage(named: "morning")
            print("Bom dia")
        }
        
        if evening ?? false {
            hourMessageView.messageLabel.text = HourMessageString.messageEvening.localized
            hourMessageView.image.image = UIImage(named: "evening")
            print("Boa tarde")
        }
        
        if night ?? false {
            hourMessageView.messageLabel.text = HourMessageString.messageNight.localized
            hourMessageView.image.image = UIImage(named: "night")
            print("Boa noite")
        }
        
        if dawn ?? false {
            hourMessageView.messageLabel.text = HourMessageString.messageDawn.localized
            hourMessageView.image.image = UIImage(named: "dawn")
            print("Ainda acordado?")
        }
                                                         }
}
