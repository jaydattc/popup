module Parser
  class LogParser
    def initialize(filename)
      @filename = filename
    end
    
    def call
      stats = read_and_parse @filename
      show_stats stats
    end

    def read_and_parse(filename)
      stats = {}
      IO.foreach(filename) do |line|
        line = line.to_s
        line.chomp! # remove carriage return
        line.strip! # remove leading and trailing space
        line.gsub!(/[ \t]+/, ' ') # replace tabs or spaces with a space

        path, ip = line.split(' ')
        unless stats[path].nil?
          stats[path][:visitor_ips] << ip
        else
          stats[path] = {visitor_ips: []}
        end
      end
      stats
    end

    def show_stats(stats)
      output = ""
      stats.each do |path, value|
        view_count = value[:visitor_ips].size
        unique_view_count = value[:visitor_ips].uniq.size
        output << "#{path} - Total Views: #{view_count}, Unique Views: #{unique_view_count}\n"
      end
      output
    end
  end
end