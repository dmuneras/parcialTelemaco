class Worker < ActiveRecord::Base
  attr_accessible :name, :url
  
  def self.read_config 
    srvs = []
    config = Hpricot::XML(File.open(File.expand_path("./../../../config/workers.xml", __FILE__)))
    (config/:servidores/:servidor).each do |srv|
      srvs.push srv.inner_text 
    end
    return srvs
  end
  
  def self.search word
     srvs = self.read_config
     random = Random.rand(srvs.size-1)
     srv = srvs[random].to_s.strip
     server =  srv + ".json"
     srv = srv.gsub("searchWS", "")
     result = get(server, word) 
     res = {:server => srv  ,:info => result}
     return res
  end
  
  def self.get(uri, word)
     uri = uri.strip
     uri = URI(uri)
     req = Net::HTTP::Post.new(uri.path)
     req.set_form_data({'word'=> word})
     res = Net::HTTP.start(uri.hostname, uri.port) do |http|
        http.request(req)
     end
     case res
      when Net::HTTPSuccess, Net::HTTPRedirection
        response = JSON.parse res.body 
        return response
      else
        return res.value
      end  
  end
end
