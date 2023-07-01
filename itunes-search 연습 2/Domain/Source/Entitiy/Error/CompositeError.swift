// Domain -> Source -> Entity -> Error -> CompositeError

// CompositeError
// - 여러 오류가 단일 오류 유형 또는 구조로 겹합되는 개념을 나타낸다.
// - 아키텍쳐 내에서 통합된 방식으로 여러 오류를 처리하고 전파하는 데 사용되는 기술이다.
// - 사용하는 목적은 UseCase 또는 특정 작업을 실행하는 동안 발생할 수 있는 여러 오류를 표시하고 처리하는 표준화된 방법을 제공하는 것이다.
// - 개별 오류를 개별적으로 전파하는 대신 CompositeError를 사용하면 여러 오류를 단일 엔티티로 캡슐화할 수 있다.
// - 아키텍처 내에서 여러 오류를 처리하고 전파하기 위한 보다 쳬계적이고 표준화된 접근 방식이 가능하다.
// - 통합 오류 표현을 제공하고 오류 처리를 단순화하여 복잡한 오류 시나리오를 보다 쉽게 관리하고 아키텍처 전체에서 오류 정보를 효과적으로 전달할 수 있다.

import Foundation

public enum CompositeError: Error {
  case invalidTypeCast
  case networkOffline
  case remoteError
}

