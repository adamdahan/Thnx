//
//  ThnxViewController+UITableViewDataSource.swift
//  Hackchild
//
//  Created by Adam Dahan on 2016-10-24.
//  Copyright (c) 2016 Adam Dahan. All rights reserved.
//

import UIKit

extension ThnxViewController: UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return Array(licenses.keys).count
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let licenseKey = Array(licenses.keys)[indexPath.section]
        let license = licenses[licenseKey]
        cell.textLabel?.text = "\(license!)"
        cell.contentView.backgroundColor = UIColor.white
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font = UIFont.systemFont(ofSize: 8)
        cell.textLabel?.sizeToFit()
        return cell
    }

    @nonobjc public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Array(licenses.keys)[section]
    }
}
