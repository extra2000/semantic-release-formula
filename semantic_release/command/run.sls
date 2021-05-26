# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import SEMANTIC_RELEASE with context %}

run-semantic-release:
  cmd.run:
    - name: podman run -it --rm -e GIT_AUTHOR_EMAIL="{{ SEMANTIC_RELEASE.bot.email }}" -e GIT_AUTHOR_NAME="{{ SEMANTIC_RELEASE.bot.name }}" -e GIT_COMMITTER_EMAIL="{{ SEMANTIC_RELEASE.bot.email }}" -e GIT_COMMITTER_NAME="{{ SEMANTIC_RELEASE.bot.name }}" -e GITHUB_TOKEN="{{ SEMANTIC_RELEASE.bot.token }}" -e REPO="{{ SEMANTIC_RELEASE.repo }}" -e BRANCH="{{ SEMANTIC_RELEASE.branch }}" extra2000/semantic-release
    - cwd: /opt/semantic-release
    - runas: {{ SEMANTIC_RELEASE.hostuser.name }}
