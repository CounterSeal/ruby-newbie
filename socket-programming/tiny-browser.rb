# A Tiny Web Browser

require 'socket'

host = 'localhost'
port = 2000
path = "index.html"

puts "What type of request would you like to send?"
while true
	request_type = gets.chomp.upcase
	if request_type == "GET"
		request = "GET #{path} HTTP/1.0\r\n\r\n"
		break
	elsif request_type == "POST"
		request = "POST #{path} HTTP/1.0\r\n\r\n"
		printf "What is your name? "
		name = gets.chomp
		printf "What is your e-mail address? "
		email = gets.chomp
		vikings = {:viking => {:name => name, :email => email}}
		break
	else
		puts "Invalid request. Enter either GET or POST"
	end
end

socket = TCPSocket.open(host, port)
socket.print(request)
response = socket.read
headers,body = response.split("\r\n\r\n", 2)

status = headers.split("\n")[0]
version,code,reason = status.split(' ')
if code == "200"
	puts body
else
	puts code + ' ' + reason
end
