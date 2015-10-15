module Hakushu
  module Helper
    def self.wrap_and list
      list.map{|i| "(#{ i })"}.join(' && ')
    end
  end
end