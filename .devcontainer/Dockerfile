FROM golang:bookworm

# Git setting
RUN echo 'parse_git_branch() {' >> ~/.bashrc && \
    echo '  git branch 2>/dev/null | grep "* " | sed "s/* //"' >> ~/.bashrc && \
    echo '}' >> ~/.bashrc && \
    echo 'export PS1="\[\033[01;34m\]\u@\h \[\033[01;32m\]\w \[\033[01;33m\](\$(parse_git_branch))\[\033[00m\] $ "' >> ~/.bashrc

# 作業ディレクトリ
WORKDIR /api

CMD [ "sleep", "infinity" ]