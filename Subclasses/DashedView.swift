import UIKit

class DashedView: MainView {

    //var path: UIBezierPath!
    lazy var path = UIBezierPath(roundedRect: bounds, cornerRadius: 0)
    
    func drawDashLinesXX() {

        UIColor.white.setFill()
        path.fill()

        UIColor.lightGray.setStroke()
        path.lineWidth = 2

        let dashPattern : [CGFloat] = [10, 10]
        path.setLineDash(dashPattern, count: 2, phase: 0)
        path.stroke()
    }
    
    func showDash() {
        path.lineWidth = 2
    }
    
    func hideDash() {
        path.lineWidth = 0
    }
}
