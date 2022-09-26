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
