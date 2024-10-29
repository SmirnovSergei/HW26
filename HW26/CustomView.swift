//
//  CustomView.swift
//  HW26
//
//  Created by Сергей Смирнов on 22.10.2024.
//

import UIKit

protocol ICustomViewDelegate {
	func getViewName(_ viewName: String)
}

class CustomView: UIView {
	var nameInstance: String?

	var delegate: ICustomViewDelegate?

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
		let view = super.hitTest(point, with: event)

		if let tappedView = view as? CustomView {
			delegate?.getViewName(tappedView.nameInstance ?? "Значение nil")
		}

		return view
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
