//
//  MyTableViewCell.swift
//  TableViewEditing
//
//  Created by iMac on 2022/09/27.
//

import UIKit
import SnapKit

final class MyTableViewCell: UITableViewCell {
    static let identifier = "MyTableViewCell"
    
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "cellText"
        label.font = .systemFont(ofSize: 20.0)
        label.textColor = .label
        
        return label
    }()
    
    private lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18.0)
        label.textColor = .label
        
        return label
    }()
    
    func setupCell(name: String, age: Int) {
        nameLabel.text = name
        ageLabel.text = "나이: \(age)"
        
        setupViews()
    }
}

private extension MyTableViewCell {
    func setupViews() {
        contentView.backgroundColor = .secondarySystemBackground
        [
            nameLabel,
            ageLabel
        ]
            .forEach {
                contentView.addSubview($0)
            }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        ageLabel.snp.makeConstraints {
            $0.centerY.equalTo(nameLabel)
            $0.leading.equalTo(nameLabel.snp.trailing).offset(4.0)
            $0.trailing.equalToSuperview()
        }
        
    }
}
