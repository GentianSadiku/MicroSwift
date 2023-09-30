import UIKit

extension UICollectionView {
    var fullyVisibleCells : [UICollectionViewCell] {
        return self.visibleCells.filter { cell in
            let cellRect = self.convert(cell.frame, to: self.superview)
            return self.frame.contains(cellRect) }
    }
}
