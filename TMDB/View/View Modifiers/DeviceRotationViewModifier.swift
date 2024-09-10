import SwiftUI

struct DeviceRotationViewModifier : ViewModifier {
    let handler: (UIDeviceOrientation) -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                handler(UIDevice.current.orientation)
            }
    }
}

extension View {
    func onRotate(_ handler: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(handler: handler))
    }
}
