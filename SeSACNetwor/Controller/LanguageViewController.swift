//
//  LanguageViewController.swift
//  SeSACNetwor
//
//  Created by JinwooLee on 1/17/24.
//

import UIKit

class LanguageViewController: UIViewController {

    @IBOutlet var languageTableView: UITableView!
    
    var languageModel = PapagoDictionary.allCases
    
    var leftSendDelegate : LeftSendDelegate?
    var rightSendDelegate : RightSendDelegate?
    var deligateIndex : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableViewProtocol()
        configureViewDesign()
    }
    

}

extension LanguageViewController : UITableViewDelegate, UITableViewDataSource {
    
    func configureTableViewProtocol () {
        languageTableView.delegate = self
        languageTableView.dataSource = self
        
        let xib = UINib(nibName: LanguageTableViewCell.identifier, bundle: nil)
        languageTableView.register(xib, forCellReuseIdentifier: LanguageTableViewCell.identifier)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print(#function, "언어 모델 : \(languageModel)")
        
        return languageModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LanguageTableViewCell.identifier, for: indexPath) as! LanguageTableViewCell
        
        cell.setCellText(cell: languageModel[indexPath.row].langDict)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        dismiss(animated: true)
        
        guard let index = deligateIndex else { return }
        
        if index == "left" {
            leftSendDelegate?.leftSendTextLabel(text: Array(languageModel[indexPath.row].langDict.values)[0])
        } else if index == "right" {
            rightSendDelegate?.rightSendTextLabel(text: Array(languageModel[indexPath.row].langDict.values)[0])
        }
    }
    
}

extension LanguageViewController {
    func configureViewDesign() {
        navigationItem.title = "이 언어로 입력"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "multiply"), style: .plain, target: self, action: #selector(buttonAcation))
    }
    
    @objc func buttonAcation() {
        dismiss(animated: true)
    }
}
