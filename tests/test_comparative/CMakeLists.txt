project(test_comparative LANGUAGES CXX)

set(SOURCES
    main.cpp
    ../other_parsers/tinyxml/tinystr.cpp
    ../other_parsers/tinyxml/tinyxml.cpp
    ../other_parsers/tinyxml/tinyxmlerror.cpp
    ../other_parsers/tinyxml/tinyxmlparser.cpp
    )

add_executable(test_comparative ${SOURCES})

add_test(test_comparative test_comparative)
