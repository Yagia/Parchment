import Parchment
import UIKit

final class WheelViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let viewControllers = [
            ContentViewController(index: 0),
            ContentViewController(index: 1),
            ContentViewController(index: 2),
            ContentViewController(index: 3),
            ContentViewController(index: 4),
            ContentViewController(index: 5),
            ContentViewController(index: 6),
        ]

        let pagingViewController = PagingViewController(viewControllers: viewControllers)
        pagingViewController.menuInteraction = .wheel
        pagingViewController.selectedScrollPosition = .center
        pagingViewController.menuItemSize = .fixed(width: 100, height: 60)

        addChild(pagingViewController)
        view.addSubview(pagingViewController.view)
        view.constrainToEdges(pagingViewController.view)
        pagingViewController.didMove(toParent: self)
    }
}
