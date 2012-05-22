# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'rubygems'
require 'hpricot'

def read_config file_path
  srvs = []
  config = Hpricot::XML(File.open(file_path, 'r'))
  (config/:servidores/:servidor).each do |srv|
    srvs.push srv.inner_text 
  end
  return srvs
end

response = read_config File.expand_path("../../config/workers.xml", __FILE__)
for srv in response
  puts "Creando: " << srv
  worker = Worker.create([{ url: srv}])
end

#Relacionando los documentos al primer worker creado

docs = %w[ reto4.pdf reto3.pdf ]
for doc in docs
  
  puts "Registrando: " << doc
  doc = Document.create({url: "/docs/#{doc}"} , {worker_id: 1})
  puts "doc: #{doc}"
end



