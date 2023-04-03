import UIKit

class ParentViewController: UIViewController {

    private let themeSwitcher = UISegmentedControl()
    private let childViewController = ChildViewController()
    private let childSwiftUIController = ChildSwitUIController(rootView: ChildView())

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGreen

        setupThemeSwitcher()
        setupChildViewController(childViewController)
        setupChildViewController(childSwiftUIController)
        setupLayout()
    }

    func setupThemeSwitcher() {
        themeSwitcher.addTarget(self, action: #selector(themeSwitched), for: .valueChanged)
        themeSwitcher.translatesAutoresizingMaskIntoConstraints = false
        themeSwitcher.insertSegment(withTitle: "Red", at: 0, animated: false)
        themeSwitcher.insertSegment(withTitle: "Green", at: 1, animated: false)
        themeSwitcher.insertSegment(withTitle: "Blue", at: 2, animated: false)
        view.addSubview(themeSwitcher)
    }

    func setupChildViewController(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.view.translatesAutoresizingMaskIntoConstraints = false
        child.didMove(toParent: self)
    }

    func setupLayout() {
        NSLayoutConstraint.activate(
            [
                themeSwitcher.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40.0),
                themeSwitcher.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60.0),
                themeSwitcher.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60.0),
                themeSwitcher.heightAnchor.constraint(equalToConstant: 40),

                childViewController.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60.0),
                childViewController.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60.0),
                childViewController.view.topAnchor.constraint(equalTo: themeSwitcher.bottomAnchor, constant: 40.0),
                childViewController.view.bottomAnchor.constraint(equalTo: childSwiftUIController.view.topAnchor, constant: -60.0),

                childSwiftUIController.view.heightAnchor.constraint(equalTo: childViewController.view.heightAnchor, multiplier: 1.0),
                childSwiftUIController.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60.0),
                childSwiftUIController.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60.0),
                childSwiftUIController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60.0),
            ]
        )
    }

    @objc
    func themeSwitched() {
        print("theme switched")
    }

    // MARK: - Trait Collection stuffs

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        print(previousTraitCollection?.userInterfaceStyle.rawValue ?? 0)
    }
}
