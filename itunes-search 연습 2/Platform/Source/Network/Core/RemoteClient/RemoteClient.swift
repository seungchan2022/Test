// Platform -> Source -> Network -> Core -> RemoteClient -> RemoteClient

// RemoteClient
// - 원격 API 통신을 처리하고 플랫폼별 네트워킹 구현과 도메인 계층 간의 인터페이스 역할을 하는 특정 구성 요소를 나타낸다.
// - 네트워크 코어 내의 원격 클라이언트는 원격 API 통신의 하위 수준 세부 정보를 추상화하고 도메인 계층에 대해 간소화된 도메인별 인터페이스를 제공하는 중간 계층 역할을 한다.
// - 특정 원격 API 구현에서 도메인 계층을 분리하는데 도움이 되며 아키텍처 내에서 모듈성, 테스트 가능성 및 유지 관리 가능성을 촉진한다.
// - API 엔드포인트, 요청/응답 모델을 정의하고 오류 매핑을 처리함으로써 원격 클라이언트는 도메인 계층과 플랫폼별 네트워킹 구현 간의 문제를 명확하게 분리하여 네트워크 통신을 보다 관리하기 쉽고 변경 사항에 적용할 수 있도록 합니다.

import Foundation
import Domain

public struct RemoteClient {
  let session: URLSession
  
  public init(session: URLSession = .shared) {
    self.session = session
  }
}

extension RemoteClient {
  func send(url: URL?) async throws -> Data {
    guard let url else { throw CompositeError.invalidTypeCast }
    
    let (data, response) = try await session.data(from: url)
    
    guard let status = (response as? HTTPURLResponse)?.statusCode
    else { throw CompositeError.invalidTypeCast }
    
    guard (200...299).contains(status) else { throw CompositeError.remoteError }
    return data
  }
}
