import UIKit

@available(iOS 14.0, *)
final class PageViewCoordinator: PagingViewControllerDataSource, PagingViewControllerDelegate {
    var parent: PagingControllerRepresentableView

    init(_ pagingController: PagingControllerRepresentableView) {
        parent = pagingController
    }

    func numberOfViewControllers(in _: PagingViewController) -> Int {
        return parent.items.count
    }

    func pagingViewController(
        _: PagingViewController,
        viewControllerAt index: Int
    ) -> UIViewController {
        let item = parent.items[index]
        var hostingViewController: UIViewController

        if let item = item as? PageItem {
            hostingViewController = item.page.content()
        } else if let content = parent.content {
            hostingViewController = content(item)
        } else {
            hostingViewController = UIViewController()
        }

        let backgroundColor = parent.options.pagingContentBackgroundColor
        hostingViewController.view.backgroundColor = backgroundColor
        return hostingViewController
    }

    func pagingViewController(
        _: PagingViewController,
        pagingItemAt index: Int
    ) -> PagingItem {
        parent.items[index]
    }

    func pagingViewController(
        _ controller: PagingViewController,
        didScrollToItem pagingItem: PagingItem,
        startingViewController _: UIViewController?,
        destinationViewController _: UIViewController,
        transitionSuccessful _: Bool
    ) {
        if let item = pagingItem as? PageItem,
           let index = parent.items.firstIndex(where: { $0.isEqual(to: item) }) {
            parent.selectedIndex = index
        }

        parent.onDidScroll?(pagingItem)

    }

    func pagingViewController(
        _: PagingViewController,
        willScrollToItem pagingItem: PagingItem,
        startingViewController _: UIViewController,
        destinationViewController _: UIViewController
    ) {
        parent.onWillScroll?(pagingItem)
    }

    func pagingViewController(
        _: PagingViewController,
        didSelectItem pagingItem: PagingItem
    ) {
        parent.onDidSelect?(pagingItem)
    }
}
