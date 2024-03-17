-- set project name
set_project("SCoral")

-- set project version
set_version("0.1.0")

-- set language version: C++ 20
set_languages("cxx20")

-- global options
option("examples") -- build examples?
    set_default(false)
option_end()

option("tests") -- build tests?
    set_default(false)
option_end()

add_defines("_CRT_SECURE_NO_WARNINGS")

add_rules("mode.debug", "mode.release")
add_rules("plugin.vsxmake.autoupdate")
add_rules("plugin.compile_commands.autoupdate", {outputdir = ".vscode"})

-- add our own xmake-repo here
add_repositories("snow-leopard-engine-xmake-repo https://github.com/SnowLeopardEngine/xmake-repo.git dev")

-- include source
includes("Coral.Native")

-- if build examples, then include examples
if has_config("examples") then
    includes("Example/Example.Native")
end

if has_config("tests") then
    includes("Tests/Testing.Native")
end