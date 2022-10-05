import UIKit

class MainController: UIViewController {

    var model = [[Settings]]()

    private var settingsView: SettingsView? {
        guard isViewLoaded else { return nil }
        return view as? SettingsView
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = SettingsView()
        model = Settings.settings
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
        configureSettingView()
        configureTable()
    }
}
    // MARK: - MainController Extension
extension MainController {
    func configureSettingView() {
        settingsView?.configureView(with: model)
    }
}

extension MainController {
    func configureTable() {
        settingsView?.settingsTable.dataSource = self
        settingsView?.settingsTable.delegate = self
    }
}

    // MARK: - Table extensions

extension MainController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = model[indexPath.section][indexPath.row]
        switch cell.type {
            case .title:
                return 120
            default:
                return 50
        }
    }
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.count
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = model[indexPath.section][indexPath.row]
        switch cell.type {
        
        case .title:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileViewCell.identifier, for: indexPath) as? ProfileViewCell
            cell?.configureCell(with: model[indexPath.section][indexPath.row])
            cell?.accessoryType = .disclosureIndicator
            return cell ?? UITableViewCell()
        case .switcher:
            let cell = tableView.dequeueReusableCell(withIdentifier: SwitcherViewCell.identifier, for: indexPath) as? SwitcherViewCell
            cell?.configureCell(with: model[indexPath.section][indexPath.row])
            cell?.selectionStyle = .none
            return cell ?? UITableViewCell()
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomViewCell.identifier, for: indexPath) as? CustomViewCell
            cell?.configureCell(with: model[indexPath.section][indexPath.row])
            cell?.accessoryType = .disclosureIndicator
            return cell ?? UITableViewCell()
        }
    }
    
}
