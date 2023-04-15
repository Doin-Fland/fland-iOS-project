import UIKit
import RxSwift
import RxCocoa

class HomeDetailTabView: UIViewController {
    //MARK: - Properties
    private let titles = ["내 업무", "비용"]
    private let disposeBag = DisposeBag()
    private var currentViewController: UIViewController?
    
    // Navigation item 담을 뷰
    private lazy var navItemContainerView: UIView = {
        let container = UIView()
        container.backgroundColor = .clear
        return container
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.backward")?.withTintColor(ColorSet.grey_600!, renderingMode: .alwaysOriginal), for: .normal)
        return button
    }()

    // SegmentControl 담을 뷰
    private lazy var segmentContainerView: UIView = {
        let container = UIView()
        container.backgroundColor = .clear
        return container
    }()
    
    // VC 담을 뷰
    private lazy var VCContainerView: UIView = {
        let container = UIView()
        container.backgroundColor = .clear
        return container
    }()
    
    private lazy var segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: titles)
        segment.selectedSegmentTintColor = .clear
        //배경 색 제거
        segment.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        // Segment 구분 라인 제거
        segment.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
        segment.selectedSegmentIndex = 0
        
        // 선택 되어 있지 않을때 폰트 및 폰트컬러
        segment.setTitleTextAttributes([
          NSAttributedString.Key.foregroundColor: ColorSet.grey_700!,
          NSAttributedString.Key.font: UIFont.spoqa(15, .regular)
        ], for: .normal)

        // 선택 되었을때 폰트 및 폰트컬러
        segment.setTitleTextAttributes([
          NSAttributedString.Key.foregroundColor: ColorSet.grey_1000!,
          NSAttributedString.Key.font: UIFont.spoqa(15, .bold)
        ], for: .selected)
        
        return segment
    }()
    
    private lazy var underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorSet.grey_100
        return view
    }()
    
    private lazy var selectedUnderLineView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorSet.grey_1000
        return view
    }()
    
    private lazy var floatingButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 25
        button.addShadow(color: .black, radius: 15, offset: CGSize(width: 0, height: 0), opacity: 0.1)
        return button
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        rxActionSetup()
    }
    
    //MARK: - Action
    private func rxActionSetup() {
        segmentControl.rx.selectedSegmentIndex
            .bind { [weak self] index in
                guard let self = self else { return }
                self.switchToViewController(at: index)
                
                self.selectedUnderLineView.snp.updateConstraints({ make in
                    make.leading.equalTo(self.segmentControl.snp.leading).offset(CGFloat(index) * self.segmentControl.frame.size.width  / CGFloat(self.titles.count))
                })
                self.view.layoutIfNeeded()
            }
            .disposed(by: disposeBag)

        backButton.rx.tap
            .bind { [weak self] in
                self?.navigationController?.popViewController(animated: true)
            }
            .disposed(by: disposeBag)
        
        floatingButton.rx.tap
            .bind { [weak self] in
                print("floatingButton tapped")
            }
            .disposed(by: disposeBag)
    }
    
    //MARK: - Helpers
    private func setupLayout() {
        view.addSubview(navItemContainerView)
        view.addSubview(segmentContainerView)
        view.addSubview(VCContainerView)
        view.addSubview(floatingButton)

        navItemContainerView.addSubview(backButton)
        segmentContainerView.addSubview(segmentControl)
        segmentContainerView.addSubview(underLineView)
        segmentContainerView.addSubview(selectedUnderLineView)
        
        navItemContainerView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(40)
        }
        
        backButton.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(8)
            make.leading.equalToSuperview().inset(16)
        }
        
        segmentContainerView.snp.makeConstraints { make in
            make.top.equalTo(navItemContainerView.snp.bottom)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.height.equalTo(44)
        }
        
        VCContainerView.snp.makeConstraints { make in
               make.top.equalTo(segmentContainerView.snp.bottom)
               make.leading.trailing.bottom.equalToSuperview()
        }
        
        segmentControl.snp.makeConstraints { make in
            make.top.equalTo(segmentContainerView.snp.top)
            make.leading.equalTo(segmentContainerView.snp.leading)
            make.centerX.equalTo(segmentContainerView.snp.centerX)
            make.centerY.equalTo(segmentContainerView.snp.centerY)
        }
        
        underLineView.snp.makeConstraints { make in
            make.leading.equalTo(segmentControl.snp.leading)
            make.trailing.equalTo(segmentControl.snp.trailing)
            make.bottom.equalTo(segmentControl.snp.bottom)
            make.height.equalTo(2)
        }
        
        selectedUnderLineView.snp.makeConstraints { make in
            make.leading.equalTo(segmentControl.snp.leading)
            make.bottom.equalTo(segmentControl.snp.bottom)
            make.width.equalTo(segmentControl.snp.width).dividedBy(titles.count)
            make.height.equalTo(2)
        }
        
        floatingButton.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.width.height.equalTo(50)
        }
    }
    
    private func switchToViewController(at index: Int) {
        // 기존 VC 제거
        currentViewController?.willMove(toParent: nil)
        currentViewController?.view.removeFromSuperview()
        currentViewController?.removeFromParent()
        
        // 선택된 VC 추가
        let selectedVC = viewController(for: index)
        addChild(selectedVC)
        VCContainerView.addSubview(selectedVC.view)
        selectedVC.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        selectedVC.didMove(toParent: self)
        currentViewController = selectedVC
    }
    
    private func viewController(for index: Int) -> UIViewController {
        switch index {
        case 0:
            return MyTaskListView()
        case 1:
            return MyTaskHeaderView()
        default:
            return UIViewController()
        }
    }
}
