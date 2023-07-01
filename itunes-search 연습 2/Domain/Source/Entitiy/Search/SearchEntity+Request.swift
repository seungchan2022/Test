// Domain -> Source -> Entity -> Search -> SearchEntity+Request

// Entity + Request
// - 특정 작업에 필요한 입력 또는 매개변수를 나타내는 데이터 구조 또는 개체를 나타낸다.
// - 일반적으로 UseCase를 수행하거나 API 호출과 같은 외부 서비스와 상호 작용하는데 필요한 데이터 캡슐화
// - 요청 매개 변수, 인증 토큰 또는 기타 관련 정보와 같은 속성이 포함될 수 있다.

import Foundation

extension SearchEntity {
  public enum Request: Equatable { }
}

extension SearchEntity.Request {
  public struct Keyword: Equatable {
    public let term: String
    public let software: String
    
    public init(term: String, software: String = "software") {
      self.term = term
      self.software = software
    }
  }
}
