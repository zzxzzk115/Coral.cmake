-- target defination, name: Coral
target("CoralNative")
    -- set target kind: static library
    set_kind("static")

    -- add include files
    add_includedirs("Include", { public = true })
    add_includedirs("Include/Coral")
    add_includedirs("$(projectdir)/NetCore", { public = true })
    add_headerfiles("Include/(Coral/**.hpp)")

    -- PCH
    set_pcxxheader("Include/CoralPCH.hpp")

    -- add source files
    add_files("Source/**.cpp")

    -- platform specification
    if is_plat("windows") then
        add_links("Shell32", "Ole32")
        add_defines("CORAL_WINDOWS")
    elseif is_plat("linux") then
        add_defines("CORAL_LINUX")
    elseif is_plat("macosx") then
        add_defines("CORAL_MACOSX")
    end

    -- set target directory
    set_targetdir("$(buildir)/$(plat)/$(arch)/$(mode)/CoralNative")

    -- set install files
    add_installfiles("$(projectdir)/Prebuilt/$(plat)/$(arch)/Coral**", {prefixdir = "bin"})
    add_installfiles("$(projectdir)/Coral.Managed/Coral.Managed.runtimeconfig.json", {prefixdir = "bin"})