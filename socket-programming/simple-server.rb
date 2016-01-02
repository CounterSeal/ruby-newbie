# A Simple Server

require 'socket'

server = TCPServer.open(2000)
loop do
	client = server.accept
	request = client.gets
	method = request.split(' ')[0]

	if method == "GET"
		method,path,version = request.split(' ')
		client.puts(version + " 200 OK")
		client.puts("Current time: " + Time.now.ctime)
		client.puts("File length: " + File.open(path).size.to_s + "\r\n\r\n")
		client.puts(File.open(path).readlines.each { |line| puts line })
	else
		client.puts(version + " 404 Not Found")
		client.puts(Time.now.ctime)
	end

	client.puts "Closing the connection. Bye!"
	client.close
end
