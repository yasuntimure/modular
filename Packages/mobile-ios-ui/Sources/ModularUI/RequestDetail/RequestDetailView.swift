import SwiftUI
import ModularTheme

public struct RequestDetailView: View {
    let request: Request
    @State private var viewModel: RequestDetailViewModel?

    public init(request: Request) {
        self.request = request
    }

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.md) {
                VStack(alignment: .leading, spacing: Spacing.sm) {
                    Text(request.title)
                        .font(AppFont.title2())
                        .fontWeight(.bold)

                    HStack {
                        Text(request.description)
                            .font(AppFont.caption())
                            .foregroundStyle(.secondary)

                        Spacer()

                        statusBadge
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                Divider()

                VStack(alignment: .leading, spacing: Spacing.sm) {
                    Text("Details")
                        .font(AppFont.headline())

                    if let viewModel, viewModel.isLoading {
                        ProgressView()
                    } else if let details = viewModel?.details {
                        Text(details)
                            .font(AppFont.caption())
                            .monospaced()
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(Spacing.sm)
                            .background(AppColor.surface)
                            .cornerRadius(4)
                    }
                }

                VStack(alignment: .leading, spacing: Spacing.sm + Spacing.xs) {
                    Text("Metadata")
                        .font(AppFont.headline())

                    MetadataRow(label: "ID", value: request.id)
                    MetadataRow(label: "Created", value: request.createdAt.formatted(date: .abbreviated, time: .standard))
                    MetadataRow(label: "Status", value: request.status.rawValue)
                }

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Request Details")
        #if os(iOS) || os(visionOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
        .onAppear {
            viewModel = RequestDetailViewModel(request: request)
        }
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

private struct MetadataRow: View {
    let label: String
    let value: String

    var body: some View {
        HStack {
            Text(label)
                .foregroundStyle(.secondary)

            Spacer()

            Text(value)
                .fontWeight(.medium)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    NavigationStack {
        RequestDetailView(
            request: Request(
                id: "1",
                title: "Fetch User Profile",
                description: "GET /api/user/profile",
                status: .completed,
                createdAt: Date()
            )
        )
    }
}
