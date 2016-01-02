# A Tiny Web Browser

require 'socket'
require 'json'

host = 'localhost'
port = 2000
path = "/index.html"

puts "What type of request would you like to send?"
while true
	request_type = gets.chomp.upcase
	if request_type == "GET"
		request = "GET #{path} HTTP/1.0\r\n\r\n"
		break
	elsif request_type == "POST"
		printf "What is your name? "
		name = gets.chomp
		printf "What is your e-mail address? "
		email = gets.chomp
		vikings = {:viking => {:name => name, :email => email}}
		json_hash = vikings.to_json

		request = "POST /thanks.html HTTP/1.0\n" +
		"Content-Length: #{json_hash.length}\r\n\r\n" +
		"#{json_hash}"
		break
	else
		puts "Invalid request. Enter either GET or POST"
	end
end

socket = TCPSocket.open(host, port)
socket.print(request)
response = socket.read
headers,body = response.split("\r\n\r\n", 2)

puts body
#status = headers.split("\n")[0]
#version,code,reason = status.split(' ')
#if code == "200"
	#puts body
#else
	#puts code + ' ' + reason
#end
