import UIKit

class ResizableVC: UIViewController {
    
    // MARK: - Properties
    
    var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.constrainWidth(constant: 400)
        view.constrainHeight(constant: 400)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var topConstraint: NSLayoutConstraint!
    var rightConstraint: NSLayoutConstraint!
    var leftConstraint: NSLayoutConstraint!
    var bottomConstraint: NSLayoutConstraint!
    
    var touchStart = CGPoint.zero
    var proxyFactor = CGFloat(10)
    var resizeRect = ResizeRect()
    
    struct ResizeRect{
        var topTouch = false
        var leftTouch = false
        var rightTouch = false
        var bottomTouch = false
        var middelTouch = false
    }
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .orange
        view.addSubview(contentView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        topConstraint = contentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20)
        rightConstraint = contentView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 20)
        leftConstraint = contentView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        bottomConstraint = contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20)
        
        [topConstraint, rightConstraint, leftConstraint, bottomConstraint].forEach { $0?.isActive = true }
    }
    
}

extension ResizableVC {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            
            let touchStart = touch.location(in: self.view)
            print(touchStart)
            
            resizeRect.topTouch = false
            resizeRect.leftTouch = false
            resizeRect.rightTouch = false
            resizeRect.bottomTouch = false
            resizeRect.middelTouch = false
            
            if  touchStart.y > contentView.frame.minY + (proxyFactor*2) &&  touchStart.y < contentView.frame.maxY - (proxyFactor*2) &&  touchStart.x > contentView.frame.minX + (proxyFactor*2) &&  touchStart.x < contentView.frame.maxX - (proxyFactor*2){
                resizeRect.middelTouch = true
                print("middle")
                return
            }
            
            // checks if the bottom part of the view is tapped
            if touchStart.y > contentView.frame.maxY - proxyFactor &&  touchStart.y < contentView.frame.maxY + proxyFactor {
                resizeRect.bottomTouch = true
                print("bottom")
            }
            
            if touchStart.x > contentView.frame.maxX - proxyFactor && touchStart.x < contentView.frame.maxX + proxyFactor {
                resizeRect.rightTouch = true
                print("right")
            }
            
            if touchStart.x > contentView.frame.minX - proxyFactor &&  touchStart.x < contentView.frame.minX + proxyFactor {
                resizeRect.leftTouch = true
                print("left")
            }
            
            if touchStart.y > contentView.frame.minY - proxyFactor &&  touchStart.y < contentView.frame.minY + proxyFactor {
                resizeRect.topTouch = true
                print("top")
            }
            
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            let currentTouchPoint = touch.location(in: self.view)
            let previousTouchPoint = touch.previousLocation(in: self.view)
            
            let deltaX = currentTouchPoint.x - previousTouchPoint.x
            let deltaY = currentTouchPoint.y - previousTouchPoint.y
            
            
            if resizeRect.middelTouch{
                topConstraint.constant += deltaY
                leftConstraint.constant += deltaX
                rightConstraint.constant += deltaX
                bottomConstraint.constant += deltaY
            }
            
            if resizeRect.topTouch {
                topConstraint.constant += deltaY
            }
            
            if resizeRect.leftTouch {
                leftConstraint.constant += deltaX
            }
            if resizeRect.rightTouch {
                rightConstraint.constant += deltaX
            }
            if resizeRect.bottomTouch {
                bottomConstraint.constant += deltaY
            }
            
            UIView.animate(withDuration: 0.25, delay: 0, options: UIView.AnimationOptions.curveEaseIn, animations: {
                self.view.layoutIfNeeded()
            }, completion: { (ended) in
                
            })
        }
    }
    
}
