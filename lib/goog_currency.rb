require "rest_client"
require "json"
require "pp"

module GoogCurrency
  def self.method_missing(meth, *args)
    puts "Method missinf: #{meth}"
    pp args
    from, to = meth.to_s.split("_to_")

    puts "from =#{from} to=#{to}"
    super(meth, *args) and return if from.nil? or from == "" or to.nil? or to == ""

    #response = RestClient.get("http://www.google.com/ig/calculator?hl=en&q=#{args.first}#{from.upcase}=?#{to.upcase}").body
    url = "http://rate-exchange.appspot.com/currency?from=#{from.upcase}&to=#{to.upcase}&q=#{args.first}"
    response = RestClient.get(url).body
    pp url
    puts "response = #{response}"

    # response is not valid json
    response.gsub!(/(lhs|rhs|error|icc)/, '"\1"')
    response_hash = JSON.parse(response)
    pp "response_hash = #{response_hash}"

    if response_hash['error'].nil? or response_hash['error'] == ""
      #response_hash['rhs'].to_f
      response_hash['v'].to_f
    else
      raise "An error occurred: #{response_hash['error']}"
    end
  end

  def self.respond_to?(meth)
  from, to = meth.to_s.split("_to_")

  if from.nil? or from == "" or to.nil? or to == ""
    super
  else
    true
  end
  end
end
