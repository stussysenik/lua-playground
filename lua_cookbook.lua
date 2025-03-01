--[[
    Lua Cookbook: Mastering Lua from First Principles
    
    This file contains executable examples of Lua concepts organized from
    basic to advanced. Run sections individually to see results and experiment.
    
    To execute a specific section, uncomment it and run:
    lua lua_cookbook.lua
]]

-- =====================================================
-- SECTION 1: BASICS
-- =====================================================

--[[
    1.1 Hello World and Comments
]]

-- print("Hello, World!") -- Single line comment

--[[
    This is a
    multi-line comment
]]

--[[
    1.2 Variables and Data Types
]]

-- local name = "Lua"       -- String
-- local version = 5.4      -- Number (all numbers in Lua are floating point)
-- local isAwesome = true   -- Boolean
-- local noValue = nil      -- Nil
-- 
-- print(type(name))        -- Output: string
-- print(type(version))     -- Output: number
-- print(type(isAwesome))   -- Output: boolean
-- print(type(noValue))     -- Output: nil
-- print(type(print))       -- Output: function
-- print(type({}))          -- Output: table

--[[
    1.3 Basic Operators
]]

-- -- Arithmetic
-- print(5 + 3)    -- Addition: 8
-- print(5 - 3)    -- Subtraction: 2
-- print(5 * 3)    -- Multiplication: 15
-- print(5 / 3)    -- Division: 1.6666666666667
-- print(5 % 3)    -- Modulo: 2
-- print(5 ^ 3)    -- Exponentiation: 125
-- 
-- -- Relational
-- print(5 == 5)   -- Equal: true
-- print(5 ~= 3)   -- Not equal: true
-- print(5 > 3)    -- Greater than: true
-- print(5 < 3)    -- Less than: false
-- print(5 >= 3)   -- Greater than or equal: true
-- print(5 <= 3)   -- Less than or equal: false
-- 
-- -- Logical
-- print(true and false)   -- Logical AND: false
-- print(true or false)    -- Logical OR: true
-- print(not true)         -- Logical NOT: false

--[[
    1.4 Strings
]]

