//
//  ThirdLineMessageAnalyzing.swift
//  ListViewDemo
//
//  Created by Tung Vu on 27/05/2022.
//

import Foundation

struct ThirdlineModel {
    let text: String
}

protocol ThirdLineMessageAnalyzing {
  func analyze(completion: @escaping (ThirdlineModel?) -> Void)
}


final class DummyThirdLineMessageAnalyzer: ThirdLineMessageAnalyzing {
    private let expectedResult: String?
    init(expectedResult: String?) {
        self.expectedResult = expectedResult
    }
    
    func analyze(completion: @escaping (ThirdlineModel?) -> Void) {
        let delay = TimeInterval.random(in: 1..<2)
        DispatchQueue.global().asyncAfter(deadline: .now() + delay) {
            completion(self.expectedResult == nil ? nil : .init(text: self.expectedResult!))
        }
    }
    
}

