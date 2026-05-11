import SwiftUI

struct RequestDetailView: View {
    let request: Request
    @State private var viewModel: RequestDetailViewModel?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Header
                VStack(alignment: .leading, spacing: 8) {
                    Text(request.title)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    HStack {
                        Text(request.description)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        
                        Spacer()
                        
                        statusBadge
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
                
                // Details Section
                VStack(alignment: .leading, spacing: 8) {
                    Text("Details")
                        .font(.headline)
                    
                    if let viewModel, viewModel.isLoading {
                        ProgressView()
                    } else if let details = viewModel?.details {
                        Text(details)
                            .font(.caption)
                            .monospaced()
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(8)
                            .background(Color(.systemGray6))
                            .cornerRadius(4)
                    }
                }
                
                // Metadata
                VStack(alignment: .leading, spacing: 12) {
                    Text("Metadata")
                        .font(.headline)
                    
                    MetadataRow(label: "ID", value: request.id)
                    MetadataRow(label: "Created", value: request.createdAt.formatted(date: .abbreviated, time: .standard))
                    MetadataRow(label: "Status", value: request.status.rawValue)
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Request Details")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel = RequestDetailViewModel(request: request)
        }
    }
    
    @ViewBuilder
    private var statusBadge: some View {
        Text(request.status.rawValue)
            .font(.caption)
            .fontWeight(.semibold)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(statusColor.opacity(0.2))
            .foregroundStyle(statusColor)
            .cornerRadius(4)
    }
    
    private var statusColor: Color {
        switch request.status {
        case .pending:
            return .orange
        case .inProgress:
            return .blue
        case .completed:
            return .green
        case .failed:
            return .red
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
