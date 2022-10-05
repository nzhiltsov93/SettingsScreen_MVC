import UIKit
import SnapKit

class SettingsView: UIView {

    func configureView(with model: [[Settings]]) {
        self.settings = model
    }

    private var settings = [[Settings]]()

    // MARK: - Outlets

    lazy var settingsTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.register(ProfileViewCell.self, forCellReuseIdentifier: ProfileViewCell.identifier)
        table.register(SwitcherViewCell.self, forCellReuseIdentifier: SwitcherViewCell.identifier)
        table.register(CustomViewCell.self, forCellReuseIdentifier: CustomViewCell.identifier)
        return table
    }()

    // MARK: - Lifecycle

    init() {
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setups

    func setupHierarchy() {
        addSubview(settingsTable)
    }

    func setupLayout() {
        settingsTable.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(self)
        }
    }
}
