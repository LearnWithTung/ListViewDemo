//
//  HeaderWithDetailsView.swift
//  ListViewDemo
//
//  Created by Tung Vu on 27/05/2022.
//

import UIKit

class HeaderWithDetailsView: UIView {
    
    // MARK: - Properties
    
    private let headerView = HeaderView()
    
    var iconImageView: UIImageView { headerView.iconImageView }
    var сostLabel: UILabel { headerView.costLabel }
    var сostDurationLabel: UILabel { headerView.сostDurationLabel }
    var typeLabel: UILabel { headerView.typeLabel }
    var detailsLabelContainer: RoundedContainerView<UILabel> { headerView.detailsContainer }
    var detailsLabel: UILabel { detailsLabelContainer.contentView }
    let shimmeringView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = 6
        return view
    }()
    
    // MARK: - Object Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupHeaderView()
        setupShimmeringView()
    }
}

private extension HeaderWithDetailsView {
    func setupHeaderView() {
        setupLayoutFor(headerView: headerView)
    }
    
    func setupLayoutFor(headerView view: UIView) {
        view.snp_makeConstraints(withIn: self) {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - Shimmering View Setup
private extension HeaderWithDetailsView {
    func setupShimmeringView() {
        let shimmeringSize = CGSize(width: 200, height: 29)
        shimmeringView.snp_makeConstraints(withIn: self) {
            $0.top.leading.equalTo(headerView.detailsContainer)
            $0.width.equalTo(shimmeringSize.width)
            $0.height.equalTo(shimmeringSize.height)
            $0.bottom.equalToSuperview()
        }
        shimmeringView.startShimmering(size: shimmeringSize)
    }
}

class HeaderView: UIView {
    
    // MARK: Properties
    
    private let titleView = TitleView()
    
    let iconImageView = UIImageView()
    var costLabel: UILabel { titleView.costLabel }
    var сostDurationLabel: UILabel { titleView.durationLabel }
    var typeLabel: UILabel { titleView.typeLabel }
    var detailsContainer: RoundedContainerView<UILabel> { titleView.detailsContainer }
    
    // MARK: - Object Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupIconImageView()
        setupTitleView()
    }
}

private extension HeaderView {
    
    func setupIconImageView() {
        setupLayoutFor(imageView: iconImageView)
        setupAppearanceFor(imageView: iconImageView)
    }
    
    func setupAppearanceFor(imageView view: UIView) {
        view.tintColor = .white
        view.layer.cornerRadius = 8
    }
    
    func setupLayoutFor(imageView view: UIView) {
        view.snp_makeConstraints(withIn: self) {
            $0.leading.top.equalToSuperview()
            $0.width.height.equalTo(50)
        }
    }
}

// MARK: - Title View Setup
private extension HeaderView {
    
    func setupTitleView() {
        setupLayoutFor(titleView: titleView)
    }
    
    func setupLayoutFor(titleView view: UIView) {
        view.snp_makeConstraints(withIn: self) {
            $0.leading.equalTo(iconImageView.snp.trailing).offset(15)
            $0.top.equalTo(iconImageView.snp.top)
            $0.trailing.lessThanOrEqualToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}

class TitleView: UIView {
    
    // MARK: - Properties
    private let stackView: UIStackView = {
        let result = UIStackView()
        result.axis = .vertical
        result.alignment = .leading
        return result
    }()
    
    private let costView: CostView = CostView()
    var costLabel: UILabel { costView.costLabel }
    var durationLabel: UILabel { costView.durationLabel }
    let typeLabel = UILabel()
    let detailsContainer = RoundedContainerView<UILabel>()
    
    // MARK: - Object Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupStackView()
        setupCostView()
        setupTypeLabel()
        setupDetailsLabel()
    }
}

private extension TitleView {
    func setupStackView() {
        stackView.snp_makeConstraints(withIn: self) {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - Cost View Setup
private extension TitleView {
    
    func setupCostView() {
        stackView.addArrangedSubview(costView)
    }
    
    func setupLayoutFor(costView view: UIView) {
        view.snp_makeConstraints(withIn: self) {
            $0.top.leading.trailing.equalToSuperview()
        }
    }
}

// MARK: - Type Label Setup
private extension TitleView {
    
    func setupTypeLabel() {
        stackView.addArrangedSubview(typeLabel)
        stackView.setCustomSpacing(6, after: typeLabel)
        setupAppearanceFor(typeLabel: typeLabel)
    }
    
    func setupLayoutFor(typeLabel view: UIView) {
        view.snp_makeConstraints(withIn: self) {
            $0.top.equalTo(costView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setupAppearanceFor(typeLabel label: UILabel) {
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.gray
    }
}

private extension TitleView {
    func setupDetailsLabel() {
        stackView.addArrangedSubview(detailsContainer)
        setupAppearanceFor(detailsLabel: detailsContainer.contentView)
    }
    
    func setupAppearanceFor(detailsLabel label: UILabel) {
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.gray
        label.numberOfLines = 0
    }
}

class RoundedContainerView<ContentView: UIView>: UIView {
    
    let contentView = ContentView()
    private let contentViewContainer = UIView()
    
    // MARK: - Object Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        contentView.snp_makeConstraints(withIn: self) {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10))
        }
        layer.cornerRadius = 8
    }
}

class CostView: UIView {
    
    // MARK: - Properties
    
    let costLabel: UILabel = UILabel()
    let durationLabel: UILabel = UILabel()
    
    // MARK: - Object Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupCostLabel()
        setupDurationLabel()
    }
}

// MARK: - Cost Label Setup
private extension CostView {
    
    func setupCostLabel() {
        setupLayoutFor(costLabel: costLabel)
        setupAppearanceFor(costLabel: costLabel)
    }
    
    func setupAppearanceFor(costLabel label: UILabel) {
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 20)
    }
    
    func setupLayoutFor(costLabel view: UIView) {
        view.snp_makeConstraints(withIn: self) { $0.leading.top.bottom.equalToSuperview() }
    }
}

// MARK: - Duration Label Setup
private extension CostView {
    
    func setupDurationLabel() {
        setupLayoutFor(durationLabel: durationLabel)
        setupAppearanceFor(durationLabel: durationLabel)
    }
    
    func setupAppearanceFor(durationLabel label: UILabel) {
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 20)
    }
    
    func setupLayoutFor(durationLabel view: UIView) {
        view.snp_makeConstraints(withIn: self) {
            $0.leading.equalTo(costLabel.snp.trailing).offset(8)
            $0.trailing.equalToSuperview()
            $0.lastBaseline.equalTo(costLabel.snp.lastBaseline)
        }
    }
}
