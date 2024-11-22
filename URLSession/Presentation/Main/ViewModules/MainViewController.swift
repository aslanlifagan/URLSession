//
//  MainViewController.swift
//  URLSession
//
//  Created by Aslanli Faqan on 22.11.24.
//

import UIKit

final class MainViewController: BaseViewController {
    private lazy var table: UITableView = {
       let t = UITableView()
        t.delegate = self
        t.dataSource = self
        t.register(cell: TitleSubtitleCell.self)
        t.separatorStyle = .none
        return t
    }()

    private lazy var loadingView: UIActivityIndicatorView = {
        let v = UIActivityIndicatorView(style: .large)
        v.tintColor = .red
        return v
    }()
    
    private let viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureView() {
        super.configureView()
        view.addSubViews(table, loadingView)
    }
    
    override func configureConstraint() {
        super.configureConstraint()
        table.fillSuperview(padding: .init(all: 24))
        loadingView.fillSuperview()
    }
    
    override func configureTargets() {
        super.configureTargets()
    }
        
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        viewModel.getItems()
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: TitleSubtitleCell.self, for: indexPath)
        guard let item = viewModel.getProtocol(index: indexPath.row) else {return UITableViewCell()}
        cell.configureCell(model: item)
        return cell
    }
}