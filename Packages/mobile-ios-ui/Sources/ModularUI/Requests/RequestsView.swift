import SwiftUI
import ModularRouter

public struct RequestsView: View {

    @State var viewModel: RequestsViewModel

    public init(viewModel: RequestsViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        List {
            if viewModel.isLoading == true {
                ProgressView()
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundStyle(.red)
            } else if viewModel.requests.isEmpty == true {
                Text("No requests found")
                    .foregroundStyle(.secondary)
            } else {
                ForEach(viewModel.requests) { request in
                    Button { viewModel.selectRequest(request) } label: {
                        RequestRow(request: request)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle("Requests")
        #if os(iOS) || os(visionOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
        .toolbar {
            ToolbarItem(placement: {
                #if os(iOS) || os(visionOS)
                return .topBarTrailing
                #else
                return .automatic
                #endif
            }()) {
                Button(action: { viewModel.loadRequests() }) {
                    Image(systemName: "arrow.clockwise")
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        RequestsView(viewModel: RequestsViewModel(onSelectRequest: { _ in }))
            .environment(Router())
    }
}
