//
//  RegisterRequest.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 08/12/25.
//


struct RegisterRequest: Encodable {
    let name: String
    let email: String
    let password: String
    let userName: String
}
