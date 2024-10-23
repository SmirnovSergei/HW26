//
//  CustomView.swift
//  HW26
//
//  Created by Сергей Смирнов on 22.10.2024.
//

import UIKit

protocol ICustomViewDeligate {
    func getTappedView(_ viewName: String)
}

class CustomView: UIView {
    var nameInstance: String?
    
    var delegate: ICustomViewDeligate?
    
    init(bgColor: UIColor, textLabel: String) {
        super.init(frame: .zero)
        backgroundColor = bgColor
        addLabel(to: self, text: textLabel)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        super.hitTest(point, with: event)
        getView(self) // не уверен, что селф здесь сработает
    }
    
    func getView(_ views: UIView...) {
        for view in views {
            if let tappedView = view as? CustomView {
                delegate?.getTappedView(tappedView.nameInstance ?? "Touch color view")
            }
        }
    }
    
    func addLabel(to view: UIView, text: String) {
        let label = UILabel()
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5)
        ])
    }
}
