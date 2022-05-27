//
//  ListViewController.swift
//  ListViewDemo
//
//  Created by Tung Vu on 27/05/2022.
//

import Foundation

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import RxDataSources

final class ListViewController: UIViewController {
    
    // MARK: - Properties
    
    let viewModel: ListViewModel
    private let disposeBag = DisposeBag()
    
    // MARK: - Header
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        let cellType = ListViewCell.self
        tableView.register(cellType, forCellReuseIdentifier: String(describing: cellType))
        tableView.separatorStyle = .none
        return tableView
    }()
    
    // MARK: - Life Cycle
    
    init(viewModel: ListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureLayout()
        setupBindings()
        
        self.edgesForExtendedLayout = []
    }
    
    private func setupBindings() {
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        
        viewModel
            .rowViewModels
            .drive(tableView.rx.items) { (tableView, index, cellController) in
                let cell = cellController.view(from: tableView)
                print("Cell being initiated at \(index)")
                return cell
            }
            .disposed(by: disposeBag)
    }
    
    private func configureLayout() {
        tableView.snp_makeConstraints(withIn: view) {
            $0.top.leading.trailing.bottom.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-450)
        }
    }
}

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cellController = viewModel.cellController(at: indexPath.row)
        cellController?.releaseForReuse()
        print("didEndDisplaying at \(indexPath.row)")
    }
}
