# RSA-Resources

This website will contain popular posts made by the community in order to easily consolidate them all in one place.


# Contributing

Make a [Pull Request](https://github.com/PogChonk/RSA-Resources/pulls) and have your file follow the specified criteria.
If Thodor12 or Pog Chonk finds your article acceptable/useful, we will format and modify the rest to match our other articles and merge it.

## Criteria
### Filename
- `.md` (markdown file extension/file type)
- `YYYY-MM-DD-article-name.md` (file name)

### Frontmatter
Jekyll uses Frontmatter to process required post data like the title, author, etc.
The minimum required in order to get it to work is the following
```
---
layout: post
title: <post name>
author: <author name>
---
```
Replace `<post name>` and `<author name>` with the correct values.

If you want to have your post hidden (not accessible, not shown on index and now presented by the JSON endpoint) then you can add `published: false` to the frontmatter block.

### Post content
The first line after the frontmatter block is the excerpt (short introduction line) of the post.
Try to keep any special formatting out of this, no code blocks. This is because this line is used in the JSON endpoint and used for OpenGraph data, if you put a codeblock in there for example you get very strange looking OpenGraph data.

### Headers
Do not use `h1` and `h2` headers (# and ##), the header of the site is already a `h1` and the title of the post itself is a `h2`, the content itself should only include subtitles and no more main titles, so only headers from `h3` (###) and on are allowed.
Please do not use special titlecasing like "This is My Post", following standard grammar rules (only capitalize first letter of line + names).
