add_executable(TestingNative)

target_link_libraries(TestingNative PRIVATE CoralNative)

target_sources(TestingNative PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/Source/Main.cpp)

if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    target_compile_definitions(TestingNative PRIVATE CORAL_EXAMPLE_DEBUG)
else()
    target_compile_definitions(TestingNative PRIVATE CORAL_EXAMPLE_RELEASE)
endif()

set_target_properties(TestingNative PROPERTIES
        RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${CMAKE_SYSTEM_NAME}/${CMAKE_SYSTEM_PROCESSOR}/$<CONFIG>/TestingNative
)

add_custom_command(TARGET TestingNative POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_directory
        ${CMAKE_SOURCE_DIR}/Prebuilt/${CMAKE_SYSTEM_NAME}/${CMAKE_SYSTEM_PROCESSOR}
        $<TARGET_FILE_DIR:TestingNative>
        COMMAND ${CMAKE_COMMAND} -E copy
        ${CMAKE_SOURCE_DIR}/Coral.Managed/Coral.Managed.runtimeconfig.json
        $<TARGET_FILE_DIR:TestingNative>
)