import Foundation
import ModularRouter

enum Route: IRoutable {
    case requests
    case requestDetail(request: Request)
}
