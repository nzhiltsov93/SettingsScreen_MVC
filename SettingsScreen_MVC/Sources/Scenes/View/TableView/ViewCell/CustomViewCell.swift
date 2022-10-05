import UIKit
import SnapKit

class CustomViewCell: UITableViewCell {

    static let identifier = "CustomViewCell"

    func configureCell(with model: Settings) {
        settingsImage.image = UIImage(named: model.icon)
        switch model.type {
            case .detail:
                detailLabel.isHidden = false
                notificationImage.isHidden = true
            case .notification:
                detailLabel.isHidden = true
                notificationImage.isHidden = false
            default:
                detailLabel.isHidden = true
                notificationImage.isHidden = true
        }
        title.text = model.title
    }
    
    // MARK: - Outlets
    
    private lazy var settingsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var notificationImage: UIImageView = {
        let image = UIImage(systemName: "1.circle.fill")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemRed
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var stackView: UIStackView = {
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
    
    //MARK: - Setup
    
    private func setupHierarhy() {
        stackView.addArrangedSubview(settingsImage)
        stackView.addArrangedSubview(title)
        addSubview(detailLabel)
        addSubview(stackView)
        addSubview(notificationImage)
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
        
        detailLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(15)
            make.right.equalTo(self).offset(-40)
        }
        
        notificationImage.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.right.equalTo(self).offset(-45)
            make.width.height.equalTo(30)
        }
        
    }
    
    // MARK: - Reuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
    }
    
}
