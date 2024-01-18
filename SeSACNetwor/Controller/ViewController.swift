//
//  ViewController.swift
//  SeSACNetwor
//
//  Created by JinwooLee on 1/16/24.
//

import UIKit
import Alamofire

struct BoxOffice : Codable {
    let boxOfficeResult : BoxOfficeSub
}

struct BoxOfficeSub : Codable {
    let boxofficeType : String
    let showRange : String
    let dailyBoxOfficeList : [BoxOfficeDaily]
}

struct BoxOfficeDaily : Codable {
    let movieNm : String
    let openDt : String
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

extension ViewController {
    func callRequest() {
        let url = ""
        
        AF.request(url, method: .get).responseDecodable(of: BoxOffice.self) { response in
            
            switch response.result {
            case .success(let success):
                print("hello")
            case .failure(let failure) :
                print("error")
            }
        }
    }
}
