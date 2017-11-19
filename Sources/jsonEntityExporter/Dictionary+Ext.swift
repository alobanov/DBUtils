//
//  Dictionary.swift
//  EntitySerialization
//
//  Created by Lobanov Aleksey on 17/11/2017.
//  Copyright © 2017 Lobanov Aleksey. All rights reserved.
//

import Foundation

extension Dictionary {
  mutating func merge(with dictionary: Dictionary) {
    dictionary.forEach { updateValue($1, forKey: $0) }
  }
  
  func merged(with dictionary: Dictionary) -> Dictionary {
    var copy = self
    dictionary.forEach { copy.updateValue($1, forKey: $0) }
    return copy
  }
}

public extension Dictionary where Key == String {
  func string(by key: String) -> String? {
    return self[key] as? String
  }
  
  func int(by key: String) -> Int? {
    if let f = self[key] as? Int {
      return f
    }
    
    if let value = self[key] as? String {
      return Int(value)
    }
    
    return nil
  }
  
  func float(by key: String) -> Float? {
    if let f = self[key] as? Double {
      return Float(f)
    }
    
    if let value = self[key] as? String {
      return Float(value)
    }
    
    return nil
  }
  
  func double(by key: String) -> Double? {
    if let f = self[key] as? Double {
      return f
    }
    
    if let value = self[key] as? String {
      return Double(value)
    }
    
    return nil
  }
  
  func decimal(by key: String) -> NSDecimalNumber? {
    if let f = self[key] as? Double {
      return NSDecimalNumber(value: f)
    }
    
    if let value = self[key] as? String {
      return NSDecimalNumber(string: value)
    }
    
    return nil
  }
  
  func data(by key: String) -> Data? {
    if let raw = self[key] {
      return NSKeyedArchiver.archivedData(withRootObject: raw)
    } else {
      return nil
    }
  }
  
  func bool(by key: String) -> Bool? {
    if let f = self[key] as? Bool {
      return f
    }
    
    if let value = self[key] as? String {
      return Bool(value)
    }
    
    return nil
  }
}
