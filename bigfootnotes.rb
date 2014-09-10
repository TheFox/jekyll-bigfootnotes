# Created @ 10.09.2014 by Christian Mayer <http://fox21.at>
# https://github.com/TheFox/jekyll-bigfootnotes

# See also the kramdown Big Footnotes feature:
#     http://blog.fox21.at/2014/09/09/kramdown-big-footnotes.html


module Kramdown
  module Options
      
      define(:footnote_big, Boolean, true, <<EOF)
If this option is `true`, footnote will be big numbers, no <sup>superscript</sup>.

Default: true
Used by: BigfootnotesHtml converter
EOF
      
      define(:footnote_prefix, String, '[', <<EOF)
The prefix for the footnote link.

Default: '['
Used by: BigfootnotesHtml converter
EOF
      
      define(:footnote_suffix, String, ']', <<EOF)
The suffix for the footnote link.

Default: ']'
Used by: BigfootnotesHtml converter
EOF
      
  end
end

module Kramdown
  module Converter
    class BigfootnotesHtml < Html
      def convert_footnote(el, indent)
        # This is a shitty workaround for
        # http://blog.fox21.at/2014/09/09/kramdown-big-footnotes.html
        
        html_original = super el, indent
        
        if @options[:footnote_big]
          link = ''
          id = ''
          number = 0
          
          if html_original =~ /id="([^"]+)"/
            id = $1
          end
          if html_original =~ /href="([^"]+)"/
            link = $1
          end
          if html_original =~ />([^<]+)<.a>/
            number = $1
          end
          
          html = '<a href="%s" class="footnote" id="%s">%s%d%s</a>' % [
              link, id, @options[:footnote_prefix], number, @options[:footnote_suffix] ]
          
          return html
        else
          return html_original
        end
      end
    end
  end
end

# This class is the actual custom Jekyll converter.
class Jekyll::Converters::Markdown::KramdownBigfootnotes
  def initialize(config)
    require 'kramdown'
    @config = config
  rescue LoadError
    STDERR.puts 'You are missing a library required for Markdown. Please run:'
    STDERR.puts '  $ [sudo] gem install kramdown'
    raise FatalException.new("Missing dependency: kramdown")
  end

  def convert(content)
    options = @config['kramdown']
    kramdown = Kramdown::Document.new(content, options);
    html = kramdown.to_bigfootnotes_html
    return html;
  end
end