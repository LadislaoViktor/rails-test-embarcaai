# Read json file
require 'json'
# Get each name:

def hash_parser(json_file)
  if json_file
    data_hash = JSON.parse(json_file)

    last_name = data_hash.to_a.last['nome'].to_s

    data_hash.each do |n|
      unless last_name.eql?(n['nome'].to_s)
        puts n['nome'].to_s + ','
      else
        puts n['nome'].to_s
      end
    end
  else
    p 'deu ruim'
  end
end

p 'Municípios do Paraná:'
json_file = File.read('./municipios.json')
hash_parser(json_file)

p 'Municípios de SC:'
json_file = File.read('./municipios-sc.json')
hash_parser(json_file)

p 'Municípios do Rio Grande do Sul:'
json_file = File.read('./municipios-rs.json')
hash_parser(json_file)
