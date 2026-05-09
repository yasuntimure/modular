import Testing
@testable import ModularTheme

@Suite("ModularTheme")
struct ModularThemeTests {

    @Test func spacingScaleIsOrdered() {
        #expect(Spacing.xs < Spacing.sm)
        #expect(Spacing.sm < Spacing.md)
        #expect(Spacing.md < Spacing.lg)
        #expect(Spacing.lg < Spacing.xl)
    }

    @Test func defaultThemeExists() {
        let theme = AppTheme.default
        #expect(theme.primary == AppColor.primary)
        #expect(theme.secondary == AppColor.secondary)
        #expect(theme.background == AppColor.background)
    }
}
