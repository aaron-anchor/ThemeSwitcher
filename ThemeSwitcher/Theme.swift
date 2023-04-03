import Foundation
import UIKit

// Color source of truth

private let foregroundColors: [Theme: UIColor] = [
    .red: UIColor(red: 249/255, green: 59/255, blue: 59/255, alpha: 1.0),
    .green: UIColor(red: 59/255, green: 249/255, blue: 104/255, alpha: 1.0),
    .blue: UIColor(red: 72/255, green: 59/255, blue: 249/255, alpha: 1.0),
]

private let backgroundColors: [Theme: UIColor] = [
    .red: UIColor(red: 192/255, green: 45/255, blue: 45/255, alpha: 1.0),
    .green: UIColor(red: 45/255, green: 192/255, blue: 104/255, alpha: 1.0),
    .blue: UIColor(red: 45/255, green: 79/255, blue: 192/255, alpha: 1.0)
]

private let borderColors: [Theme: UIColor] = [
    .red: UIColor(red: 166/255, green: 0/255, blue: 0/255, alpha: 1.0),
    .green: UIColor(red: 0/255, green: 166/255, blue: 28/255, alpha: 1.0),
    .blue: UIColor(red: 0/255, green: 39/255, blue: 166/255, alpha: 1.0)
]

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

class ThemeManager {

    static let shared = ThemeManager()

    // MARK: - Public. Theme accessors

    public var currentTheme: Theme {
        theme
    }

    public func setTheme(_ newTheme: Theme) {
        theme = newTheme
    }


    // MARK: - Private

    private var theme: Theme = .red {
        didSet {
            print("Theme changed: \(theme)")
        }
    }
}
