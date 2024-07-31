cmake_minimum_required(VERSION 3.16)

project(DeepCameraApp VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()
set(CMAKE_AUTORCC ON)

qt_add_executable(DeepCameraApp
    resources.qrc
    main.cpp
)

qt_add_qml_module(DeepCameraApp
    URI DeepCameraApp
    VERSION 1.0
    QML_FILES Main.qml
    QML_FILES Buttons.qml
    QML_FILES Emotion.qml
    RESOURCES
    RESOURCES
    RESOURCES resources.qrc
    QML_FILES EmotionNewWindow.qml
    QML_FILES
    QML_FILES
    QML_FILES SourceWindow.qml
    QML_FILES Stack.qml
    QML_FILES MyLabel.qml
    QML_FILES Switcher.qml
    QML_FILES SettingsPage.qml
    QML_FILES
    QML_FILES FullScreenNewWindow.qml
    QML_FILES AIWindow.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(DeepCameraApp PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.DeepCameraApp
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(DeepCameraApp
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS DeepCameraApp
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
