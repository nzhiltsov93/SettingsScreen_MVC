import UIKit
import SnapKit

class DetailView: UIView {

    func configureView(with cell: Settings) {
        image.image = UIImage(named: cell.icon)
        title.text = cell.title
    }

    // MARK: - Outlets

    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
//MARK: - Lifecycle
    
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
    
//MARK: - Setup
    
    private func setupHierarchy() {
        addSubview(title)
        addSubview(image)
    }
    
    private func setupLayout() {
        image.snp.makeConstraints { make in
            make.centerY.centerX.equalTo(self)
            make.width.height.equalTo(70)
        }
        
        title.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(image.snp.bottom).offset(20)
        }
        
    }
    
}

