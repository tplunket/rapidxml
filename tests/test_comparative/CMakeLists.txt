project(test_comparative LANGUAGES CXX)

set(SOURCES
    main.cpp
    ../other_parsers/tinyxml/tinystr.cpp
    ../other_parsers/tinyxml/tinyxml.cpp
    ../other_parsers/tinyxml/tinyxmlerror.cpp
    ../other_parsers/tinyxml/tinyxmlparser.cpp
    )

add_executable(test_comparative ${SOURCES})

add_test(NAME test_comparative
    COMMAND test_comparative
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
