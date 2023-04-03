import SwiftUI

struct ChildView: View {

    var body: some View {
        Text("Hello World")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(Color(uiColor: ThemeManager.shared.currentTheme.foregroundColor))
            .background(Color(uiColor: ThemeManager.shared.currentTheme.backgroundColor))
    }
}

class ChildSwitUIController: UIHostingController<ChildView> {
    override init(rootView: ChildView) {
        super.init(rootView: rootView)

        view.layer.cornerRadius = 4.0
        view.layer.borderColor = ThemeManager.shared.currentTheme.foregroundColor.cgColor
        view.layer.borderWidth = 2.0
    }

    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

