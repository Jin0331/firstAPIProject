//
//  Protocol.swift
//  SeSACNetwor
//
//  Created by JinwooLee on 1/17/24.
//

import Foundation

protocol ResuableProtocol {
    static var identifier : String { get }
}

protocol LeftSendDelegate {
    func leftSendTextLabel(text:String)
}

protocol RightSendDelegate {
    func rightSendTextLabel(text:String)
}
