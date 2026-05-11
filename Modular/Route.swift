import Foundation
import ModularRouter
import ModularUI

enum Route: IRoutable {
    case requests
    case requestDetail(request: Request)
}
