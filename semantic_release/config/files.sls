# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import SEMANTIC_RELEASE with context %}

/opt/semantic-release:
  file.directory:
    - user: {{ SEMANTIC_RELEASE.hostuser.name }}
    - group: {{ SEMANTIC_RELEASE.hostuser.group }}

/opt/semantic-release/Dockerfile:
  file.managed:
    - name: /opt/semantic-release/Dockerfile
    - source: salt://semantic_release/files/Dockerfile
    - template: jinja
    - context:
      projectname: {{ SEMANTIC_RELEASE.projectname }}
      nodejs: {{ SEMANTIC_RELEASE.nodejs }}
