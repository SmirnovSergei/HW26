//
//  ViewController.swift
//  HW26
//
//  Created by brubru on 15.10.2024.
//

import UIKit

class ViewController: UIViewController {
	
	private let viewA = CustomView(bgColor: .lightGray, textLabel: "A")
	private let viewB = CustomView(bgColor: .red, textLabel: "B")
	private let viewC = CustomView(bgColor: .blue, textLabel: "C")
	private let viewD = CustomView(bgColor: .yellow, textLabel: "D")
	private let viewE = CustomView(bgColor: .green, textLabel: "E")

	
	override func viewDidLoad() {
		super.viewDidLoad()
		addSubViews()
		view.backgroundColor = .white
        
        addViewLabel(to: view, text: "VIEW")
        
        viewA.delegate = self
        view.getView(viewA)
        
		setupLayout()
	}
}

private extension ViewController {
	func addSubViews() {
		view.addSubview(viewA)
		
		viewA.addSubview(viewB)
		viewA.addSubview(viewC)
		viewB.addSubview(viewD)
		viewC.addSubview(viewE)
	}
}

/* extension ViewController: ICustomViewDeligate {
    func getTappedView(_ viewName: String) {
        viewName =  {
            
        }
    }

}
*/

// MARK: -> Private Methods
private extension ViewController {
	func addViewLabel(to view: UIView, text: String) {
		let viewLabel = UILabel()
		viewLabel.text = text
		viewLabel.font = UIFont.boldSystemFont(ofSize: 50)
		viewLabel.textColor = .black
		viewLabel.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(viewLabel)

		NSLayoutConstraint.activate([
			viewLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
			viewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
	}
}

private extension ViewController {
	func setupLayout() {
		viewA.translatesAutoresizingMaskIntoConstraints = false
		viewB.translatesAutoresizingMaskIntoConstraints = false
		viewC.translatesAutoresizingMaskIntoConstraints = false
		viewD.translatesAutoresizingMaskIntoConstraints = false
		viewE.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			
			viewA.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
			viewA.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
			viewA.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
			viewA.heightAnchor.constraint(equalToConstant: 300),
			
			viewB.topAnchor.constraint(equalTo: viewA.topAnchor, constant: 20),
			viewB.leadingAnchor.constraint(equalTo: viewA.leadingAnchor, constant: 20),
			viewB.widthAnchor.constraint(equalToConstant: 150),
			viewB.heightAnchor.constraint(equalToConstant: 150),
			
			viewC.topAnchor.constraint(equalTo: viewA.topAnchor, constant: 20),
			viewC.trailingAnchor.constraint(equalTo: viewA.trailingAnchor, constant: -20),
			viewC.widthAnchor.constraint(equalToConstant: 150),
			viewC.heightAnchor.constraint(equalToConstant: 150),
			
			viewD.bottomAnchor.constraint(equalTo: viewB.bottomAnchor, constant: -20),
			viewD.leadingAnchor.constraint(equalTo: viewB.leadingAnchor, constant: 20),
			viewD.widthAnchor.constraint(equalToConstant: 100),
			viewD.heightAnchor.constraint(equalToConstant: 50),
			
			viewE.topAnchor.constraint(equalTo: viewC.topAnchor, constant: 60),
			viewE.centerXAnchor.constraint(equalTo: viewC.centerXAnchor),
			viewE.widthAnchor.constraint(equalToConstant: 80),
			viewE.heightAnchor.constraint(equalToConstant: 120),
		])
	}
}

