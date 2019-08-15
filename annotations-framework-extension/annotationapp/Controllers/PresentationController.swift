import UIKit

class PresentationController: UIPresentationController {
    
    private let dimmedBackgroundView = UIView()
    private let gapHeight: CGFloat = 150.0
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(backgroundTapped))
        self.dimmedBackgroundView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        var frame = CGRect.zero
        
        if let containerBounds = containerView?.bounds {
            frame = CGRect(x: containerBounds.origin.x,
                           y: containerBounds.origin.y + gapHeight,
                           width: containerBounds.width,
                           height: containerBounds.height - gapHeight)
        }
        return frame
    }
    
    override func presentationTransitionWillBegin() {
        if let containerView = self.containerView, let coordinator = presentingViewController.transitionCoordinator {
            containerView.addSubview(self.dimmedBackgroundView)
            self.dimmedBackgroundView.backgroundColor = .black
            self.dimmedBackgroundView.frame = containerView.bounds
            self.dimmedBackgroundView.alpha = 0
            coordinator.animate(alongsideTransition: { _ in
                self.dimmedBackgroundView.alpha = 0.3
            }, completion: nil)
        }
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        if !completed {
            self.dimmedBackgroundView.removeFromSuperview()
        }
    }
    
    @objc private func backgroundTapped() {
        self.presentedViewController.dismiss(animated: true, completion: nil)
    }
}

