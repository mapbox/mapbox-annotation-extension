import Foundation
import UIKit

class PresentationControllerDelegate: NSObject, UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let customPresentationController = PresentationController(presentedViewController:presented, presenting:presenting)
        
        return customPresentationController
    }
}
