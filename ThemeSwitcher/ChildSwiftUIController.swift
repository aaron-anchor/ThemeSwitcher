import SwiftUI

struct ChildView: View {
    var body: some View {
        Text("Hello World")
            .foregroundColor(.black)
            .background(Color.orange)
    }
}

class ChildSwitUIController: UIHostingController<ChildView> {
    override init(rootView: ChildView) {
        super.init(rootView: rootView)
    }

    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

