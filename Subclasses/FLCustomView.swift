import UIKit

class FLCustomVC: UIViewController {

    var panGesture: UIPanGestureRecognizer {
        return generatePanGesture()
    }

    var pinchGestuere: UIPinchGestureRecognizer {
        return generatePinchGestuere()
    }

    var tapGesture: UITapGestureRecognizer {
        return generateTapGesture()
    }

    // Gesture generators

    fileprivate func generatePanGesture() -> UIPanGestureRecognizer {
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        return gesture
    }

    fileprivate func generatePinchGestuere() -> UIPinchGestureRecognizer {
        let gesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinchGesture))
        return gesture
    }

    fileprivate func generateTapGesture() -> UITapGestureRecognizer {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        gesture.numberOfTouchesRequired = 1
        gesture.numberOfTapsRequired = 1
        return gesture
    }

    // MARK: - Target Methods

    @objc func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        guard let selectedView = gesture.view else { return }
        let translation = gesture.translation(in: selectedView)
        selectedView.center = .init(x: selectedView.center.x + translation.x, y: selectedView.center.y + translation.y)
        gesture.setTranslation(.zero, in: view)
    }

    @objc func handlePinchGesture(_ gesture: UIPinchGestureRecognizer) {
        let scale = gesture.scale
        let imageView = gesture.view! // as! UIImageView
        imageView.transform = imageView.transform.scaledBy(x: scale, y: scale)
        gesture.scale = 1

        // check this code again
        view.endEditing(true)
        UIApplication.shared.sendAction(#selector(UIApplication.resignFirstResponder), to: nil, from: nil, for: nil)
    }

    @objc func handleTapGesture(_ gesture: UITapGestureRecognizer) {
        guard let selectedView = gesture.view else { return }
        selectedView.resignFirstResponder()
    }
}
