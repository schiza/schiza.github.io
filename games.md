---
layout: page
title: Games
permalink: /games/
---

{% assign posts_grouped = site.posts | group_by: 'rating' | sort: 'name' | reverse %}
{% for group in posts_grouped %}
  {% assign rating = group.name %}
  {% assign posts = group.items %}
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