//
//  ViewController.swift
//  URLSession
//
//  Created by Aslanli Faqan on 22.11.24.
//

import UIKit

final class ViewController: UIViewController {
    private let viewModel: ViewModel
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        // Do any additional setup after loading the view.
    }


}

