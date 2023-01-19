# Weather ![Vector](https://user-images.githubusercontent.com/92635121/213335188-b264c2a2-2981-4218-8605-86ab7ac421bf.png)

> **기간**  :  2023.01.16 ~ 2023.01.19   
> **Architecture**  :  MVVM+C, CleanArchitecture  
> **사용 언어**  :  RxSwift

<br>


## 구현사항

- [x] 실시간 날씨
- [x] 시간 별 날씨
- [x] 5일간 예보
- [x] 해당 도시 위치 및 마커 표시
- [x] 습도, 체감온도, 기압, 풍속 표시

## 실행 화면
<img width="200" alt="이미지 제목" src="https://user-images.githubusercontent.com/92635121/213342646-f6072439-75c6-4c8d-b631-92d0911a27ce.gif">

<br>

## Architecture :  MVVM+C, CleanArchitecture
[해당 아키텍처 채택 이유](https://github.com/Jeeehee/Weather/wiki/MVVM-C,-CleanArchitecture-%EC%B1%84%ED%83%9D-%EC%9D%B4%EC%9C%A0)

![Flow](https://user-images.githubusercontent.com/92635121/213339815-c3d74911-b1f9-4b74-a55a-c455323550fb.png)


<br>

## 고민과 해결
- [API Key를 어디에, 어떻게 저장할 것인가?](https://github.com/Jeeehee/Weather/wiki/API-Key%EB%A5%BC-%EC%96%B4%EB%94%94%EC%97%90,-%EC%96%B4%EB%96%BB%EA%B2%8C-%EC%A0%80%EC%9E%A5%ED%95%A0-%EA%B2%83%EC%9D%B8%EA%B0%80%3F)
- [의존성 분리와 화면 전환](https://github.com/Jeeehee/Weather/wiki/%EC%9D%98%EC%A1%B4%EC%84%B1-%EB%B6%84%EB%A6%AC%EC%99%80-%ED%99%94%EB%A9%B4-%EC%A0%84%ED%99%98)
- [Icon Image 캐싱을 진행해야할까?](https://github.com/Jeeehee/Weather/wiki/Icon-Image-%EC%BA%90%EC%8B%B1%EC%9D%84-%EC%A7%84%ED%96%89%ED%95%B4%EC%95%BC%ED%95%A0%EA%B9%8C%3F)
- [패키지 매니저로 CocoaPods 선택 이유](https://github.com/Jeeehee/Weather/wiki/%ED%8C%A8%ED%82%A4%EC%A7%80-%EB%A7%A4%EB%8B%88%EC%A0%80%EB%A1%9C-CocoaPods-%EC%84%A0%ED%83%9D-%EC%9D%B4%EC%9C%A0)
