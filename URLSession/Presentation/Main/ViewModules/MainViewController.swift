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
    
    private lazy var submitButton: UIButton = {
        let b = UIButton()
        b.setTitle("Create", for: .normal)
        b.backgroundColor = .red
        b.titleLabel?.textColor = .white
        b.anchorSize(.init(width: 0, height: 56))
        return b
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
        configureViewModel()
        //                viewModel.getCommentList()
        //        viewModel.getCommentWithPost()
        viewModel.getPostList()
    }
    
    override func configureView() {
        super.configureView()
        view.addSubViews(table, loadingView, submitButton)
    }
    
    override func configureConstraint() {
        super.configureConstraint()
        table.fillSuperview(padding: .init(all: 24))
        loadingView.fillSuperview()
        submitButton.anchor(
            leading: view.leadingAnchor,
            bottom: view.safeAreaLayoutGuide.bottomAnchor,
            trailing: view.trailingAnchor,padding: .init(all: 20))
    }
    
    override func configureTargets() {
        super.configureTargets()
        submitButton.addTarget(self, action: #selector(submitButtonClicked), for: .touchUpInside)
    }
    
    @objc func submitButtonClicked() {
        viewModel.createPost()
        print(#function)
    }
    fileprivate func configureViewModel() {
        
        viewModel.listener = { [weak self] state in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch state {
                    case .loading:
                        self.loadingView.startAnimating()
                    case .loaded:
                        self.loadingView.stopAnimating()
                    case .success:
                        self.table.reloadData()
                    case .error(let message):
                        self.showMessage(title: "Xeta", message: message)
                }
            }
        }
    }
}
//MARK: UITableViewDelegate,UITableViewDataSource
extension MainViewController: UITableViewDelegate,
                              UITableViewDataSource {
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
