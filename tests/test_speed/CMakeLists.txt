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

add_test(test_speed test_speed)
