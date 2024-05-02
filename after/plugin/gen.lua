-- TEST prompts
-- give me a golang function that takes a string as input and removes all multiple spaces to one space character
-- give me a golang function that takes a string as input and detects multiple spaces using regex and removes spaces with one space character

vim.keymap.set({ 'n' }, '<leader>]', ':Gen<CR>')
vim.keymap.set({ 'v' }, '<leader>]', ':Gen<CR>')
-- vim.keymap.set('v', '<leader>]', ':Gen Enhance_Grammar_Spelling<CR>')

require('gen').setup({
    -- "David-Kunz/gen.nvim",
        model = "dolphin-llama3",
        -- model = "mistral", -- The default model to use.
        host = "localhost", -- The host running the Ollama service.
        port = "11434", -- The port on which the Ollama service is listening.
        quit_map = "q", -- set keymap for close the response window
        retry_map = "<c-r>", -- set keymap to re-send the current prompt
        init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
        -- Function to initialize Ollama
        command = function(options)
            local body = {model = options.model, stream = true}
            return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/api/chat -d $body"
        end,
        -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
        -- This can also be a command string.
        -- The executed command must return a JSON object with { response, context }
        -- (context property is optional).
        -- list_models = '<omitted lua function>', -- Retrieves a list of model names
        display_mode = "float", -- The display mode. Can be "float" or "split".
        show_prompt = false, -- Shows the prompt submitted to Ollama.
        show_model = false, -- Displays which model you are using at the beginning of your chat session.
        no_auto_close = false, -- Never closes the window automatically.
        debug = false -- Prints errors and the command which is run.
})
-- require('gen').setup({
--         -- model = "mixtral", -- The default model to use.
--         -- model = "mistral", -- The default model to use.
--         model = "dolphin-llama3",
--         -- model = "starcoder2:15b",
--         -- model = "dolphin-mixtral", -- The default model to use.
--         host = "localhost", -- The host running the Ollama service.
--         port = "11434", -- The port on which the Ollama service is listening.
--         display_mode = "split", -- The display mode. Can be "float" or "split".
--         show_prompt = true, -- Shows the Prompt submitted to Ollama.
--         show_model = true, -- Displays which model you are using at the beginning of your chat session.
--         no_auto_close = false, -- Never closes the window automatically.
--         init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
--         -- Function to initialize Ollama
--         command = function(options)
--             return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/api/generate -d $body"
--         end,
--         -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
--         -- This can also be a command string.
--         -- The executed command must return a JSON object with { response, context }
--         -- (context property is optional).
--         -- list_models = '<omitted lua function>', -- Retrieves a list of model names
--         debug = false -- Prints errors and the command which is run.
-- })


-- require('gen').prompts['Elaborate_Text'] = {
--   prompt = "Elaborate the following text:\n$text",
--   replace = false
-- }
-- require('gen').prompts['Fix_Code'] = {
--   prompt = "Fix the following code. Only ouput the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
--   replace = true,
--   extract = "```$filetype\n(.-)```"
-- }
    -- n.option("ask regarding the following text/code", { id = "ask" }),
    -- n.separator("󰦨 text "),
    -- n.option("modify the following text to improve grammar and spelling", { id = "enhance-grammar" }),
    -- n.option("modify the following text to use better wording", { id = "enhance-wording" }),
    -- n.option("modify the following text to make it as simple and concise as possible", { id = "make-concise" }),
    -- n.separator("󰅪 code "),
    -- n.option("generate a simple and concise description of the following code", { id = "generate-simple-description" }),
    -- n.option("generate a detailed description of the following code", { id = "generate-detailed-description" }),
    -- n.option("use better names for all provided variables and functions", { id = "suggest-better-naming" }),
    -- n.option("review the following code and make concise suggestions", { id = "review-code" }),
    -- n.option("simplify the following code", { id = "simplify-code" }),
    -- n.option("improve the following code", { id = "improve-code" }),

require("telescope").load_extension("ui-select")

-- somme text that haz errorss

