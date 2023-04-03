import SwiftUI

struct ChildView: View {

    @StateObject var themeManager: ThemeManager = ThemeManager.shared

    var body: some View {
        Self._printChanges()
        return Text("🪴 Swift UI")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(Color(uiColor: themeManager.currentTheme.foregroundColor))
            .background(Color(uiColor: themeManager.currentTheme.backgroundColor))
            .cornerRadius(4.0)
    }
}

class ChildSwitUIController: UIHostingController<ChildView> {
    override init(rootView: ChildView) {
        super.init(rootView: rootView)

        view.layer.cornerRadius = 4.0
        view.layer.borderWidth = 2.0
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        view.layer.borderColor = ThemeManager.shared.currentTheme.borderColor.cgColor
    }

    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

