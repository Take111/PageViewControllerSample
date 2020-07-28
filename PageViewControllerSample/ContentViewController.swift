//
//  ContentViewController.swift
//  PageViewControllerSample
//
//  Created by 竹ノ内愛斗 on 2020/07/28.
//  Copyright © 2020 竹ノ内愛斗. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    private let contentType: BasePageViewController.Content

    init(type: BasePageViewController.Content) {
        contentType = type
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(titleLabel)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        titleLabel.frame.size = titleLabel.sizeThatFits(.zero)
        titleLabel.frame.origin.x = (view.bounds.width - titleLabel.frame.size.width) / 2
        titleLabel.frame.origin.y = (view.bounds.height - titleLabel.frame.size.height) / 2
    }


    private lazy var titleLabel: UILabel = {
        let v = UILabel()
        v.text = contentType.title
        v.textColor = .black
        return v
    }()
}