-- local s1 = "Hello"
-- local s2 = 'World'
-- local s3 = [[
-- Multiline
-- string
-- ]]
-- 
-- -- Concatenation
-- print(s1 .. " " .. s2)  -- Output: Hello World
-- 
-- -- Length
-- print(#s1)  -- Output: 5
-- 
-- -- String library
-- print(string.upper(s1))  -- Output: HELLO
-- print(string.lower(s2))  -- Output: world
-- print(string.sub(s1, 1, 2))  -- Output: He
-- print(string.find(s1, "ll"))  -- Output: 3 4
-- print(string.gsub(s1, "l", "L", 1))  -- Output: HeLlo 1

-- =====================================================
-- SECTION 2: CONTROL STRUCTURES
-- =====================================================

--[[
    2.1 If-Then-Else
]]

-- local age = 25
-- 
-- if age < 18 then
--     print("Minor")
-- elseif age >= 18 and age < 65 then
--     print("Adult")
-- else
--     print("Senior")
-- end

--[[
    2.2 Loops
]]

-- -- While loop
-- local count = 1
-- while count <= 5 do
--     print(count)
--     count = count + 1
-- end
-- 
-- -- Repeat-until loop (executes at least once)
-- local num = 10
-- repeat
--     print(num)
--     num = num - 1
-- until num < 5
-- 
-- -- Numeric for loop
-- for i = 1, 5 do
--     print(i)
-- end
-- 
-- -- For loop with step
-- for i = 10, 1, -2 do
--     print(i)
-- end

-- =====================================================
-- SECTION 3: FUNCTIONS
-- =====================================================

--[[
    3.1 Function Basics
]]

-- -- Function definition
-- function greet(name)
--     return "Hello, " .. name .. "!"
-- end
-- 
-- -- Function call
-- print(greet("Lua"))
-- 
-- -- Anonymous functions
-- local sayHello = function(name)
--     return "Hi, " .. name .. "!"
-- end
-- 
-- print(sayHello("Developer"))
-- 
-- -- Multiple return values
-- function getNameAndAge()
--     return "John", 30
-- end
-- 
-- local name, age = getNameAndAge()
-- print(name, age)

--[[
    3.2 Variable Arguments
]]

-- function sum(...)
--     local result = 0
--     for _, value in ipairs({...}) do
--         result = result + value
--     end
--     return result
-- end
-- 
-- print(sum(1, 2, 3, 4, 5))  -- Output: 15

--[[
    3.3 Closures
]]

-- function counter()
--     local count = 0
--     return function()
--         count = count + 1
--         return count
--     end
-- end
-- 
-- local c1 = counter()
-- print(c1())  -- Output: 1
-- print(c1())  -- Output: 2
-- 
-- local c2 = counter()
-- print(c2())  -- Output: 1

-- =====================================================
-- SECTION 4: TABLES
-- =====================================================

--[[
    4.1 Table Basics
]]

-- -- Creating tables
-- local emptyTable = {}
-- local person = {name = "John", age = 30}
-- local colors = {"red", "green", "blue"}
-- 
-- -- Accessing elements
-- print(person.name)      -- Output: John
-- print(person["age"])    -- Output: 30
-- print(colors[1])        -- Output: red (tables are 1-indexed in Lua)
-- 
-- -- Adding/modifying elements
-- person.job = "Developer"
-- colors[4] = "yellow"
-- 
-- -- Table length
-- print(#colors)  -- Output: 4

--[[
    4.2 Table Iteration
]]

-- local person = {name = "John", age = 30, job = "Developer"}
-- 
-- -- Iterate over array part (numeric indices)
-- local fruits = {"apple", "banana", "orange"}
-- for i, fruit in ipairs(fruits) do
--     print(i, fruit)
-- end
-- 
-- -- Iterate over all key-value pairs
-- for key, value in pairs(person) do
--     print(key, value)
-- end

--[[
    4.3 Table as Modules
]]

-- local mathUtils = {
--     add = function(a, b) return a + b end,
--     subtract = function(a, b) return a - b end,
--     multiply = function(a, b) return a * b end,
--     divide = function(a, b) return a / b end
-- }
-- 
-- print(mathUtils.add(5, 3))       -- Output: 8
-- print(mathUtils.multiply(4, 2))  -- Output: 8

-- =====================================================
-- SECTION 5: METATABLES AND METAMETHODS
-- =====================================================

--[[
    5.1 Metatables Basics
]]

-- local t1 = {value = 5}
-- local t2 = {value = 10}
-- 
-- local mt = {
--     __add = function(a, b)
--         return {value = a.value + b.value}
--     end
-- }
-- 
-- setmetatable(t1, mt)
-- 
-- local result = t1 + t2
-- print(result.value)  -- Output: 15

--[[
    5.2 Common Metamethods
]]

-- local person = {name = "John", age = 30}
-- 
-- local mt = {
--     __tostring = function(obj)
--         return obj.name .. ", " .. obj.age .. " years old"
--     end,
--     
--     __index = function(obj, key)
--         if key == "description" then
--             return obj.name .. " is " .. obj.age .. " years old"
--         end
--         return nil
--     end,
--     
--     __newindex = function(obj, key, value)
--         print("Adding new property: " .. key .. " with value: " .. value)
--         rawset(obj, key, value)
--     end
-- }
-- 
-- setmetatable(person, mt)
-- 
-- print(person)                -- Output: John, 30 years old
-- print(person.description)    -- Output: John is 30 years old
-- person.job = "Developer"     -- Output: Adding new property: job with value: Developer

-- =====================================================
-- SECTION 6: OBJECT-ORIENTED PROGRAMMING
-- =====================================================

--[[
    6.1 Basic OOP with Tables and Metatables
]]

-- -- Define a class
-- local Person = {}
-- Person.__index = Person
-- 
-- function Person.new(name, age)
--     local self = setmetatable({}, Person)
--     self.name = name
--     self.age = age
--     return self
-- end
-- 
-- function Person:greet()
--     return "Hello, my name is " .. self.name
-- end
-- 
-- function Person:getAge()
--     return self.age
-- end
-- 
-- -- Create an instance
-- local john = Person.new("John", 30)
-- print(john:greet())    -- Output: Hello, my name is John
-- print(john:getAge())   -- Output: 30

--[[
    6.2 Inheritance
]]

-- -- Parent class
-- local Animal = {}
-- Animal.__index = Animal
-- 
-- function Animal.new(name)
--     local self = setmetatable({}, Animal)
--     self.name = name
--     return self
-- end
-- 
-- function Animal:speak()
--     return "Animal sound"
-- end
-- 
-- -- Child class
-- local Dog = {}
-- Dog.__index = Dog
-- setmetatable(Dog, {__index = Animal})  -- Inheritance
-- 
-- function Dog.new(name, breed)
--     local self = setmetatable(Animal.new(name), Dog)
--     self.breed = breed
--     return self
-- end
-- 
-- function Dog:speak()
--     return "Woof!"
-- end
-- 
-- -- Create instances
-- local generic = Animal.new("Generic Animal")
-- local rex = Dog.new("Rex", "German Shepherd")
-- 
-- print(generic:speak())  -- Output: Animal sound
-- print(rex:speak())      -- Output: Woof!
-- print(rex.name)         -- Output: Rex
-- print(rex.breed)        -- Output: German Shepherd

-- =====================================================
-- SECTION 7: MODULES AND PACKAGES
-- =====================================================

--[[
    7.1 Creating a Module
    
    -- In a file named 'mymodule.lua':
    local M = {}
    
    function M.sayHello(name)
        return "Hello, " .. name .. "!"
    end
    
    function M.sayGoodbye(name)
        return "Goodbye, " .. name .. "!"
    end
    
    return M
    
    -- In your main file:
    local mymodule = require("mymodule")
    print(mymodule.sayHello("Lua"))
]]

--[[
    7.2 Module Patterns
    
    -- Private functions pattern:
    local M = {}
    
    -- Private function
    local function capitalize(str)
        return str:sub(1,1):upper() .. str:sub(2)
    end
    
    -- Public function that uses private function
    function M.greet(name)
        return "Hello, " .. capitalize(name) .. "!"
    end
    
    return M
]]

-- =====================================================
-- SECTION 8: ERROR HANDLING
-- =====================================================

--[[
    8.1 Basic Error Handling
]]

-- -- pcall (protected call)
-- local success, result = pcall(function()
--     return 10/2
-- end)
-- 
-- if success then
--     print("Success:", result)  -- Output: Success: 5
-- else
--     print("Error:", result)
-- end
-- 
-- -- Error case
-- success, result = pcall(function()
--     return 10/0  -- This will cause an error
-- end)
-- 
-- if success then
--     print("Success:", result)
-- else
--     print("Error:", result)  -- Output: Error: attempt to divide by zero
-- end

--[[
    8.2 Raising Errors
]]

-- function divide(a, b)
--     if b == 0 then
--         error("Cannot divide by zero", 2)
--     end
--     return a / b
-- end
-- 
-- local success, result = pcall(divide, 10, 0)
-- 
-- if success then
--     print("Result:", result)
-- else
--     print("Error:", result)  -- Output: Error: Cannot divide by zero
-- end

--[[
    8.3 xpcall with Error Handler
]]

-- local function errorHandler(err)
--     return "Caught an error: " .. err
-- end
-- 
-- local success, result = xpcall(function()
--     error("Something went wrong")
-- end, errorHandler)
-- 
-- print(success)  -- Output: false
-- print(result)   -- Output: Caught an error: Something went wrong

-- =====================================================
-- SECTION 9: STANDARD LIBRARIES
-- =====================================================

--[[
    9.1 String Library
]]

-- local s = "hello world"
-- print(string.upper(s))          -- Output: HELLO WORLD
-- print(string.find(s, "world"))  -- Output: 7 11
-- print(string.gsub(s, "world", "Lua"))  -- Output: hello Lua 1
-- print(string.match(s, "h(.+)d"))  -- Output: ello worl

--[[
    9.2 Table Library
]]

-- local t = {10, 20, 5, 40, 30}
-- 
-- table.sort(t)
-- for i, v in ipairs(t) do
--     print(i, v)  -- Output: sorted table
-- end
-- 
-- table.insert(t, 25)
-- print(#t)  -- Output: 6
-- 
-- table.remove(t, 2)
-- print(#t)  -- Output: 5

--[[
    9.3 Math Library
]]

-- print(math.abs(-10))     -- Output: 10
-- print(math.floor(3.7))   -- Output: 3
-- print(math.ceil(3.7))    -- Output: 4
-- print(math.max(5, 10))   -- Output: 10
-- print(math.min(5, 10))   -- Output: 5
-- print(math.random())     -- Output: random number between 0 and 1
-- print(math.random(1, 10))  -- Output: random integer between 1 and 10

--[[
    9.4 OS Library
]]

-- print(os.time())  -- Output: current time as seconds since epoch
-- print(os.date())  -- Output: current date and time as string
-- 
-- -- Sleep for 1 second
-- local start = os.time()
-- os.execute("sleep 1")  -- Unix/Linux
-- -- os.execute("timeout /t 1")  -- Windows
-- local finish = os.time()
-- print("Elapsed time:", finish - start)

-- =====================================================
-- SECTION 10: ADVANCED CONCEPTS
-- =====================================================

--[[
    10.1 Coroutines
]]

-- local co = coroutine.create(function()
--     print("Coroutine: First")
--     coroutine.yield()
--     print("Coroutine: Second")
--     coroutine.yield()
--     print("Coroutine: Third")
-- end)
-- 
-- print("Main: Before first resume")
-- coroutine.resume(co)
-- print("Main: Before second resume")
-- coroutine.resume(co)
-- print("Main: Before third resume")
-- coroutine.resume(co)
-- print("Main: Done")

--[[
    10.2 Coroutines with Values
]]

-- local co = coroutine.create(function(x)
--     print("Received:", x)
--     local y = coroutine.yield(x + 1)
--     print("Received:", y)
--     return x + y
-- end)
-- 
-- local status, value = coroutine.resume(co, 10)
-- print("Status:", status, "Value:", value)  -- Output: Status: true Value: 11
-- 
-- status, value = coroutine.resume(co, 20)
-- print("Status:", status, "Value:", value)  -- Output: Status: true Value: 30

--[[
    10.3 Iterators with Coroutines
]]

-- function range(start, finish)
--     return coroutine.wrap(function()
--         for i = start, finish do
--             coroutine.yield(i)
--         end
--     end)
-- end
-- 
-- for i in range(1, 5) do
--     print(i)  -- Output: 1 2 3 4 5
-- end

--[[
    10.4 Weak Tables
]]

-- -- Normal table
-- local normalTable = {}
-- local key = {}
-- normalTable[key] = "value"
-- 
-- -- Weak table
-- local weakTable = setmetatable({}, {__mode = "k"})  -- weak keys
-- weakTable[key] = "value"
-- 
-- key = nil  -- Remove reference to key
-- collectgarbage()  -- Force garbage collection
-- 
-- -- Check tables
-- local count = 0
-- for k, v in pairs(normalTable) do count = count + 1 end
-- print("Normal table count:", count)  -- Output: 1
-- 
-- count = 0
-- for k, v in pairs(weakTable) do count = count + 1 end
-- print("Weak table count:", count)    -- Output: 0

-- =====================================================
-- SECTION 11: BEST PRACTICES
-- =====================================================

--[[
    11.1 Local vs Global Variables
]]

-- -- Bad practice: global variables
-- badVariable = "I am global"
-- 
-- -- Good practice: local variables
-- local goodVariable = "I am local"
-- 
-- -- Function to demonstrate scope
-- function testScope()
--     print(badVariable)   -- Can access global
--     print(goodVariable)  -- Can access outer local
--     
--     local localVar = "Inner local"
--     print(localVar)
-- end
-- 
-- testScope()
-- -- print(localVar)  -- Error: localVar is not accessible here

--[[
    11.2 Performance Tips
]]

-- -- Avoid creating tables in loops
-- local results = {}
-- 
-- -- Bad
-- for i = 1, 1000 do
--     results[i] = {value = i}  -- Creates 1000 tables
-- end
-- 
-- -- Good
-- local function createValue(i)
--     return {value = i}
-- end
-- 
-- for i = 1, 1000 do
--     results[i] = createValue(i)
-- end
-- 
-- -- String concatenation
-- local parts = {"a", "b", "c", "d", "e"}
-- 
-- -- Bad for many concatenations
-- local result = ""
-- for i = 1, #parts do
--     result = result .. parts[i]
-- end
-- 
-- -- Better for many concatenations
-- local result = table.concat(parts)

--[[
    11.3 Error Handling Patterns
]]

-- -- Function with proper error handling
-- function safeOperation(param)
--     -- Validate parameters
--     if type(param) ~= "number" then
--         return nil, "Parameter must be a number"
--     end
--     
--     -- Perform operation that might fail
--     local success, result = pcall(function()
--         return math.sqrt(param)
--     end)
--     
--     if not success then
--         return nil, "Operation failed: " .. result
--     end
--     
--     return result
-- end
-- 
-- -- Usage
-- local result, err = safeOperation(16)
-- if err then
--     print("Error:", err)
-- else
--     print("Result:", result)  -- Output: Result: 4
-- end
-- 
-- result, err = safeOperation("not a number")
-- if err then
--     print("Error:", err)  -- Output: Error: Parameter must be a number
-- else
--     print("Result:", result)
-- end

--[[
    11.4 Code Organization
]]

-- -- Module pattern
-- local MyModule = {}
-- 
-- -- Constants
-- MyModule.MAX_VALUE = 100
-- MyModule.MIN_VALUE = 0
-- 
-- -- Private functions (local to this file)
-- local function validateValue(value)
--     return value >= MyModule.MIN_VALUE and value <= MyModule.MAX_VALUE
-- end
-- 
-- -- Public API
-- function MyModule.process(value)
--     if not validateValue(value) then
--         return nil, "Value out of range"
--     end
--     
--     return value * 2
-- end
-- 
-- -- Return the module
-- return MyModule

print("Uncomment sections to run examples!") 