import UIKit

protocol HourMessageProtocol {
    func getCurrentDate() -> Date
}

class ViewController: UIViewController, HourMessageProtocol {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        setupViews()
    }
    
    private lazy var buttonToSeePeriod: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(openSeePeriodScreen), for: .touchUpInside)
        
        button.backgroundColor = .systemPink
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ver período", for: .normal)
        return button
    }()
    
    @objc func openSeePeriodScreen() {
        print("passou?")
        let controller = HourMessageViewController(hourMessageProtocol: self)
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    func getCurrentDate() -> Date {
        return Date.now
    }
    
    func setupViews() {
        view.addSubview(buttonToSeePeriod)
        
        NSLayoutConstraint.activate([
            buttonToSeePeriod.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonToSeePeriod.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}
