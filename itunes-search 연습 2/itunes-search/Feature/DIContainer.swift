// DIContainer (Dependency Injection container)
// - 애플리케이션 내 종속성의 관리 및 해결을 용이하게 하는 구성 요소 또는 프레임웤를 나타낸다.
// - 아키텍처의 다양한 구성 요소에 필요한 개체 또는 서비스의 인스턴슬르 만들고 제공하는 일을 담당한다.
// - DIContainer를 활용하여 종속성을 사용하는 구성 요소에서 종속성의 생성 및 관리를 분리하여 느슨한 결합, 모듈화 및 테스트 가능성을 촉진한다.
// - 구성 요소의 통합을 단순화하고 관심사의 분리를 촉진하여 아키텍처를 보다 유지 관리 및 확장 가능하게 만든다.

import Foundation
import Domain
import Platform

struct DIContainer {
  let remoteClient: RemoteClient
    
  // 초기화할 때 remoteClient 매개변수를 생략할 수 있는 디폴트 매개변수를 가지고 있다.
  // 이는 remoteClient 매개변수를 생략하면 내부적으로 기본 값인 RemoteClient()가 사용되도록 하여, DIContainer를 초기화할 때 remoteClient를 명시적으로 전달하지 않을 수 있게 한다.
  // 따라서 DIContainer를 초기화할 때 remoteClient를 전달하지 않으면 내부적으로 RemoteClient()가 사용됩니다.
  init(remoteClient: RemoteClient = .init()) {
    self.remoteClient = remoteClient
  }
}

extension DIContainer {
  var searchUseCase: SearchUseCaseDomain {
//    SearchUseCasePlatform(remoteClient: remoteClient)
    SearchUseCaseMock()
  }
}
