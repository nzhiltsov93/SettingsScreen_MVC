import UIKit
import SnapKit

class ProfileViewCell: UITableViewCell {
    
    static let identifier = "ProfileInfoCell"
    
    func configureCell(with model: Settings) {
        settingsImage.image = UIImage(named: model.icon)
        profileLabel.text = model.title
        detailLabel.text = model.detail
    }
    
    // MARK: - Outlets
    
    private lazy var profileLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var settingsImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 35
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var labelsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.distribution = .fill
        return stackView
    }()
    
    // MARK: - Initialize
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierrarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupHierrarchy() {
        addSubview(settingsImage)
        addSubview(labelsStack)
        labelsStack.addArrangedSubview(profileLabel)
        labelsStack.addArrangedSubview(detailLabel)
    }
    
    private func setupLayout() {
        settingsImage.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(20)
            make.left.equalTo(contentView).offset(10)
            make.width.height.equalTo(70)
            make.center.equalTo(contentView)
        }
        
        labelsStack.snp.makeConstraints { make in
            make.left.equalTo(settingsImage.snp.right).offset(10)
            make.centerY.equalTo(contentView)
        }
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
    }
    
}
