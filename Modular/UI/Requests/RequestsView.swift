import SwiftUI
import ModularRouter

struct RequestsView: View {

    @State var viewModel: RequestsViewModel

    var body: some View {
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
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: { viewModel.loadRequests() }) {
                    Image(systemName: "arrow.clockwise")
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        RequestsView(viewModel: RequestsViewModel(router: Router()))
            .environment(Router())
    }
}

