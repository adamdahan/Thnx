//
//  Thnx.swift
//  Thnx
//
//  Created by Adam Dahan on 2016-10-24.
//  Copyright © 2016 88Labs. All rights reserved.
//

import Foundation

public struct Strings {
    static let license = "LICENSE"
    static let regex = "(https:\\/\\/github.com\\/)(\\w)*\\/(\\w)*\\/(\\w)*\\/(\\w)*\\/(LICENSE)*(.md)?"
    static let githubURL = "https://github.com"
    static let githubRawURL = "https://raw.githubusercontent.com"
}

public func matches(for regex: String, in text: String) -> [String] {
    do {
        let regex = try NSRegularExpression(pattern: regex)
        let nsString = text as NSString
        let results = regex.matches(in: text, range: NSRange(location: 0, length: nsString.length))
        return results.map { nsString.substring(with: $0.range)}
    } catch let error {
        print("invalid regex: \(error.localizedDescription)")
        return []
    }
}

public struct Thnx {
    public func licenses(urls: [String]) -> Dictionary <String, String> {
        var d = Dictionary <String, String>()
        for url in urls {
            do {
                let urlPath = URL(string: url)
                let html = try String(contentsOf: urlPath!)
                let results = matches(for: Strings.regex, in: html)
                for r in results {
                    if r.contains(Strings.license) {
                        let comps = r.components(separatedBy: "/")
                        let replaced = url.replacingOccurrences(of: Strings.githubURL, with: Strings.githubRawURL)
                        let url = URL(string: "\(replaced)/\(comps[comps.count - 2])/\(comps.last!)")!
                        do {
                            let text = try String(contentsOf: url, encoding: .ascii)
                            d[url.absoluteString.components(separatedBy: "/")[4]] = text
                        } catch let e {
                            print(e)
                        }
                        
                    }
                }
            } catch _ {}
        }
        return d
    }
}
