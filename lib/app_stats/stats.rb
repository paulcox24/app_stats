require 'app_stats/stats'

module AppStats
  module Stats

    #Sort the Ruby files in your project by number of has_many
    PIPE_MINUS_COVERAGE = '| grep -v "coverage"'
    CURRENT_FILE = File.basename(__FILE__)
    PIPE_MINUS_CURRENT_FILE = "| grep -v \"#{CURRENT_FILE}\""
    HAS_MANY_SEARCH = "ack \" has_many \" -c | awk -F \":\" '{print $2,$1}' | grep -v \"0\" #{PIPE_MINUS_COVERAGE} #{PIPE_MINUS_CURRENT_FILE} | sort -rn"

    def self.get_raw(command)
      `#{command}`
    end

    def self.get_has_many_relationships
      get_raw(HAS_MANY_SEARCH).split("\n")
    end

    def self.get_has_many_assocations(options={})
      ul(AppStats::Stats.get_has_many_relationships, options)
    end

    # http://qerub.se/list-helper-for-rails
    def self.html_list(type, elements, options = {})
      if elements.empty?
        "" 
      else
        lis = elements.map{ |x| content_tag("li", x) }
        content_tag(type, lis.join.html_safe, options)
      end
    end

    def self.ul(*args)
      html_list("ul", *args)
    end

    def self.ol(*args)
      html_list("ol", *args)
    end
  end
end