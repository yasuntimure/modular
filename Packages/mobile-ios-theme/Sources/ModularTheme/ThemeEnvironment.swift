import SwiftUI

public struct AppTheme: Sendable {
    public let primary: Color
    public let secondary: Color
    public let background: Color

    public static let `default` = AppTheme(
        primary: AppColor.primary,
        secondary: AppColor.secondary,
        background: AppColor.background
    )

    public init(primary: Color, secondary: Color, background: Color) {
        self.primary = primary
        self.secondary = secondary
        self.background = background
    }
}

private struct AppThemeKey: EnvironmentKey {
    typealias Value = AppTheme
    static let defaultValue = AppTheme.default
}

extension EnvironmentValues {
    public var appTheme: AppTheme {
        get { self[AppThemeKey.self] }
        set { self[AppThemeKey.self] = newValue }
    }
}
