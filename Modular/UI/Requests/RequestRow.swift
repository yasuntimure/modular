import SwiftUI

struct RequestRow: View {
    let request: Request
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(request.title)
                    .font(.headline)
                
                Spacer()
                
                statusBadge
            }
            
            Text(request.description)
                .font(.caption)
                .foregroundStyle(.secondary)
            
            HStack {
                Text(request.createdAt.formatted(date: .abbreviated, time: .shortened))
                    .font(.caption2)
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
