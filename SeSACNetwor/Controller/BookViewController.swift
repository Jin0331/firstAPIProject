//
//  BookViewController.swift
//  SeSACNetwor
//
//  Created by JinwooLee on 1/17/24.
//

import UIKit
import Alamofire

class BookViewController: UIViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var bookCollectionView: UICollectionView!
    
    // 값 받을 variable
    var searchKeyword : String?
    var BookList : Book? {
        didSet {
            bookCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionViewProtocol()
        bookCollectionView.collectionViewLayout = configureCellLayout()
        
    }
}


//MARK: - SearchBar
extension BookViewController : UISearchBarDelegate {
    
    func configureSearchBarProtocol() {
        searchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchKeyword = searchBar.text
        
        if let s = searchKeyword {
            callRequest(text: s) { Book in
                self.BookList = Book
                dump(self.BookList)
            }
        }
        
    }
}


//MARK: -
extension BookViewController {
    
    /*
     만약 한글 검색이 안된다면 인코딩 처리
     */
    func callRequest(text : String, completionHandler : @escaping (Book) -> ()) {
        
        let query = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = "https://dapi.kakao.com/v3/search/book?query=\(query)"
        
        let header : HTTPHeaders = ["Authorization" : API.kakao]
        
        AF.request(url,
                   method: .get,
                   headers: header)
        .responseDecodable(of: Book.self) { response in
            switch response.result {
            case .success(let success):
                completionHandler(success)
            case .failure(let failure) :
                print(failure)
            }
        }
    }
}

extension BookViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func configureCollectionViewProtocol() {
        bookCollectionView.delegate = self
        bookCollectionView.dataSource = self
        
        let xib = UINib(nibName: BookCollectionCollectionViewCell.identifier, bundle: nil)
        bookCollectionView.register(xib, forCellWithReuseIdentifier: BookCollectionCollectionViewCell.identifier)
        
    }
    
    
    func configureCellLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        
        let spacing : CGFloat = 10
        let cellWidth = UIScreen.main.bounds.width - (spacing * 3)
        
        layout.itemSize = CGSize(width: cellWidth / 2, height: (cellWidth) / 2) // 셀의 크기
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.scrollDirection = .vertical
        
        return layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return BookList?.documents.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = bookCollectionView.dequeueReusableCell(withReuseIdentifier: BookCollectionCollectionViewCell.identifier, for: indexPath) as! BookCollectionCollectionViewCell
        
        
        if let b = BookList {
            cell.configureCollectionView(cell:b.documents[indexPath.item])
        }
        
        return cell
        
    }
    
    
}
