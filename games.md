---
layout: page
title: Games
permalink: /games/
---
{% assign ratings = site.posts | where: "game", "true" | map: 'rating' | uniq | sort | reverse %}
{% assign posts_grouped = site.posts | where: "game", "true" | group_by: 'rating' %}
{% for rating in ratings %}
  {% assign group = posts_grouped | where: "name", rating | first %}
  {% assign posts = group.items | sort: "title" %}
  <h2>{{ rating }}/10</h2>
  <ul>
    {% for post in posts %}
      <li>
        <a class="post-link" href="{{ post.url | relative_url }}">{{ post.title | escape }}</a>
	<span>
	  {% for tag in post.tags %}
	    <a href="/tag/{{ tag }}"><code><nobr>{{ tag }}</nobr></code>&nbsp;</a>
	  {% endfor %}
	</span>
      </li>
    {% endfor %}
  </ul>
{% endfor %}