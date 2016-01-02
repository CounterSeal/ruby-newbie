# A Simple Server

require 'socket'
require 'json'

server = TCPServer.open(2000)
loop do
	client = server.accept
=begin
	request = client.gets
	header = request.split("\r\n\r\n")[0]
	method,path,version = header.split(' ')
	file = File.open(path)
=end
	
	header = ""
	while line = client.gets
		header += line
		break if header =~/\r\n\r\n$/
	end

	method = header.split[0]
  path = header.split[1][1..-1]
  version = header.split[2]

  file = File.open(path)

	body_size = header.split(' ').last.to_i
	body = client.read(body_size)

	if method == "GET"
		client.puts(version + " 200 OK")
		client.puts("Current time: " + Time.now.ctime)
		client.puts("Content-Length: " + file.size.to_s + "\r\n\r\n")
		client.puts(file.readlines.each { |line| puts line })
	elsif method == "POST"
		params = JSON.parse(body)
		data = "<li>Name: #{params['viking']['name']}</li>\n\t\t\t" +
					 "<li>E-Mail: #{params['viking']['email']}</li>"

		client.puts("POST #{path} #{version} 200 OK\n" +
							  "#{Time.now.ctime}\n" +
								"Content-Length: #{file.size}\r\n\r\n" +
								"#{file.read.gsub('<%= yield %>', data)}")
	else
		client.puts(version + " 404 Not Found")
		client.puts(Time.now.ctime)
	end

	client.puts "Closing the connection. Bye!"
	client.close
end
