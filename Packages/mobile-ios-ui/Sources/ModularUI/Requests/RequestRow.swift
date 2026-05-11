import SwiftUI
import ModularTheme

public struct RequestRow: View {
    let request: Request

    public init(request: Request) {
        self.request = request
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: Spacing.sm) {
            HStack {
                Text(request.title)
                    .font(AppFont.headline())

                Spacer()

                statusBadge
            }

            Text(request.description)
                .font(AppFont.caption())
                .foregroundStyle(.secondary)

            HStack {
                Text(request.createdAt.formatted(date: .abbreviated, time: .shortened))
                    .font(AppFont.caption2())
                    .foregroundStyle(.secondary)

                Spacer()
            }
        }
        .padding(.vertical, 12)
        .contentShape(Rectangle())
    }

    @ViewBuilder
    private var statusBadge: some View {
        Text(request.status.rawValue)
            .font(AppFont.caption())
            .fontWeight(.semibold)
            .padding(.horizontal, Spacing.sm)
            .padding(.vertical, Spacing.xs)
            .background(statusColor.opacity(0.2))
            .foregroundStyle(statusColor)
            .cornerRadius(4)
    }

    private var statusColor: Color {
        switch request.status {
        case .pending:    return AppColor.warning
        case .inProgress: return AppColor.primary
        case .completed:  return AppColor.success
        case .failed:     return AppColor.destructive
        }
    }
}

#Preview {
    RequestRow(
        request: Request(
            id: "1",
            title: "Fetch User Profile",
            description: "GET /api/user/profile",
            status: .completed,
            createdAt: Date()
        )
    )
}
