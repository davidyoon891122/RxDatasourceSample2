//
//  ViewController.swift
//  TableViewEditing
//
//  Created by iMac on 2022/09/21.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import RxDataSources

class ViewController: UIViewController {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Orientation"
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.isEditing = true
        
        return tableView
    }()
    
    private var sections = [
        PersonSection(headerTitle: "First Section", items: [
            Person(name: "데이비드윤", age: 30),
            Person(name: "ZㅏZㅏ", age: 30),
            Person(name: "Tom", age: 25)
        ]),
        PersonSection(headerTitle: "Second Section", items: [
            Person(name: "테스트", age: 16),
            Person(name: "테스트2", age: 22)
        ]),
        PersonSection(headerTitle: "Third Section", items: [
            Person(name: "테스트3", age: 20),
            Person(name: "테스트4", age: 50)
        ])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        print("willTransition")
    }
}

private extension ViewController {
    func setupViews() {
        [
            titleLabel
        ]
            .forEach {
                view.addSubview($0)
            }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
}
