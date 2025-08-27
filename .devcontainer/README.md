# devcontainer
- https://containers.dev/

## 란
- 개발환경을 보다 쉽게 구축하기 위한 개발 방법
- 여러 팀원들이 사용할 때, 통일된 개발환경을 사용하기 위한 방법

## 설명
- dockerfile, docker compose는 생략
### name
- 컨테이너 이름
### features
- ghcr.io/devcontainers/features/docker-outside-of-docker:버전
    - dood: devcontainer 안에서 로컬의 docker를 사용하기 위한 세팅
- ghcr.io/devcontainers/features/github-cli:버전
    - git: devcontainer 안에서 git을 사용하기 위한 세팅
- ghcr.io/devcontainers/features/git-lfs:버전
    - git-lfs: devcontainer 안에서 git-lfs를 사용하기 위한 세팅
### service
- docker compose의 서비스명
### workspaceFolder
- devcontainer를 실행했을 시, 시작지점
### customizations/vscode
- vscode의 세팅
- .vscode 폴더와 같은 역할을 한다
- 현재는 추천 익스텐션만 존재
### mounts
- 로컬의 내용을 devcontainer에 연결하는 부분
- "source=${localWorkspaceFolder},target=/workspace,type=bind,consistency=cached"
    - 로컬의 경로를 devcontainer 안으로 연결
    - devcontainer안에서 docker를 실행시, 로컬의 docker가 실행되기에, 경로가 devcontainer의 경로가 아닌 로컬의 경로가 필요하다. 이때 사용
- "source=${localWorkspaceFolder}/.devcontainer/id_rsa,target=/root/.ssh/id_rsa,type=bind,readonly"
    - 로컬의 깃허브 로그인 정보를 devcontainer 안에서 사용할 수 있도록 하는 세팅
    - 현재 ssh 연결을 통해 깃허브 로그인을 하고 있기 때문에, .devcontainer/id_rsa 파일을 넣어 두어 로그인 하고 있다. (id_rsa는 gitignore을 통해 제어)
- "source=/var/run/docker.sock,target=/var/run/docker.sock,type=bind"
    - dood를 하기 위한 세팅. 로컬의 소켓과 devcontainer의 소켓과 연결을 시키는 곳
### containerEnv
- 환경변수 세팅
- 로컬의 root 경로를 devcontainer 안으로 연결
### shutdownAction
- devcontainer를 실행한 vscode를 종료 했을 시, 행하는 행동
- 현재는 compose 종료를 지시하고 있다.
- default는 stopContainer
