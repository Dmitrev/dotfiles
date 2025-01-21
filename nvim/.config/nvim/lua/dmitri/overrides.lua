local path = os.getenv("HOME") .. "/goodlord-config/nvim/goodlord-core.lua"
local f = io.open(path, "r");
if f ~= nil then
  io.close(f)
  require(path)
end
