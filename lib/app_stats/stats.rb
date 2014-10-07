require 'app_stats/stats'

module AppStats

    #Sort the Ruby files in your project by number of has_many
    PIPE_MINUS_COVERAGE = '| grep -v "coverage"'
    CURRENT_FILE = File.basename(__FILE__)
    PIPE_MINUS_CURRENT_FILE = "| grep -v \"#{CURRENT_FILE}\""
    HAS_MANY_SEARCH = "ack \" has_many \" -c | awk -F \":\" '{print $2,$1}' | grep -v \"0\" #{PIPE_MINUS_COVERAGE} #{PIPE_MINUS_CURRENT_FILE} | sort -rn"
    LINES_OF_CODE_SEARCH = "find . -iname \"*.rb\" -type f -exec cat {} \\; | wc -l"


    def self.get_raw(command)
      `#{command}`
    end

    def self.get_has_many_relationships
      get_raw(HAS_MANY_SEARCH).split("\n")
    end

    def self.get_lines_of_code
      # Returns a string with lines of code"
      get_raw(LINES_OF_CODE_SEARCH).strip
    end
end