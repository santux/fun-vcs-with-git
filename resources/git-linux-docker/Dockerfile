FROM quay.io/fedora/fedora-minimal:latest

RUN microdnf install -y \
    git \
    zsh \
    curl \
    tar \
    util-linux \
    shadow-utils \
    ncurses \
    passwd && \
    microdnf clean all

RUN useradd -m -s /bin/zsh dummy
USER dummy
WORKDIR /home/dummy

RUN git config --global user.email "dummy@crashtest.com.mx" && \
    git config --global user.name "Dummy Crash" && \
    git config --global init.defaultBranch main

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended \
    && cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc \
    && sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/' ~/.zshrc

CMD ["zsh"]
