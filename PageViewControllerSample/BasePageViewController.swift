//
//  PageViewController.swift
//  PageViewControllerSample
//
//  Created by 竹ノ内愛斗 on 2020/07/28.
//  Copyright © 2020 竹ノ内愛斗. All rights reserved.
//

import UIKit

class BasePageViewController: UIViewController {

    enum Content: CaseIterable {
        case first, second, third

        var title: String {
            switch self {
            case .first:
                return "1番目のViewController"
            case .second:
                return "2番目のViewController"
            case .third:
                return "3番目のViewController"
            }
        }

        func instantiated() -> UIViewController {
            switch self {
            case .first:
                return ContentViewController(type: self)
            case .second:
                return ContentViewController(type: self)
            case .third:
                return ContentViewController(type: self)
            }
        }
    }

    private lazy var viewControllers: [UIViewController] = {
        return Content.allCases.map{ $0.instantiated() }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)

        pageViewController.setViewControllers([viewControllers[0]], direction: .forward, animated: true)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        pageViewController.view.frame.origin.x = .zero
        pageViewController.view.frame.origin.y = .zero
        pageViewController.view.frame.size.width = view.bounds.width
        pageViewController.view.frame.size.height = view.bounds.height
    }

    private lazy var pageViewController: UIPageViewController = {
        let v = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        v.dataSource = self
        return v
    }()
}

extension BasePageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController) else {
            return nil
        }
        if index > 0 {
            return viewControllers[index - 1]
        }
        else {
            return nil
        }
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController) else {
            return nil
        }
        if index < viewControllers.count - 1 {
            return viewControllers[index + 1]
        }
        else {
            return nil
        }
    }
}
