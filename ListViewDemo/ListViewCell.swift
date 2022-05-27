//
//  ListViewCell.swift
//  ListViewDemo
//
//  Created by Tung Vu on 27/05/2022.
//

import UIKit
import SnapKit

final class ListViewCellContentView: UIView {
    let topView: HeaderWithDetailsView = {
        let header = HeaderWithDetailsView()
        return header
    }()
    
    init() {
        super.init(frame: .zero)
        
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        topView.snp_makeConstraints(withIn: self) {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-20)
        }
    }
    
    func fillContent(
        firstLine: String,
        secondLine: String,
        shouldHideThirdLine: Bool
    ) {
        updateThirdLineMessage(nil, shouldHideThirdLine)
        topView.сostLabel.text = firstLine
        topView.typeLabel.text = secondLine
        topView.iconImageView.backgroundColor = .yellow
        
        setNeedsLayout()
    }
    
    func updateThirdLineMessage(
        _ info: ThirdlineModel?,
        _ shouldHideThirdLine: Bool
    ) {
        if shouldHideThirdLine {
            topView.shimmeringView.isHidden = true
            topView.detailsLabel.text = nil
            topView.detailsLabelContainer.backgroundColor = nil
            topView.detailsLabelContainer.isHidden = true
        } else {
            topView.shimmeringView.isHidden = info != nil
            topView.detailsLabel.text = info?.text
            topView.detailsLabelContainer.backgroundColor = info == nil ? .clear : .red
            topView.detailsLabelContainer.isHidden = false
        }
        setNeedsLayout()
    }
    
}


final class ListViewCell: UITableViewCell {
    let contentContainer = ListViewCellContentView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLayout() {
        contentView.addSubview(contentContainer)
        contentContainer.snp.makeConstraints {
            $0.top.bottom.left.right.equalToSuperview()
        }
    }
    
    func connect(
        firstLine: String,
        secondLine: String,
        shouldHideThirdLine: Bool
    ) {
        contentContainer.fillContent(firstLine: firstLine, secondLine: secondLine, shouldHideThirdLine: shouldHideThirdLine)
    }
    
    func updateThirdlineMessage(
        _ result: ThirdlineModel?,
        _ shouldHideThirdLine: Bool
    ) {
        contentContainer.updateThirdLineMessage(result, shouldHideThirdLine)
    }
    
}
