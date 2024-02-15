
import Foundation
import Swinject

final class AppConfig {
    static let shared = AppConfig()
    public var container = Container()
    
    private init() {}
    
    func getBaseUrl() -> String {
        return "https://hello-world.innocv.com"
    }
    
    public func configure() {
        container = ContainerFactory.make()
    }
}
