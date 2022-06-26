FROM node:18.4.0
RUN apt-get update
## Install doppler
RUN apt-get install -y apt-transport-https ca-certificates curl gnupg
RUN curl -sLf --retry 3 --tlsv1.2 --proto "=https" 'https://packages.doppler.com/public/cli/gpg.DE2A7741A397C129.key' | apt-key add -
RUN echo "deb https://packages.doppler.com/public/cli/deb/debian any-version main" | tee /etc/apt/sources.list.d/doppler-cli.list
RUN apt-get update
RUN apt-get install doppler
## Install zsh
RUN apt-get install -y zsh
## Install oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
COPY .oh-my-zsh /root/.oh-my-zsh/
## https://github.com/moby/moby/issues/37965
RUN true
COPY .zshrc /root/


