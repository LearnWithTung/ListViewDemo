//
//  ListViewModel.swift
//  ListViewDemo
//
//  Created by Tung Vu on 27/05/2022.
//

import Foundation

import Foundation
import RxSwift
import RxCocoa

final class ListViewModel {
    // MARK: - Properties
    private let disposeBag = DisposeBag()
    
    private let rowViewModelsRelay: BehaviorRelay<[CellController]>
    var rowViewModels: Driver<[CellController]> {
        return rowViewModelsRelay.asDriver()
    }
    
    
    // MARK: - Object Life Cycle
    
    init(
        cellViewModels: [CellController]
    ) {
        self.rowViewModelsRelay = .init(value: cellViewModels)
    }
    
    
    func cellController(at index: Int) -> CellController? {
        guard index < rowViewModelsRelay.value.count else { return nil }
        return rowViewModelsRelay.value[index]
    }
}
