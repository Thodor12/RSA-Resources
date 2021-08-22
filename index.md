---
title: Home
---

# {{ page.title }}

{% assign characters = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z" | split: "," %}
{% for character in characters %}
### [{{ character }}](#{{ character | downcase }})
{% for post in site.posts %}
{% assign titlechar = post.title | truncate: 1, "" | upcase %}
{% if titlechar == character %}
- [{{ post.title }}]({{ post.url }}) by {{ post.author }}
{% endif %}
{% endfor %}
{% raw %}---{% endraw %}
{% endfor %}