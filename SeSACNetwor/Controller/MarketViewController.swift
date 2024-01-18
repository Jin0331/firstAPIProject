//
//  MarketViewController.swift
//  SeSACNetwor
//
//  Created by JinwooLee on 1/16/24.
//

import UIKit
import Alamofire

struct Market : Codable {
    var market : String
    var korean_name : String
    var english_name : String
}

class MarketViewController: UIViewController {
    
    @IBOutlet var marketTableView: UITableView!
    
    var list : [Market] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        callRequest()
        configureProtocol()
    }
}

extension MarketViewController {
    
    func callRequest() {
        
        let url = "https://api.upbit.com/v1/market/all"
        
        AF.request(url, method: .get)
            .validate(statusCode: 200..<300).responseDecodable(of: [Market].self) { response in
                switch response.result {
                case .success(let success) :
//                    dump(success)
                    
                    
                    if response.response?.statusCode == 200 {
                        self.list = success
                        self.marketTableView.reloadData()
                    } else if response.response?.statusCode == 500 {
                        
                        print("오류가 발생했다. 잠시 후 다시 시도해라.")
                    }
                    
                case .failure(let failure) :
                    print("오류")
                }
            }
    }
}

extension MarketViewController : UITableViewDelegate, UITableViewDataSource {
    
    func configureProtocol() {
        marketTableView.delegate = self
        marketTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "marketCell")!
        
        let data = list[indexPath.row]
        
        cell.textLabel?.text = data.korean_name
        cell.detailTextLabel?.text = data.market
        
        return cell
    }
}

