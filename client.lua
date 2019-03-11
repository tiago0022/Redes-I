local socket = require("socket")
local host, port = "127.0.0.1", 51515
local client = assert(socket.tcp())

client:connect(host, port);
client:send("Conectado\n");

while true do

    local response, status = client:receive()
    print(response or status) -- imprime a resposta do servidor, se não houver resposta imprime o status da conexão
    if status == "closed" then
      break
    end
end

client:close()
