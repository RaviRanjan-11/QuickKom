//
//  UserStorage.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 19/12/25.
//

import UIKit

@propertyWrapper
struct UserStorage<T> {

    private let keyName: UserDefaultKey
    private let defaultValue: T
    private let storage: UserDefaults
    

    init(
        key: UserDefaultKey,
        defaultValue: T,
        storage: UserDefaults = .standard
    ) {
        self.keyName = key
        self.defaultValue = defaultValue
        self.storage = storage
    }

    var wrappedValue: T {
        get {
            storage.object(forKey: keyName.key) as? T ?? defaultValue
        }
        set {
            storage.set(newValue, forKey: keyName.key)
        }
    }
    
    
}
