import UIKit

class ChildViewController: UIViewController {

    private let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = ThemeManager.shared.currentTheme.backgroundColor

        view.layer.cornerRadius = 4.0
        view.layer.borderColor = ThemeManager.shared.currentTheme.foregroundColor.cgColor
        view.layer.borderWidth = 2.0

        label.textColor = ThemeManager.shared.currentTheme.foregroundColor
        label.text = "Hello World!"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        view.addSubview(label)
        NSLayoutConstraint.activate(
            [
                label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 1.0),
                label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 1.0),
                label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 1.0),
                label.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 1.0)
            ]
        )
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        print(previousTraitCollection?.userInterfaceStyle.rawValue ?? 0)
    }
}
