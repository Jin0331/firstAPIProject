import UIKit

//MARK: - Extension
extension UIViewController : ResuableProtocol {
    static var identifier : String {
        return String(describing: self)
    }
}

extension UITableViewCell : ResuableProtocol {
    static var identifier : String {
        return String(describing: self)
    }
}

extension UICollectionViewCell : ResuableProtocol {
    static var identifier : String {
        return String(describing: self)
    }
}
