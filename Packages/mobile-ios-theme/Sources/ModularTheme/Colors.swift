import SwiftUI

public enum AppColor {
    public static let primary = Color.blue
    public static let secondary = Color.indigo
    public static let destructive = Color.red
    public static let onPrimary = Color.white

    #if canImport(UIKit)
    public static let background = Color(uiColor: .systemBackground)
    public static let surface = Color(uiColor: .secondarySystemBackground)
    #else
    public static let background = Color(nsColor: .windowBackgroundColor)
    public static let surface = Color(nsColor: .controlBackgroundColor)
    #endif
}
