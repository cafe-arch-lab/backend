# devcontainer
- https://containers.dev/

## とは
- 開発環境をより簡単に構築するための開発手法
- 複数のメンバーが使う時、統一の開発環境を使うための方法

## 説明
- dockerfile, docker composeは省略
### name
- コンテナーネーム
### features
- ghcr.io/devcontainers/features/docker-outside-of-docker:バージョン
    - dood: devcontainer の中でローカルのdockerを使うための設定
- ghcr.io/devcontainers/features/github-cli:バージョン
    - git: devcontainer の中でgitを使うための設定
### service
- docker composeサービス名
### workspaceFolder
- devcontainerを始めたとき、スタート場所
### customizations/vscode
- vscodeの設定
- .vscode フォルダと同じ役割
- 現在は推薦拡張機能のみ存在
### mounts
- ローカルの内容を devcontainerに紐づける部分
- "source=${localWorkspaceFolder},target=/workspace,type=bind,consistency=cached"
    - ローカルのルートをdevcontainer の中に紐づく
    - devcontainerの中で dockerを実装時、ローカルの dockerが実行されるので、ルートが devcontainerのルートではない、ローカルのルートが必要
- "source=${localWorkspaceFolder}/.devcontainer/id_rsa,target=/root/.ssh/id_rsa,type=bind,readonly"
    - ローカルのgithubログイン情報をdevcontainer の中で使えるようにしてくれる設定
    - 現在 ssh 繋がりを通してgithubログインをしているので、 .devcontainer/id_rsa ファイルを入れておいてログインしている (id_rsaは gitignoreを通して制御)
- "source=/var/run/docker.sock,target=/var/run/docker.sock,type=bind"
    - doodのための設定。ローカルのソケットとdevcontainerのソケットを紐づけるところ
### containerEnv
- 環境変数の設定
- ローカルのルートを devcontainer 中に紐づけ
### shutdownAction
- devcontainerを実行したvscodeを終了した時、行われる行動
- 現在はcomposeの終了をさせている
- defaultは stopContainer
