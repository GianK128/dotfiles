local status, cs = pcall(require, 'onedark')
if (not status) then return end

cs.load()
