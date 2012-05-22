class Document < ActiveRecord::Base
  attr_accessible :name, :url
  
  def self.search_response word
    result = []
    worker = YAML.load_file((File.open(File.expand_path("./../../../config/worker.yml", __FILE__))))
    for doc in worker["worker"]["docs"]
      if doc[1]["dic"].has_key? word 
        info = {:doc => doc[0] , :times => doc[1][word], :name => doc[1]["name"]}
        result.push(info)
      end 
    end
    res = {:url => worker["worker"]["url"], :info => result}
    return res
  end
end
