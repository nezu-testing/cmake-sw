
add_executable(test1 main.cpp)

target_link_libraries(test1 PRIVATE Steamworks)
target_compile_features(test1 PUBLIC c_std_17 cxx_std_20)

# create steam_appid.txt in the same directory as the executable
add_custom_command(TARGET test1 POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
        "${CMAKE_SOURCE_DIR}/steam_appid.txt"
        "${Steamworks_REDISTRIBUTABLE}"
        $<TARGET_FILE_DIR:test1>)