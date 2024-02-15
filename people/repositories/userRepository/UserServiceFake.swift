
import Foundation
import RxSwift

final class UserServiceFake: UserRepository {
    var parser: UserJsonParser
    
    init(parser: UserJsonParser) {
        self.parser = parser
    }
    
    func execute() -> Single<[User]> {
        do {
            let jsonString = try readJSONFile(named: "users", fileExtension: "json")
            let users = parser.parse(json: jsonString)
            return Single.just(users).delay(.seconds(3), scheduler: MainScheduler.instance)
        } catch {
            print("Error:", error.localizedDescription)
            return Single.error(NSError())
        }
    }
    
    private func readJSONFile(named fileName: String, fileExtension: String) throws -> String {
        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
            throw NSError(domain: "com.peopleapp.error",
                          code: 404,
                          userInfo: [NSLocalizedDescriptionKey: "JSON file not found"])
        }
        
        let data = try Data(contentsOf: fileURL)
        guard let jsonString = String(data: data, encoding: .utf8) else {
            throw NSError(domain: "com.peopleapp.error",
                          code: 500,
                          userInfo: [NSLocalizedDescriptionKey: "conversion Error"])
        }
        
        return jsonString
    }
}
