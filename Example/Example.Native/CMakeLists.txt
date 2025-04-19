add_executable(ExampleNative)

target_link_libraries(ExampleNative PRIVATE CoralNative)

target_sources(ExampleNative PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/Source/Main.cpp)

if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    target_compile_definitions(ExampleNative PRIVATE CORAL_EXAMPLE_DEBUG)
else()
    target_compile_definitions(ExampleNative PRIVATE CORAL_EXAMPLE_RELEASE)
endif()

set_target_properties(ExampleNative PROPERTIES
        RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${CMAKE_SYSTEM_NAME}/${CMAKE_SYSTEM_PROCESSOR}/$<CONFIG>/ExampleNative
)

add_custom_command(TARGET ExampleNative POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_directory
        ${CMAKE_SOURCE_DIR}/Prebuilt/${CMAKE_SYSTEM_NAME}/${CMAKE_SYSTEM_PROCESSOR}/
        $<TARGET_FILE_DIR:ExampleNative>
        COMMAND ${CMAKE_COMMAND} -E copy
        ${CMAKE_SOURCE_DIR}/Coral.Managed/Coral.Managed.runtimeconfig.json
        $<TARGET_FILE_DIR:ExampleNative>
)