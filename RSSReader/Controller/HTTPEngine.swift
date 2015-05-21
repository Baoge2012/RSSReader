//
//  HTTPEngine.swift
//  RSSReader
//
//  Created by MingbaoZhu on 15/5/21.
//  Copyright (c) 2015年 Mingbao. All rights reserved.
//

import Foundation

class HTTPEngine {
    class func request(#method:String, url:String, params: Dictionary<String, AnyObject> = Dictionary<String, AnyObject>(), callback: (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void){
        let session = NSURLSession.sharedSession()
        
        var newURL = url
        if method == "GET"{
            newURL += "?" + HTTPEngine().buildParams(params)
        }
        
        let request = NSMutableURLRequest(URL: NSURL(string: newURL)!)
        request.HTTPMethod = method
        
        if method == "POST" {
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.HTTPBody = HTTPEngine().buildParams(params).dataUsingEncoding(NSUTF8StringEncoding)
        }

        let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            callback(data: data, response: response, error: error)
        })
        task.resume()
    }
    
    
    func buildParams(parameters: [String: AnyObject]) -> String {
        var components: [(String, String)] = []
        for key in sorted(Array(parameters.keys), <) {
            let value: AnyObject! = parameters[key]
            components += self.queryComponents(key, value)
        }
        
        return join("&", components.map{"\($0)=\($1)"} as [String])
    }
    func queryComponents(key: String, _ value: AnyObject) -> [(String, String)] {
        var components: [(String, String)] = []
        if let dictionary = value as? [String: AnyObject] {
            for (nestedKey, value) in dictionary {
                components += queryComponents("\(key)[\(nestedKey)]", value)
            }
        } else if let array = value as? [AnyObject] {
            for value in array {
                components += queryComponents("\(key)", value)
            }
        } else {
            components.extend([(escape(key), escape("\(value)"))])
        }
        
        return components
    }
    func escape(string: String) -> String {
        let legalURLCharactersToBeEscaped: CFStringRef = ":&=;+!@#$()',*"
        return CFURLCreateStringByAddingPercentEscapes(nil, string, nil, legalURLCharactersToBeEscaped, CFStringBuiltInEncodings.UTF8.rawValue) as String
    }
}