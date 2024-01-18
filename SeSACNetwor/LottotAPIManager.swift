//
//  LottotAPIManager.swift
//  SeSACNetwor
//
//  Created by JinwooLee on 1/16/24.
//

import Foundation
import Alamofire

struct LottotAPIManager  {
    
    func callRequest(number : String, completionHandler : @escaping (String) -> Void) {
        let url : String = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(number)" // 쿼리 스트링
        AF.request(url, method: .get)
            .responseDecodable(of: Lotto.self) { response in
                switch response.result {
                case .success(let success):
//                    print(success)
//                    print(success.drwNoDate)
//                    print(success.drwNo)
                    
                    completionHandler(success.drwNoDate)
                    
                case .failure(let failure):
                    print("오류 발생")
                }
            }
    }
}
