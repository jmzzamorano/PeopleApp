
import Foundation
import RxSwift
import RxAlamofire

final class UserServiceFromNetwork: UserRepository {
    var parser: UserJsonParser
    
    init(parser: UserJsonParser) {
        self.parser = parser
    }
    
    func execute() -> Single<[User]> {
        let baseUrl = AppConfig.shared.getBaseUrl()
        let url = baseUrl + "/api/User"

        return RxAlamofire
            .requestString(.get, url)
            .asSingle()
            .flatMap({(response, jsonString) -> Single<[User]> in
                let data = self.parser.parse(json: jsonString)
                return Single.just(data)
            })
    }
}
