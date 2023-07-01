// Domain -> Source -> UseCase -> SearchUseCaseDomain

// UseCase
// - 비즈니스 로직과 UseCase별 작업을 나타낸다.
// - 애플리케이션 내에서 수행할 수 있는 동작과 작업을 캡슐화한다.
// - 데이터 흐름을 조작하고 도메인 계층 내의 엔티티 및 리포지토리와 상호 작용한다.
// - 프레젠테이션 계층에서 호출할 수 있는 작업을 정의하고 비즈니스 규칙이 적용되도록 한다.

import Foundation

public protocol SearchUseCaseDomain {
  var search: (SearchEntity.Request.Keyword) async throws -> SearchEntity.Response.Result { get }
}
