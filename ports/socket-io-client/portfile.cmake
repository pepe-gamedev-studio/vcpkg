vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO socketio/socket.io-client-cpp
    REF 36a8cd45272aa51f0f6ef27aa4744dbc6e8421f7
    SHA512 d27298b9ab05f961f4b45775b419e37d438de5f0e5441552231bf837cdfe9932a5ddb991bb05d01ba6e983f7d0058c57c3d60e9e62c9361d4cbb4411a90bc9c6
    HEAD_REF master
    PATCHES fix.patch
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)

vcpkg_install_cmake()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

# Handle copyright
configure_file(${SOURCE_PATH}/LICENSE ${CURRENT_PACKAGES_DIR}/share/socket-io-client/copyright COPYONLY)
