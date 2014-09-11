# Jekyll Bigfootnotes Plugin
While [kramdown](http://kramdown.gettalong.org/) uses only <sup>superscript</sup> numbers to link to the footnotes this plugin enables big footnote links.

Instead of

> Lorem ipsum dolor sit amet<sup><a href="">1</a></sup>

you get

> Lorem ipsum dolor sit amet<a href="">[1]</a>

**Note**: Consider that this is only a shitty workaround for the [kramdown Big Footnotes](http://blog.fox21.at/2014/09/09/kramdown-big-footnotes.html) feature. See also [Issue #167](https://github.com/gettalong/kramdown/pull/167) at the kramdown project.

## Install
1. Clone the project from `https://github.com/TheFox/jekyll-bigfootnotes.git`.
2. Copy `bigfootnotes.rb` to the Jekyll `_plugins` directory.
3. Add the following lines to your `_config.yml`:

		markdown: KramdownBigfootnotes

## Configuration

	markdown: KramdownBigfootnotes
	kramdown:
	    footnote_big: true
	    footnote_prefix: '['
	    footnote_suffix: ']'

`footnote_big`, `footnote_prefix` and `footnote_suffix` are optional. You can also use all other [standard kramdown options](http://kramdown.gettalong.org/options.html).

## Related Links
- [kramdown Big Footnotes](http://blog.fox21.at/2014/09/09/kramdown-big-footnotes.html)
- [Jekyll](https://github.com/jekyll/jekyll)
- [kramdown](http://kramdown.gettalong.org/)

## License
Copyright (C) 2014 Christian Mayer <http://fox21.at>

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have received a copy of the GNU General Public License along with this program. If not, see <http://www.gnu.org/licenses/>.
