//
//  PaPagoViewController.swift
//  SeSACNetwor
//
//  Created by JinwooLee on 1/17/24.
//


/*
 1. 네트워크 통신 단절 상태
 2. API 콜수
 3. 번역 버튼 클릭 횟수
 4. progress bar
 5. 글자수 제한( 1글자인 경우에는..? )
 */


import UIKit
import Alamofire

class PaPagoViewController: UIViewController{
    
    @IBOutlet var sourceTextView: UITextView!
    @IBOutlet var translateButton: UIButton!
    @IBOutlet var tarLabel: UILabel!
    
    @IBOutlet var leftButton: UIButton!
    @IBOutlet var middleButton: UIButton!
    @IBOutlet var rightButton: UIButton!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        leftButton.tag = 0 // enum으로 바꿔야됨
        rightButton.tag = 1
        
//        translateButton.addTarget(self, action: #selector(translateButtonClicked), for: .touchUpInside)
        
    }
    
//    @objc func translateButtonClicked() {
//        let url = "https://openapi.naver.com/v1/papago/n2mt"
//        
//        let headers : HTTPHeaders = [
//            "X-Naver-Client-Id" : APIPAPAGO.clientID,
//            "X-Naver-Client-Secret": APIPAPAGO.clientPWD
//        ]
//        
//        let parameters : Parameters = ["text": sourceTextView.text!, "source":"ko","target":"en"]
//        
//        AF.request(url,
//                   method: .post,
//                   parameters: parameters,
//                   headers: headers)
//
//        
//    }
    
    @IBAction func LeftSelectLanguage(_ sender: UIButton) {
        
        let sb = UIStoryboard(name: LanguageViewController.identifier, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: LanguageViewController.identifier) as! LanguageViewController
        let nav = UINavigationController(rootViewController: vc)
        
        if sender.tag == 0 {
            vc.leftSendDelegate = self
            vc.deligateIndex = "left"

        } else if sender.tag == 1 {
            vc.rightSendDelegate = self
            vc.deligateIndex = "right"
        }
        
        present(nav, animated: true)
    }
    
    @IBAction func buttonLabelChange(_ sender: UIButton) {
        
        let leftButtonLabel : String = leftButton.titleLabel?.text ?? ""
        leftButton.setTitle(rightButton.titleLabel?.text ?? "", for: .normal)
        rightButton.setTitle(leftButtonLabel, for: .normal)
    }

    @IBAction func translateButton(_ sender: UIButton) {
        let url = "https://openapi.naver.com/v1/papago/n2mt"
        
        let source = leftButton.titleLabel?.text
        let target = rightButton.titleLabel?.text
        
        let sourceCase  = PapagoDictionary(rawValue: source!)?.kind
        let targetCase  = PapagoDictionary(rawValue: target!)?.kind
                
        let headers : HTTPHeaders = [
            "X-Naver-Client-Id" : API.clientID,
            "X-Naver-Client-Secret": API.clientPWD
        ]
        
        let parameters : Parameters = ["text": sourceTextView.text!, "source":sourceCase!,"target":targetCase!]
        
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   headers: headers)
        .responseDecodable(of: Papago.self) { response in
            switch response.result {
            case .success(let success):
                self.tarLabel.text = success.message.result.translatedText
            case .failure(let failure) :
                print("error")
            }
        }
    }
    
}

extension PaPagoViewController : LeftSendDelegate,RightSendDelegate{
    // delegate 데이터 전송
    func leftSendTextLabel(text : String) {
        leftButton.setTitle(text, for: .normal)
    }
    func rightSendTextLabel(text : String) {
        rightButton.setTitle(text, for: .normal)
    }

}
