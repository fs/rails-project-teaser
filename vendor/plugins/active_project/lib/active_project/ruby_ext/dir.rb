Dir[File.dirname(__FILE__) + "/dir/*.rb"].each { |file| require(file) }