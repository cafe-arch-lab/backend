# 목적
- 해당 프로젝트는 아키텍처 및 리팩토링을 연습하기 위한 프로젝트입니다
- 그렇기에 구축의 목표는 카페 형태의 서비스이지만, 구현에 초점을 두지 않습니다

# 사용 언어
- [golang](https://go.dev/)

# 환경
- [echo](https://echo.labstack.com/)
    - framework
- [gorm](https://gorm.io/index.html)
    - orm
- [postgresql](https://www.postgresql.org/)
    - db
- [Hurl](https://hurl.dev/)
    - test tools
- [devcontainer](https://containers.dev/)
    - 개발 환경
- [air](https://github.com/air-verse/air)
    - 코드 수정 시, 자동 서버 재실행

# 아키첵처
- ddd와 vsa를 결합한 방법으로 진행합니다
- 더욱 좋은 아키텍처나, 방법을 찾는다면 리팩토링을 통해 구조를 변경합니다
- 이미 구현되어있는 프로젝트를 안전하게 구조 변경을 하는것 까지가 학습 목표입니다

# 개발
- 개발 환경은 devcontainer로 상정합니다
- 프론트엔드의 개발은 아직 예정에 없습니다
- 코드를 작성할 때, 항상 근거가 필요합니다

# 실행
```
make run
```