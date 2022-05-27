//
//  CellController.swift
//  ListViewDemo
//
//  Created by Tung Vu on 27/05/2022.
//

import Foundation
import RxSwift

struct CellModel {
    let firstLine: String
    let secondLine: String
    let isThirdLineRestricted: Bool
}

final class CellController {
    let model: CellModel
    private let thirdLineMessageAnalyzer: ThirdLineMessageAnalyzing
    private let disposeBag = DisposeBag()
    private var cell: ListViewCell!
    private var weeklyOperatingHours: ThirdlineModel?
    
    init(
        model: CellModel,
        thirdLineMessageAnalyzer: ThirdLineMessageAnalyzing
    ) {
        self.model = model
        self.thirdLineMessageAnalyzer = thirdLineMessageAnalyzer
    }
    
    func view(from tableView: UITableView) -> ListViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: ListViewCell.self)
        ) as! ListViewCell
        self.cell = cell
        
        cell.selectionStyle = .none
        
        cell.connect(firstLine: model.firstLine, secondLine: model.secondLine, shouldHideThirdLine: model.isThirdLineRestricted)
        
        if !model.isThirdLineRestricted {
            fetchWeeklyOperatingHours(shouldHideThirdLine: model.isThirdLineRestricted)
        }
        
        return cell
    }
    
    private func fetchWeeklyOperatingHours(shouldHideThirdLine: Bool) {
        guard weeklyOperatingHours == nil else {
            configureCellWithOperatingHours(shouldHideThirdLine: shouldHideThirdLine)
            return
        }
        thirdLineMessageAnalyzer.analyze { [weak self] result in
            self?.weeklyOperatingHours = result
            self?.configureCellWithOperatingHours(shouldHideThirdLine: shouldHideThirdLine)
        }
    }
    
    private func configureCellWithOperatingHours(shouldHideThirdLine: Bool) {
        guard let cell = cell else { return }
        let result = weeklyOperatingHours
        if Thread.isMainThread {
            cell.updateThirdlineMessage(result, shouldHideThirdLine)
        } else {
            DispatchQueue.main.async {
                self.cell.updateThirdlineMessage(result, shouldHideThirdLine)
            }
        }
    }
    
    func prefetchWeeklyOperatingHours() {
        guard weeklyOperatingHours == nil else {
            return
        }
        thirdLineMessageAnalyzer.analyze { [weak self] result in
            self?.weeklyOperatingHours = result
        }
    }
    
    func releaseForReuse() {
        cell = nil
    }
    
}
