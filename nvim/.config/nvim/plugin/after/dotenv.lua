local ok, dotenv = pcall(require, 'dotenv')
if not ok then
    return
end

dotenv.setup({
  enable_on_load = true, -- will load your .env file upon loading a buffer
  verbose = false, -- show error notification if .env file is not found and if .env is loaded
})
