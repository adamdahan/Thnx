/*
 * Copyright (C) 2016, Adam Dahan. <http://thnx.io>.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *	*	Redistributions of source code must retain the above copyright notice, this
 *		list of conditions and the following disclaimer.
 *
 *	*	Redistributions in binary form must reproduce the above copyright notice,
 *		this list of conditions and the following disclaimer in the documentation
 *		and/or other materials provided with the distribution.
 *
 *	*	Neither the name of CosmicMind nor the names of its
 *		contributors may be used to endorse or promote products derived from
 *		this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import UIKit

open class ThnxViewController: UIViewController {
    
    // ivars
    open var t = Thnx()
    open var licenses = Dictionary<String, String>()
    open var tableView = UITableView()
    open var urls: [String]!

    // section header configuration
    open var sectionHeaderFont: UIFont?
    open var sectionHeaderBackgroundColor: UIColor?
    open var sectionHeaderTextColor: UIColor?
    
    // contentView
    open var contentViewBackgroundColor: UIColor?
    
    // textLabel configuration
    open var textLabelFont: UIFont?
    open var textLabelTextColor: UIColor?
    open var textLabelBackgroundColor: UIColor?
    open var textLabelLayerBorderWidth: CGFloat?
    open var textLabelLayerBorderColor: CGColor?
    open var textLabelLayerCornerRadius: CGFloat?
    
    
    
    /**
     :name: init(urls:[String])
     - Custom initializer
     - Parameter urls: Array of strings that are urls to the repositories you want to get licenses too.
    */
    public init(urls: [String]) {
        super.init(nibName: nil, bundle: nil)
        self.urls = urls
    }
    
    /**
     :name: init?(coder aDecoder: NSCoder)
     - Required initializer
     - Do not initialize controller with this signature
    */
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented - use init(urls:)")
    }
    
    /**
     :name: viewDidLoad
    */
    open override func viewDidLoad() {
        super.viewDidLoad()
        prepareLicenses()
        prepareView()
        prepareTableView()
    }
    
    /**
     :name: viewDidAppear
    */
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    /**
     :name: viewDidLayoutSubviews
    */
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutTableView()
    }
}
