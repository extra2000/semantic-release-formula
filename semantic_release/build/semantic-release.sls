# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import SEMANTIC_RELEASE with context %}

build-semantic-release:
  cmd.run:
    - name: podman build -t {{ SEMANTIC_RELEASE.image.name }} .
    - cwd: /opt/semantic-release
    - runas: {{ SEMANTIC_RELEASE.hostuser.name }}
