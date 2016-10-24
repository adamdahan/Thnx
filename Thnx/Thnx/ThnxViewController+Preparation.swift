//
//  ThnxViewController+Configuration.swift
//  Hackchild
//
//  Created by Adam Dahan on 2016-10-24.
//  Copyright (c) 2016 Adam Dahan. All rights reserved.
//

import UIKit

public extension ThnxViewController {
 
    public func prepareView() {
        view.backgroundColor = UIColor.red
    }
    
    public func prepareTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
    }

    public func prepareLicenses() {
        licenses = t.licenses(urls: self.urls)
    }
}
