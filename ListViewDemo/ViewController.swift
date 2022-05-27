//
//  ViewController.swift
//  ListViewDemo
//
//  Created by Tung Vu on 27/05/2022.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    
    @IBAction func listViewTapped(_ sender: Any) {
        let vm = ListViewModel(cellViewModels: createCellControllers())
        let listView = ListViewController(viewModel: vm)
        
        navigationController?.pushViewController(listView, animated: true)
    }
    
    
    func createCellControllers() -> [CellController] {
        return [
            CellController(
                model: .init(firstLine: "free to use", secondLine: "free & paid", isThirdLineRestricted: false),
                thirdLineMessageAnalyzer: DummyThirdLineMessageAnalyzer(expectedResult: "free until 9pm")),
            CellController(
                model: .init(firstLine: "free to use", secondLine: "free & paid", isThirdLineRestricted: false),
                thirdLineMessageAnalyzer: DummyThirdLineMessageAnalyzer(expectedResult: "free until 9pm")),
            CellController(
                model: .init(firstLine: "free to use", secondLine: "free & paid", isThirdLineRestricted: false),
                thirdLineMessageAnalyzer: DummyThirdLineMessageAnalyzer(expectedResult: "free until 9pm")),
            CellController(
                model: .init(firstLine: "free to use", secondLine: "free & paid", isThirdLineRestricted: false),
                thirdLineMessageAnalyzer: DummyThirdLineMessageAnalyzer(expectedResult: "free until 9pm")),
            CellController(
                model: .init(firstLine: "free to use", secondLine: "free & paid", isThirdLineRestricted: false),
                thirdLineMessageAnalyzer: DummyThirdLineMessageAnalyzer(expectedResult: "free all times")),
            CellController(
                model: .init(firstLine: "free to use", secondLine: "free & paid", isThirdLineRestricted: false),
                thirdLineMessageAnalyzer: DummyThirdLineMessageAnalyzer(expectedResult: "free until 9pm")),
            CellController(
                model: .init(firstLine: "free to use", secondLine: "free & paid", isThirdLineRestricted: false),
                thirdLineMessageAnalyzer: DummyThirdLineMessageAnalyzer(expectedResult: "free all times")),
            CellController(
                model: .init(firstLine: "free to use", secondLine: "free & paid", isThirdLineRestricted: false),
                thirdLineMessageAnalyzer: DummyThirdLineMessageAnalyzer(expectedResult: "free until 9pm")),
            CellController(
                model: .init(firstLine: "free to use", secondLine: "free & paid", isThirdLineRestricted: false),
                thirdLineMessageAnalyzer: DummyThirdLineMessageAnalyzer(expectedResult: "free all times")),
            CellController(
                model: .init(firstLine: "free to use", secondLine: "free & paid", isThirdLineRestricted: false),
                thirdLineMessageAnalyzer: DummyThirdLineMessageAnalyzer(expectedResult: "free until 9pm")),
            CellController(
                model: .init(firstLine: "free to use", secondLine: "free & paid", isThirdLineRestricted: false),
                thirdLineMessageAnalyzer: DummyThirdLineMessageAnalyzer(expectedResult: "free until 9pm")),
            CellController(
                model: .init(firstLine: "free to use", secondLine: "free & paid", isThirdLineRestricted: false),
                thirdLineMessageAnalyzer: DummyThirdLineMessageAnalyzer(expectedResult: "free until 9pm")),
            CellController(
                model: .init(firstLine: "free to use", secondLine: "free & paid", isThirdLineRestricted: false),
                thirdLineMessageAnalyzer: DummyThirdLineMessageAnalyzer(expectedResult: "free until 9pm")),
            CellController(
                model: .init(firstLine: "free to use", secondLine: "free & paid", isThirdLineRestricted: false),
                thirdLineMessageAnalyzer: DummyThirdLineMessageAnalyzer(expectedResult: "free all times")),
            CellController(
                model: .init(firstLine: "free to use", secondLine: "free & paid", isThirdLineRestricted: false),
                thirdLineMessageAnalyzer: DummyThirdLineMessageAnalyzer(expectedResult: "free all times")),
            CellController(
                model: .init(firstLine: "free to use", secondLine: "free & paid", isThirdLineRestricted: false),
                thirdLineMessageAnalyzer: DummyThirdLineMessageAnalyzer(expectedResult: "free all times")),
            CellController(
                model: .init(firstLine: "free to use", secondLine: "free & paid", isThirdLineRestricted: false),
                thirdLineMessageAnalyzer: DummyThirdLineMessageAnalyzer(expectedResult: "free until 9pm")),
            CellController(
                model: .init(firstLine: "free to use", secondLine: "free & paid", isThirdLineRestricted: false),
                thirdLineMessageAnalyzer: DummyThirdLineMessageAnalyzer(expectedResult: "free all times")),
            CellController(
                model: .init(firstLine: "free to use", secondLine: "free & paid", isThirdLineRestricted: false),
                thirdLineMessageAnalyzer: DummyThirdLineMessageAnalyzer(expectedResult: "free all times")),
            CellController(
                model: .init(firstLine: "free to use", secondLine: "free & paid", isThirdLineRestricted: false),
                thirdLineMessageAnalyzer: DummyThirdLineMessageAnalyzer(expectedResult: "free all times"))
        ]
        
    }
    
}

