function new_temp_dir()
    local f = assert(io.popen("mktemp -d", 'r'))
    local s = assert(f:read('*a'))
    f:close()
    s = s:gsub('[\n\r]+', '')
    mutt.set("attach_save_dir", s)
end

function save_temp_attach()
    local s = mutt.get("attach_save_dir")
    os.execute("mutt-save-attach "..s)
end
