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

import Foundation

/**
 :name: Strings
 - Strings used in the framework
 */
public struct Strings {
    static let license = "LICENSE"
    static let regex = "(https:\\/\\/github.com\\/)(\\w)*\\/(\\w)*\\/(\\w)*\\/(\\w)*\\/(LICENSE)*(.md)?"
    static let githubURL = "https://github.com"
    static let githubRawURL = "https://raw.githubusercontent.com"
}

/**
 :name: Strings
 - Regular expression matching - used for grabbing URLs from HTML.
 - Parameter regex: Regular expression as a string
 - Parameter text: Text to match against the regular expression
 */
private func matches(for regex: String, in text: String) -> [String] {
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

/**
 Main object
 */
public class Thnx {
    /**
     :name: licenses
     - Strings used in the framework
     - Parameter urls: Urls to github repositories you want to get licenses from as an array of strings
     */
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
                        } catch _ {}
                    }
                }
            } catch _ {}
        }
        return d
    }
}
