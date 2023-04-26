import UIKit
import SwiftUI

@available(iOS 14.0, *)
struct PagingControllerRepresentableView: UIViewControllerRepresentable {
    let items: [PagingItem]
    let content: ((PagingItem) -> UIViewController)?
    let options: PagingOptions
    var onWillScroll: ((PagingItem) -> Void)?
    var onDidScroll: ((PagingItem) -> Void)?
    var onDidSelect: ((PagingItem) -> Void)?

    @Binding var selectedIndex: Int

    func makeCoordinator() -> PageViewCoordinator {
        PageViewCoordinator(self)
    }

    func makeUIViewController(
        context: UIViewControllerRepresentableContext<PagingControllerRepresentableView>
    ) -> PagingViewController {
        let pagingViewController = PagingViewController(options: options)
        pagingViewController.dataSource = context.coordinator
        pagingViewController.delegate = context.coordinator

        if let items = items as? [PageItem] {
            for item in items {
                pagingViewController.collectionView.register(
                    PageItemCell.self,
                    forCellWithReuseIdentifier: item.page.reuseIdentifier
                )
            }
        }

        return pagingViewController
    }

    func updateUIViewController(
        _ pagingViewController: PagingViewController,
        context: UIViewControllerRepresentableContext<PagingControllerRepresentableView>
    ) {
        context.coordinator.parent = self

        if pagingViewController.dataSource == nil {
            pagingViewController.dataSource = context.coordinator
        }

        pagingViewController.reloadData()

        // HACK: If the user don't pass a selectedIndex binding, the
        // default parameter is set to .constant(Int.max) which allows
        // us to check here if a binding was passed in or not (it
        // doesn't seem possible to make the binding itself optional).
        // This check is needed because we cannot update a .constant
        // value. When the user scroll to another page, the
        // selectedIndex binding will always be the same, so calling
        // `select(index:)` will select the wrong page. This fixes a bug
        // where the wrong page would be selected when rotating.
        guard selectedIndex != Int.max else {
            return
        }

        pagingViewController.select(index: selectedIndex, animated: true)
    }
}
