//
//  CountryDetailController.swift
//  URLSession
//
//  Created by Aslanli Faqan on 07.12.24.
//

import UIKit

final class CountryDetailController: BaseViewController {
    
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
    
    private let viewModel: CountryDetailViewModel
    
    init(viewModel: CountryDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
    }
    
    override func configureView() {
        super.configureView()
        view.addSubViews(loadingView, submitButton)
    }
    
    override func configureConstraint() {
        super.configureConstraint()
        loadingView.fillSuperview()
        submitButton.anchor(
            leading: view.leadingAnchor,
            bottom: view.safeAreaLayoutGuide.bottomAnchor,
            trailing: view.trailingAnchor,padding: .init(all: 20))
    }
    
    override func configureTargets() {
        super.configureTargets()
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
                        print(#function, state)
                    case .error(let message):
                        self.showMessage(title: "Xeta", message: message)
                }
            }
        }
    }
}
