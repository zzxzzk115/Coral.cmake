-- target defination, name: Testing.Native
target("TestingNative")
    -- set target kind: executable
    set_kind("binary")

    -- add deps
    add_deps("CoralNative")

    -- add source files
    add_files("Source/Main.cpp")

    if is_mode("debug") then 
        add_defines("CORAL_EXAMPLE_DEBUG")
    else
        add_defines("CORAL_EXAMPLE_RELEASE")
    end
    
    -- set target directory
    set_targetdir("$(buildir)/$(plat)/$(arch)/$(mode)/TestingNative")

    after_build(function(target)
        os.cp("$(projectdir)/Prebuilt/$(mode)/Coral**", target:targetdir())
        os.cp("$(projectdir)/Prebuilt/$(mode)/Testing**", target:targetdir())
    end)