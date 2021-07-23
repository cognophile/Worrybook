//
//  ViewModelProtocol.swift
//  Worrybook
//
//  Created by Alex Boggis on 23/07/2021.
//

import Foundation

protocol ViewModelProtocol {
    var id: Int? { get set }
    var uuid: UUID { get set }
}
