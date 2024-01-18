//
//  BookCollectionCollectionViewCell.swift
//  SeSACNetwor
//
//  Created by JinwooLee on 1/17/24.
//

import UIKit
import Kingfisher

class BookCollectionCollectionViewCell: UICollectionViewCell {

    @IBOutlet var viewCollection: UIView!
    @IBOutlet var titleCollection: UILabel!
    @IBOutlet var authorCollection: UILabel!
    @IBOutlet var imageCollection: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollectionViewDesign()
    }

}


extension BookCollectionCollectionViewCell {
    
    func configureCollectionViewDesign() {
        
        // View
        viewCollection.layer.masksToBounds = true
        viewCollection.layer.cornerRadius = 15
        viewCollection.backgroundColor = UIColor(red: CGFloat.random(in: 0...1),
                                                 green: CGFloat.random(in: 0...1),
                                                 blue: CGFloat.random(in: 0...1),
                                                 alpha: 1)

        //label
        titleCollection.font = .boldSystemFont(ofSize: 14)
        titleCollection.textColor = .white
        titleCollection.numberOfLines = 0
        authorCollection.font = .boldSystemFont(ofSize: 12)
        authorCollection.textColor = .white
        
        //image
        imageCollection.contentMode = .scaleAspectFill
        
    }
    
    func configureCollectionView(cell : Document) {
        
        // image 띄우기
        let url = URL(string : cell.thumbnail)
        imageCollection.kf.setImage(with: url)
        
        // label
        titleCollection.text = cell.title
        authorCollection.text = cell.authors.joined(separator: ",")
    }
}
