//
//  ThnxViewController.swift
//  Hackchild
//
//  Created by Adam Dahan on 2016-10-24.
//  Copyright (c) 2016 Adam Dahan. All rights reserved.
//

import UIKit

public class ThnxViewController: UIViewController {
    
    public var t = Thnx()
    
    public var licenses = Dictionary<String, String>()
    
    public lazy var tableView: UITableView = UITableView()
    
    public var urls: [String]!

    public init(urls: [String]) {
        super.init(nibName: nil, bundle: nil)
        self.urls = urls
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        prepareLicenses()
        prepareView()
        prepareTableView()
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutTableView()
    }
    
    public func reloadData() {
        tableView.reloadData()
    }
}
