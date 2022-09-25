//
//  HourMessageView.swift
//  hour-message
//
//  Created by Cora on 19/09/22.
//

import Foundation
import UIKit

class HourMessageView: UIView {
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    let image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    init() {
        super.init(frame: .zero)
        buildViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViews() {
        backgroundColor = .white
        addSubview(messageLabel)
        addSubview(image)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            messageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            image.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 20),
            image.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}

