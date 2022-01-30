# RDA-Resources

This website will contain popular posts made by the community in order to easily consolidate them all in one place.
- It is a subdomain of https://robloxdevelopmentassistance.org/

This repository is currently only moderated by Thodor12 and PogChonk.

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
category: <category>
author: <author name>
---
```
Replace `<post name>` and `<author name>` with the correct values.

If you want to have your post hidden (not accessible, not shown on index and now presented by the JSON endpoint) then you can add `published: false` to the frontmatter block.

#### Special characters in frontmatter blocks
Frontmatter does not allow special characters (for example colons) to be used in the frontmatter block, frontmatter is unable to parse these, the solution is to wrap
the values in quotes. Quotes themselves can still be used but need to be escaped. They do not need to be escaped if your entire title is not within quotes, unless the title starts with a quote.

For example:
```
title: This is a title " // VALID
title: This is a " title // VALID
title: " This is a title // INVALID (quote at the start)

title: "This is a title" // VALID
title: "This is a \" title" // VALID
title: "This is a " title" // INVALID (string interrupted halfway, yaml cannot process this)

title: "This is a : title" // VALID
title: This is a : title // INVALID (special yaml-specific character used without wrapping it in a string)

title: This is a \" title // VALID (the slash is shown)
title: "This is a \" title" // VALID (only the quote is shown)
```

### Post content
The first line after the frontmatter block is the excerpt (short introduction line) of the post.
Try to keep any special formatting out of this, no code blocks. This is because this line is used in the JSON endpoint and used for OpenGraph data, if you put a codeblock in there for example you get very strange looking OpenGraph data.

### Headers
Do not use `h1` and `h2` headers (# and ##), the header of the site is already a `h1` and the title of the post itself is a `h2`, the content itself should only include subtitles and no more main titles, so only headers from `h3` (###) and on are allowed.
Please do not use special titlecasing like "This is My Post", following standard grammar rules (only capitalize first letter of line + names).

### Links
When creating links we do want people to constantly navigate off the site, therefore all external links are required to have `{:target="_blank"}` behind them.
This makes sure that a link is always opened in a new tab as opposed to on the current tab. The notation goes like this:
`[Link name](url){:target="_blank"}`

## Testing locally
The project can be ran locally to test if your post works as expected. You need the following installed to be able to run it.

- Ruby
    - Windows (recommended): [https://rubyinstaller.org](https://rubyinstaller.org/) (this includes RubyGems and Bundler, make sure to get the Devkit installer to get native extensions)
    - Other: [https://www.ruby-lang.org/en/documentation/installation](https://www.ruby-lang.org/en/documentation/installation)
- RubyGems: [https://rubygems.org/pages/download](https://rubygems.org/pages/download)
- Bundler: [https://bundler.io/#getting-started](https://bundler.io/#getting-started)
- Native extensions: [https://www.msys2.org/](https://www.msys2.org/)

### Preparing the project
After cloning the project and having all the required tools installed you need to run:
`bundle install`

This will install all of the project dependencies defined in the `Gemfile`.

### Running the project
The project is served using [Jekyll](https://jekyllrb.com/), this processes all of the files in the project and turns it into proper HTML before deploying it.

In order to serve the project locally you have to run:
`bundle exec jekyll serve`
