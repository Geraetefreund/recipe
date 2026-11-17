-- recipe-lib.lua : loads a recipe from a Lua table file and typesets it.
local M = {}
local data = {}

---------------------------------------------------------------- helpers
local escmap = {
  ["\\"] = "\\textbackslash{}", ["&"] = "\\&", ["%"] = "\\%", ["$"] = "\\$",
  ["#"] = "\\#", ["_"] = "\\_", ["{"] = "\\{", ["}"] = "\\}",
  ["~"] = "\\textasciitilde{}", ["^"] = "\\textasciicircum{}",
}
local function esc(s) return (tostring(s):gsub("[\\&%%$#_{}~^]", escmap)) end

local function emit(s) tex.print(s) end

function M.load(path)
  local found = kpse.find_file(path, "tex") or path
  local f = io.open(found, "rb")
  if not f then error("recipe-lib: cannot open " .. path, 0) end
  local src = f:read("a"); f:close()
  local chunk, e = load(src, "@" .. found, "t", {})   -- sandboxed: no os/io
  if not chunk then error("recipe-lib: " .. e, 0) end
  data = chunk()
  if type(data) ~= "table" then error("recipe-lib: " .. path .. " must return a table", 0) end
end

function M.has(field) return data[field] ~= nil and data[field] ~= "" end

function M.title()  if data.title  then emit(esc(data.title))  end end
function M.source() if data.source then emit(esc(data.source)) end end
function M.intro()  if data.intro  then emit(esc(data.intro))  end end

function M.times()
  local lines = {}
  for _, t in ipairs(data.times or {}) do
    lines[#lines+1] = ("\\recipelabel{%s} \\textbf{%s}"):format(esc(t[1]), esc(t[2]))
  end
  if data.serves then
    lines[#lines+1] = ("\\recipelabel{%s} \\textbf{%s}"):format(esc(data.serves_label or "Serves"), esc(data.serves))
  end
  for i, line in ipairs(lines) do
    emit(i < #lines and (line .. "\\\\") or line)   -- "\\" = TeX line break
  end
end

function M.ingredients()
  emit("\\begin{recipeingredients}")
  for _, it in ipairs(data.ingredients or {}) do
    if type(it) == "string" then
      emit("\\item " .. esc(it))
    elseif it.heading then
      emit("\\item \\recipegroup{" .. esc(it.heading) .. "}")
    else
      local s = "\\item "
      local main = {}
      if it.qty  then main[#main+1] = esc(it.qty)  end
      if it.name then main[#main+1] = esc(it.name) end
      s = s .. "\\textbf{" .. table.concat(main, " ") .. "}"
      if it.note then s = s .. ", " .. esc(it.note) end
      emit(s)
    end
  end
  emit("\\end{recipeingredients}")
end

function M.steps()
  emit("\\begin{recipesteps}")
  for _, st in ipairs(data.steps or {}) do emit("\\item " .. esc(st)) end
  emit("\\end{recipesteps}")
end

function M.notes()
  if not data.notes then return end
  emit("\\begin{recipenotes}")
  for _, n in ipairs(data.notes) do emit("\\item " .. esc(n)) end
  emit("\\end{recipenotes}")
end

return M
