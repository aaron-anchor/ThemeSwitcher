import Foundation
import UIKit

// Color source of truth

private let foregroundColors: [Theme: UIColor] = [
    .red: UIColor(red: 255/255, green: 59/255, blue: 59/255, alpha: 1.0),
    .green: UIColor(red: 59/255, green: 255/255, blue: 104/255, alpha: 1.0),
    .blue: UIColor(red: 72/255, green: 59/255, blue: 255/255, alpha: 1.0),
]

private let backgroundColors: [Theme: UIColor] = [
    .red: UIColor(red: 192/255, green: 45/255, blue: 45/255, alpha: 1.0),
    .green: UIColor(red: 45/255, green: 192/255, blue: 104/255, alpha: 1.0),
    .blue: UIColor(red: 44/255, green: 123/255, blue: 192/255, alpha: 1.0)
]

private let borderColors: [Theme: UIColor] = [
    .red: UIColor(red: 166/255, green: 0/255, blue: 0/255, alpha: 1.0),
    .green: UIColor(red: 0/255, green: 166/255, blue: 28/255, alpha: 1.0),
    .blue: UIColor(red: 0/255, green: 39/255, blue: 166/255, alpha: 1.0)
]

/// For Dark/Light modes the Themes would have their own set of colors for those modes, and whenever the system changes that mode, the Theme Manager re-computes colors based on that
enum Theme: String {
    case red = "Red"
    case green = "Green"
    case blue = "Blue"
}

extension Theme {
    var foregroundColor: UIColor {
        foregroundColors[self] ?? .black
    }

    var backgroundColor: UIColor {
        backgroundColors[self] ?? .white
    }

    var borderColor: UIColor {
        borderColors[self] ?? .white
    }
}

class ThemeManager: ObservableObject {

    static let shared = ThemeManager()

    // MARK: - Public. Theme accessors

    @Published
    public var currentTheme: Theme = .red {
        didSet {
            print("Theme changed: \(currentTheme)")
            guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
                return
            }

            guard let window = scene.windows.first else {
                return
            }

            // UIKit pain
            window.rootViewController?.view.invalidate()
        }
    }

    public func setTheme(_ newTheme: Theme) {
        currentTheme = newTheme
    }
}

extension UIView {
    // Calls setNeedsLayout on all views in tree
    func invalidate() {
        setNeedsLayout()
        invalidateSubviews(subviews)
    }

    private func invalidateSubviews(_ views: [UIView]){
        for view in views {
            view.invalidate()
        }
    }
}
