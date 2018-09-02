project(test_speed LANGUAGES CXX)

set(SOURCES
    main.cpp
    ../other_parsers/pugixml/pugixml.cpp
    ../other_parsers/tinyxml/tinystr.cpp
    ../other_parsers/tinyxml/tinyxml.cpp
    ../other_parsers/tinyxml/tinyxmlerror.cpp
    ../other_parsers/tinyxml/tinyxmlparser.cpp
    )
add_executable(test_speed ${SOURCES})

add_test(NAME test_speed
    COMMAND test_speed
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
