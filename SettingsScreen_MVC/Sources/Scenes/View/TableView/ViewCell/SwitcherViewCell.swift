import UIKit
import SnapKit

class SwitcherViewCell: UITableViewCell {

    static let identifier = "SwitchCell"

    func configureCell(with model: Settings) {
        settingsImage.image = UIImage(named: model.icon)
        title.text = model.title
    }
    
    //MARK: - Outlets
        
    private lazy var settingsImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
        
    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
        
    private lazy var switchButton: UISwitch = {
        let switchButton = UISwitch()
        switchButton.setOn(false, animated: true)
        return switchButton
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fill
        return stackView
    }()
    
    //MARK: - Initializers
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarhy()
        setupLayout()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarhy() {
        stackView.addArrangedSubview(settingsImage)
        stackView.addArrangedSubview(title)
        addSubview(stackView)
        contentView.addSubview(switchButton)
    }
    
    private func setupLayout() {
        stackView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.left.equalTo(contentView).offset(10)
            make.center.equalTo(contentView)
        }
        
        settingsImage.snp.makeConstraints { make in
            make.height.width.equalTo(30)
        }
        
        switchButton.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.right.equalTo(self).offset(-20)
        }
        
    }
    
    // MARK: - Reuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
    }

}
