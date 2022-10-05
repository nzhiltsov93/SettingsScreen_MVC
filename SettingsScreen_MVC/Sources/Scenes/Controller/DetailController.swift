import UIKit

class DetailController: UIViewController {

    var detailSetting: Settings?

    private var detailView: DetailView? {
        guard isViewLoaded else { return nil }
        return view as? DetailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = DetailView()
        configureDetailView()
    }
    
}

extension DetailController {
    func configureDetailView() {
        guard let viewDetail = detailSetting else {return}
        detailView?.configureView(with: viewDetail)
    }
    
}

