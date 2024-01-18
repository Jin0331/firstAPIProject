//
//  LottoViewController.swift
//  SeSACNetwor
//
//  Created by JinwooLee on 1/16/24.
//

import UIKit

struct Lotto : Codable {
    let drwNo : Int
    let drwNoDate : String
    let drwtNo1 : Int
    let drwtNo2 : Int
    let drwtNo3 : Int
    let drwtNo4 : Int
    let drwtNo5 : Int
    let drwtNo6 : Int
    let bnusNo : Int
}

class LottoViewController: UIViewController {

    @IBOutlet var inputTextfield: UITextField!
    @IBOutlet var dataLabel: UILabel!
    
    let manager = LottotAPIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.callRequest(number: "1102") { value in
            self.dataLabel.text = value
        }
    }
    
    @IBAction func textFieldReturnTapped(_ sender: UITextField) {
        // 공백이거나 문자를 입력한 경우에는 통신이 잘 안 될 수 있음.
        manager.callRequest(number: sender.text!) { value in
            self.dataLabel.text = value
        }
    }
}
