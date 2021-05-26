FROM ubuntu:20.04 AS base
MAINTAINER extra2000 <https://github.com/extra2000>

USER root

ENV HOME /root
WORKDIR ${HOME}

ENV NODE_VERSION "{{ nodejs.version }}"
ENV NVM_DIR /usr/local/nvm
ENV NODE_PATH ${NVM_DIR}/versions/node/v{$NODE_VERSION}/lib/node_modules
ENV PATH ${NVM_DIR}/versions/node/v${NODE_VERSION}/bin:${PATH}

# Install prerequisites
RUN apt update && apt install -y curl git

# Install NVM which automatically install NodeJS with version specified by ${NODE_VERSION}
RUN mkdir ${NVM_DIR}
RUN curl -o /opt/nvm-installer.sh -L https://raw.githubusercontent.com/nvm-sh/nvm/v{{ nodejs.nvm.version }}/install.sh
RUN bash /opt/nvm-installer.sh

# Install semantic-release
RUN npm install -g semantic-release conventional-changelog-conventionalcommits @semantic-release/commit-analyzer @semantic-release/release-notes-generator @semantic-release/changelog @semantic-release/npm @semantic-release/github @semantic-release/git @semantic-release/exec @commitlint/cli @commitlint/config-conventional

ENTRYPOINT git clone https://${GITHUB_TOKEN}:@github.com/${REPO} repo \
    && cd repo \
    && git checkout ${BRANCH} \
    && npx semantic-release --no-ci
