//
//  AnyEncodable.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 08/12/25.
//

import Foundation
struct AnyEncodable: Encodable {
    private let encode: (Encoder) throws -> Void
    init(_ encodable: Encodable) {
        self.encode = encodable.encode
    }
    func encode(to encoder: Encoder) throws {
        try encode(encoder)
    }
}
