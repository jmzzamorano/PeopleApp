
import XCTest
@testable import people

class UserJsonParserTest: XCTestCase {
    
    func test_shouldReturn_anEmptyList_whenTheJson_isMalformatted() {
        let json = "{"
        let parser = UserJsonParser()
        let users: [User] = parser.parse(json: json)

        XCTAssertTrue(users.isEmpty)
    }

    func test_shouldReturn_anEmptyList_whenSomeJsonItem_isMalformatted() {
        let json = getStringData(file: "test_userparser_malformed")

        let parser = UserJsonParser()
        let users: [User] = parser.parse(json: json)

        XCTAssertTrue(users.isEmpty)
    }

    func test_shouldReturn_anEmptyList_when_thereAreNoUsers() {
        let json = "[]"

        let parser = UserJsonParser()
        let users: [User] = parser.parse(json: json)

        XCTAssertTrue(users.isEmpty)
    }

    func test_shouldReturn_aCompleteUser_whenTheJson_HasAllTheRequiredFields() {
        let json = getStringData(file: "test_userparser_requiredfields")

        let parser = UserJsonParser()
        let users: [User] = parser.parse(json: json)

        XCTAssertEqual(users.count, 1)

        let user = users[0]
        XCTAssertEqual(user.name, "Foo")
        XCTAssertEqual(user.id, 6613)
        XCTAssertEqual(user.birthdate, "2016-09-15T19:34:00")
    }

    func test_shouldReturn_aUser_ignoring_AllUnsupportedValues() {
        let json = getStringData(file: "test_userparser_unsupportedvalues")

        let parser = UserJsonParser()
        let users: [User] = parser.parse(json: json)

        XCTAssertEqual(users.count, 1)

        let user = users[0]
        XCTAssertEqual(user.name, "Foo")
        XCTAssertEqual(user.id, 6613)
        XCTAssertEqual(user.birthdate, "2016-09-15T19:34:00")
    }

    func test_shouldReturn_threeUsers_fromThree_whenAllOfThem_areValid() {
        let json = getStringData(file: "test_userparser_severalusers")

        let parser = UserJsonParser()
        let users: [User] = parser.parse(json: json)

        XCTAssertEqual(users.count, 3)
    }
    
    func test_shouldReturn_oneUser_fromTwo_whenOneOfThem_doesNotHave_Id() {
        let json = getStringData(file: "test_userparser_missingid")
        
        let parser = UserJsonParser()
        let users: [User] = parser.parse(json: json)
        
        XCTAssertEqual(users.count, 1)
    }
    
    func test_shouldReturn_oneUser_fromTwo_whenIdField_IsNotInteger() {
        let json = getStringData(file: "test_userparser_wrongidtype")
        
        let parser = UserJsonParser()
        let users: [User] = parser.parse(json: json)
        
        XCTAssertEqual(users.count, 1)
    }
    
    private func getStringData(file: String) -> String {
        let file = Bundle.init(for: type(of: self)).path(forResource: file, ofType: "json")
        
        do {
            let content = try String(contentsOfFile: file!)
            return content
        } catch {
            return ""
        }
    }
}
