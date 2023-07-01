// Platform -> Source -> Network -> Core -> RemoteClient -> Endpoint

// Endpoint
// - 플랫폼 계층의 네트워크 코어 내에 있는 원격 클라이언트가 상호 작용하는 특정 API 또는 서비스 엔드포인트를 나타낸다.
// - 원격 API에서 제공하는 특정 기능 또는 리소스에 해당하는 고유한 URL 또는 식별자를 나타낸다.
// - 원격 클라이언트 내에서 엔드포인트를 정의함으로써 네트워크의 핵심은 도메인 계층이 표준화되고 구조화된 방식으로 원격 API에서 제공하는 특정 기능과 상호 작용할 수 있도록 한다.
// - API 요청 구성, 응답 처리 및 데이터 매핑에 대한 세부 정보를 캡슐화하여 아키텍처 내에서 문제 분리 및 모듈화를 촉진한다.

import Foundation

struct Endpoint {
  let url: String
  let parameter: any QueryParameterType & Equatable
}

extension Endpoint: Equatable {
  static func == (lhs: Self, rhs: Self) -> Bool {
    lhs.url == rhs.url
    && lhs.parameter.makeQuery() == rhs.parameter.makeQuery()
  }
}
