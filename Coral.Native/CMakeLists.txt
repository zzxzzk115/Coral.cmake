add_library(CoralNative STATIC)

target_include_directories(CoralNative
        PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/Include
        ${CMAKE_CURRENT_SOURCE_DIR}/Include/Coral
        ${CMAKE_SOURCE_DIR}/NetCore
)

file(GLOB_RECURSE HEADER_FILES ${CMAKE_CURRENT_SOURCE_DIR}/Include/Coral/*.hpp)
target_sources(CoralNative PRIVATE ${HEADER_FILES})

target_precompile_headers(CoralNative PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/Include/CoralPCH.hpp)

file(GLOB_RECURSE SOURCE_FILES ${CMAKE_CURRENT_SOURCE_DIR}/Source/*.cpp)
target_sources(CoralNative PRIVATE ${SOURCE_FILES})

if(WIN32)
    target_link_libraries(CoralNative PRIVATE Shell32 Ole32)
    target_compile_definitions(CoralNative PRIVATE CORAL_WINDOWS)
elseif(UNIX AND NOT APPLE)
    target_compile_definitions(CoralNative PRIVATE CORAL_LINUX)
elseif(APPLE)
    target_compile_definitions(CoralNative PRIVATE CORAL_MACOSX)
endif()

set_target_properties(CoralNative PROPERTIES
        ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${CMAKE_SYSTEM_NAME}/${CMAKE_SYSTEM_PROCESSOR}/$<CONFIG>/CoralNative
)

install(FILES ${CMAKE_SOURCE_DIR}/Prebuilt/${CMAKE_SYSTEM_NAME}/${CMAKE_SYSTEM_PROCESSOR}/Coral
        DESTINATION bin)
install(FILES ${CMAKE_SOURCE_DIR}/Coral.Managed/Coral.Managed.runtimeconfig.json
        DESTINATION bin)