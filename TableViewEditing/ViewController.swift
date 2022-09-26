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
        tableView.register(
            MyTableViewCell.self,
            forCellReuseIdentifier: MyTableViewCell.identifier
        )
        
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
    
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureDatasource()
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        print("willTransition")
    }
}

private extension ViewController {
    func setupViews() {
        [
            titleLabel,
            tableView
        ]
            .forEach {
                view.addSubview($0)
            }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    func configureDatasource() {
        let dataSource = RxTableViewSectionedReloadDataSource<PersonSection> { dataSource, tableView, indexPath, item in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as? MyTableViewCell else {
                return UITableViewCell()
            }
            let name = item.name
            let age = item.age
            
            cell.setupCell(name: name, age: age)
            return cell
        }
        
        dataSource.titleForHeaderInSection = { dataSource, index in
            return dataSource.sectionModels[index].headerTitle
        }
        
        dataSource.canEditRowAtIndexPath = { dataSource, indexPath in
            return true
        }
        
        
        Observable.just(sections)
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
}
