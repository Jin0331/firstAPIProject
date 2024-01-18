// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

/*
 {
     "documents": [
         {
             "authors": [
                 "이재은"
             ],
             "contents": "이 책은 스위프트 2.0의 기본 문법과 구문을 설명하고 있으며, 객체 지향 언어의 특징과 타입 추론, 클로저, 추상화 등 모던 프로그래밍 언어의 핵심, 그리고 일급 함수로 대표되는 함수형 프로그래밍의 특성까지를 포함한 고급 문법을 쉽고 자세하게 다룹니다. 또한 iOS 9에서 앱을 제작하기 위해 알아야 하는 뷰 컨트롤러와 앱 화면의 객체를 스위프트 코드로 제어하기 위한 방법, 화면을 전환하고 화면 간 데이터를 교환하는 방법 뿐만 아니라 델리게이트",
             "datetime": "2015-10-01T00:00:00.000+09:00",
             "isbn": "1186710004 9791186710005",
             "price": 48000,
             "publisher": "루비페이퍼",
             "sale_price": 43200,
             "status": "정상판매",
             "thumbnail": "https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1634926%3Ftimestamp%3D20221025125823",
             "title": "꼼꼼한 재은 씨의 스위프트(Swift) 2 프로그래밍",
             "translators": [],
             "url": "https://search.daum.net/search?w=bookpage&bookId=1634926&q=%EA%BC%BC%EA%BC%BC%ED%95%9C+%EC%9E%AC%EC%9D%80+%EC%94%A8%EC%9D%98+%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8%28Swift%29+2+%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D"
         }
     ],
     "meta": {
         "is_end": false,
         "pageable_count": 996,
         "total_count": 996
     }
 }
 */

import Foundation

// MARK: - Welcome
struct Book: Codable {
    let documents: [Document]
    let meta: Meta
}

// MARK: - Document
struct Document: Codable {
    let authors: [String]
    let contents, datetime, isbn: String
    let price: Int
    let publisher: String
    let salePrice: Int
    let status: String
    let thumbnail: String
    let title: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case authors, contents, datetime, isbn, price, publisher
        case salePrice = "sale_price"
        case status, thumbnail, title, url
    }
}

// MARK: - Meta
struct Meta: Codable {
    let isEnd: Bool
    let pageableCount, totalCount: Int
    
    enum CodingKeys: String, CodingKey {
        case isEnd = "is_end"
        case pageableCount = "pageable_count"
        case totalCount = "total_count"
    }
}
