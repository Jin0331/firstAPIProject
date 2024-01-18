//
//  Papago.swift
//  SeSACNetwor
//
//  Created by JinwooLee on 1/17/24.
//

import Foundation

/*
 {
     "message": {
         "@type": "response",
         "@service": "naverservice.nmt.proxy",
         "@version": "1.0.0",
         "result": {
             "srcLangType": "ko",
             "tarLangType": "en",
             "translatedText": "Hello, I'm whale rice.",
             "engineType": "N2MT"
         }
     }
 }
 */

struct Papago : Codable{
    let message : PapagoResult
}

struct PapagoResult: Codable {
    let result : PapagoResultList
}

struct PapagoResultList: Codable {
    let srcLangType : String
    let tarLangType: String
    let translatedText: String
}


/*
 ko    한국어
 en    영어
 ja    일본어
 zh-CN    중국어 간체
 zh-TW    중국어 번체
 vi    베트남어
 id    인도네시아어
 th    태국어
 de    독일어
 ru    러시아어
 es    스페인어
 it    이탈리아어
 fr    프랑스어
 */

enum PapagoDictionary  : String, CaseIterable  {
    case ko = "한국어"
    case en = "영어"
    case ja = "일본어"
    case znCH = "중국어(간체)"
    case znTW = "중국어(본체)"
    
    
    var kind : String {
        switch self {
        case .ko :
            return "ko"
        case .en :
            return "en"
        case .ja :
            return "ja"
        case .znCH :
            return "znCH"
        case .znTW :
            return "znTW"
        }
    }
    
    var langDict : [String : String] {
        switch self {
        case .ko :
            return [self.kind : "한국어"]
        case .en :
            return [self.kind : "영어"]
        case .ja :
            return [self.kind : "일본어"]
        case .znCH :
            return [self.kind : "중국어(간체)"]
        case .znTW :
            return [self.kind : "중국어(본체)"]
        }
    }
}
