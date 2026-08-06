-- ============================================================
-- Tree-sitter Highlight Preview
-- ============================================================

-- @annotation
---@param value string
---@return boolean

-- @attribute
---@deprecated
---@async

-- @boolean
local boolean = true

-- @character
local char = 'a'

-- @comment
-- обычный комментарий

-- @constant
local CONSTANT = 123

-- @constructor
local obj = {}

-- @diff.delta
-- changed line

-- @diff.minus
-- - removed

-- @diff.plus
-- + added


-- @function
local function test()
	return true
end

test()


-- @keyword
local function keywords()
	if true then
		for i = 1, 10 do
			while false do
				break
			end
		end
	end

	return nil
end


-- @keyword.conditional
if true then
end


-- @keyword.exception
pcall(function()
	error("error")
end)


-- @keyword.import
local module = require("module")


-- @keyword.operator
local result = true and false or true


-- @keyword.repeat
for i = 1, 5 do
end


-- @keyword.return
return


-- @label
::label::


-- @markup
-- # Heading
-- *italic*
-- **bold**
-- ~~strike~~


-- @markup.heading.1
-- # Big heading

-- @markup.heading.2
-- ## Medium heading

-- @markup.heading.3
-- ### Small heading


-- @markup.link
-- https://neovim.io


-- @markup.raw
-- `raw text`


-- @method
local object = {
	method = function()
	end
}

object.method()


-- @module
local math = require("math")


-- @number
local number = 12345


-- @number.float
local float = 3.14159


-- @operator
local calculation = 1 + 2 * 3


-- @property
local table = {
	name = "Neovim",
}


-- @punctuation.bracket
local array = {
	1,
	2,
	3,
}


-- @punctuation.delimiter
local values = { 1, 2, 3 }


-- @string
local text = "Hello world"


-- @string.escape
local escaped = "\n\t\\"


-- @string.regexp
local pattern = "[a-z]+"


-- @tag
-- <div></div>


-- @tag.attribute
-- <div class="test">


-- @type
local TypeName = {}

---@type string
local typed


-- @type.builtin
local str = tostring(123)


-- @variable
local variable = "hello"


-- @variable.builtin
local builtin = vim


-- @variable.parameter
local function params(parameter)
	return parameter
end


-- ============================================================
-- Legacy Vim highlight groups
-- ============================================================

-- Boolean
true

-- Character
'a'

-- Comment
-- comment

-- Conditional
if true then end

-- Constant
VALUE

-- Function
print()

-- Keyword
local

-- Number
123

-- String
"hello"

-- Type
string
