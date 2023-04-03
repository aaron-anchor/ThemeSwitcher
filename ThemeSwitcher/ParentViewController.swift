import UIKit

class ParentViewController: UIViewController {

    private let themes = [Theme.red, Theme.green, Theme.blue]
    private let themeSwitcherControl = UISegmentedControl()
    private let childViewController = ChildViewController()
    private let childSwiftUIController = ChildSwitUIController(rootView: ChildView())

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = ThemeManager.shared.currentTheme.backgroundColor

        setupThemeSwitcher()
        setupChildViewController(childViewController)
        setupChildViewController(childSwiftUIController)
        setupLayout()
    }

    func setupThemeSwitcher() {
        themeSwitcherControl.addTarget(self, action: #selector(themeSwitched(_:)), for: .valueChanged)
        themeSwitcherControl.translatesAutoresizingMaskIntoConstraints = false
        themes.enumerated().forEach { index, theme in
            themeSwitcherControl.insertSegment(withTitle: theme.rawValue, at: index, animated: false)
        }
        themeSwitcherControl.selectedSegmentIndex = 0
        view.addSubview(themeSwitcherControl)
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
                themeSwitcherControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40.0),
                themeSwitcherControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60.0),
                themeSwitcherControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60.0),
                themeSwitcherControl.heightAnchor.constraint(equalToConstant: 40),

                childViewController.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60.0),
                childViewController.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60.0),
                childViewController.view.topAnchor.constraint(equalTo: themeSwitcherControl.bottomAnchor, constant: 40.0),
                childViewController.view.bottomAnchor.constraint(equalTo: childSwiftUIController.view.topAnchor, constant: -60.0),

                childSwiftUIController.view.heightAnchor.constraint(equalTo: childViewController.view.heightAnchor, multiplier: 1.0),
                childSwiftUIController.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60.0),
                childSwiftUIController.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60.0),
                childSwiftUIController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60.0),
            ]
        )
    }

    @objc
    func themeSwitched(_ segmentControl: UISegmentedControl) {
        let theme = themes[segmentControl.selectedSegmentIndex]

        ThemeManager.shared.setTheme(theme)
    }

    // MARK: - Trait Collection stuffs

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        print(previousTraitCollection?.userInterfaceStyle.rawValue ?? 0)
    }
}
