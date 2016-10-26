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

// Header
let defaultHeaderAlpha = CGFloat(0.6)
let defaultHeightForHeaderInSection = CGFloat(40)
let defaultHeaderFontSize = CGFloat(18)

// TextLabel
let defaultTextLabelFont = UIFont.systemFont(ofSize: 10)
let defaultTextLabelBackgroundColor = UIColor.white
let defaultTextLabelLayerBorderColor = UIColor.darkGray.cgColor
let defaultTextLabelLayerBorderWidth = CGFloat(0)
let defaultTextLabelLayerBorderCornerRadius = CGFloat(5)

extension ThnxViewController: UITableViewDataSource {
    
    /**
     :name: numberOfSections(in tableView: UITableView) -> Int
    */
    public func numberOfSections(in tableView: UITableView) -> Int {
        return Array(licenses.keys).count
    }

    /**
     :name: tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    */
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    /**
     :name: tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    */
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.selectionStyle = .none
        
        // contentView
        if let c = contentViewBackgroundColor {
            cell.contentView.backgroundColor = c
        }
        
        // object
        let licenseKey = Array(licenses.keys)[indexPath.section]
        let license = licenses[licenseKey]
        
        // automatic text sizing support
        cell.textLabel?.text = "\(license!)"
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.sizeToFit()

        // text appearance
        if let c = textLabelTextColor {
            cell.textLabel?.textColor = c
        }
        if let f = textLabelFont {
            cell.textLabel?.font = f
        }
        cell.textLabel?.backgroundColor = textLabelBackgroundColor ?? defaultTextLabelBackgroundColor
        cell.textLabel?.layer.cornerRadius = textLabelLayerCornerRadius ?? defaultTextLabelLayerBorderCornerRadius
        cell.textLabel?.layer.borderWidth = textLabelLayerBorderWidth ?? defaultTextLabelLayerBorderWidth
        cell.textLabel?.layer.borderColor = textLabelLayerBorderColor ?? defaultTextLabelLayerBorderColor
        return cell
    }
    
    /**
     :name: tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    */
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Array(licenses.keys)[section]
    }
    
    public func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = sectionHeaderBackgroundColor ?? UIColor.white.withAlphaComponent(0.8)
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        if let f = sectionHeaderFont {
            header.textLabel?.font = f
        }
        if let c = sectionHeaderTextColor {
            header.textLabel?.textColor = c
        }
    }
}
