---
title: Home
---

{% assign post_groups = site.posts | group_by_exp: "item", "item.title | truncate: 1, '' | upcase" | sort: 'name' %}
{% for post_group in post_groups %}
<h3 id="{{ post_group.name | downcase }}"><a href="#{{ post_group.name | downcase }}" class="text-decoration-none">{{ post_group.name }}</a></h3>
{% for post in post_group.items %}
- [{{ post.title }}]({{ post.url }}) by {{ post.author }}
{% endfor %}
{% raw %}---{% endraw %}
{% endfor %}