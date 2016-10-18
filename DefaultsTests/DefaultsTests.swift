//
//  DefaultsTests.swift
//  DefaultsTests
//
//  Created by Luca D'Alberti on 10/18/16.
//  Copyright © 2016 dalu93. All rights reserved.
//

import XCTest
@testable import Defaults

class DefaultsTests: XCTestCase {
    
    let defaultKey = DefaultKey.Name(rawValue: "key")!
    var stringDefaults = Defaults<String>.standard
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        UserDefaults.standard.removeObject(forKey: defaultKey.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func testStoreNewValueWithFirstInterface() {
        let newValue = "hello"
        
        UserDefaults.standard.set(newValue, for: defaultKey)
        
        let storedValue = UserDefaults.standard.string(forKey: defaultKey.rawValue)
        
        XCTAssert(storedValue == newValue, "The stored value for the key \(defaultKey.rawValue) is different from \(newValue)")
    }
    
    func testStoreNewValueWithSecondInterface() {
        let newValue = "hello"
        
        stringDefaults[defaultKey] = newValue
        
        let storedValue = UserDefaults.standard.string(forKey: defaultKey.rawValue)
        
        XCTAssert(storedValue == newValue, "The stored value for the key \(defaultKey.rawValue) is different from \(newValue)")
    }
    
    func testGetValueFirstInterface() {
        let storedValue = "fhdifhsif"
        
        UserDefaults.standard.set(storedValue, forKey: defaultKey.rawValue)
        UserDefaults.standard.synchronize()
        
        let retrievedValue: String = UserDefaults.standard.get(for: defaultKey)!
        
        XCTAssert(storedValue == retrievedValue, "The retrieved value is different than the stored one")
    }
    
    func testGetValueSecondInterface() {
        let storedValue = "fhdifhsif"
        
        UserDefaults.standard.set(storedValue, forKey: defaultKey.rawValue)
        UserDefaults.standard.synchronize()
        
        let retrievedValue = stringDefaults[defaultKey]!
        
        XCTAssert(storedValue == retrievedValue, "The retrieved value is different than the stored one")
    }
    
    func testDeleteValueFirstInterface() {
        let storedValue = "fhdifhsif"
        
        UserDefaults.standard.set(storedValue, forKey: defaultKey.rawValue)
        UserDefaults.standard.synchronize()
        
        UserDefaults.standard.set(nil, for: defaultKey)
        
        let retrievedValue: String? = UserDefaults.standard.get(for: defaultKey)
        
        XCTAssert(retrievedValue == nil, "The value for the key should be deleted")
    }
    
    func testDeleteValueSecondInterface() {
        let storedValue = "fhdifhsif"
        
        UserDefaults.standard.set(storedValue, forKey: defaultKey.rawValue)
        UserDefaults.standard.synchronize()
        
        stringDefaults[defaultKey] = nil
        
        let retrievedValue = stringDefaults[defaultKey]
        
        XCTAssert(retrievedValue == nil, "The value for the key should be deleted")
    }
}
