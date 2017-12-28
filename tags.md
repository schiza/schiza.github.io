---
layout: page
title: Tags
permalink: /tags/
---

{% for tag in site.tags %}
  {% assign tag_name = tag[0] %}
  {% assign posts_count = tag[1].size %}
  <a href="/tag/{{ tag_name }}"><code><nobr>{{ tag_name }}</nobr></code></a> {{ posts_count }} posts
{% endfor %}
