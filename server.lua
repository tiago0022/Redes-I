local socket = require("socket") -- pacote
local server = assert(socket.bind("127.0.0.1", 51515)) -- definir endereço e porta
local ip, port = server:getsockname()
local timeout = 10 -- tempo de timeout

print("Server funcionando com endereco " .. ip .. ", e porta " .. port)
print("Tempo para timeout = " .. timeout)

-- Loop aguardando conexão do cliente
while true do

  local client = server:accept() -- Aceita qualquer cliente
  client:settimeout(timeout) -- Tempo máximo de espera pela line do cliente

  local line, err = client:receive() -- se tiver erro vai pra err

  if not err then print("Mensagem recebida = " .. line .. "\n") -- imprime mensagem do cliente
  else print("Erro = " .. err .. "\n") end

  if not err then client:send("Mensagem recebida pelo servidor = " .. line .. "\n") end --

  client:close() -- encerra a conexão
end
