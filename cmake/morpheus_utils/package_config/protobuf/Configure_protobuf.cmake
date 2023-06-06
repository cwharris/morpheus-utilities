include_guard(GLOBAL)

function(morpheus_utils_configure_protobuf)
  list(APPEND CMAKE_MESSAGE_CONTEXT "protobuf")

  morpheus_utils_assert_cpm_initialized()
  set(PROTOBUF_VERSION "3.21.0" CACHE STRING "Version of protobuf to use")

  # Try to find Protobuf and download from source if not found
  rapids_cpm_find(protobuf ${PROTOBUF_VERSION}
    GLOBAL_TARGETS
      protobuf
      protobuf::libprotobuf
      protobuf::libprotoc
    BUILD_EXPORT_SET
      ${PROJECT_NAME}-core-exports
    INSTALL_EXPORT_SET
      ${PROJECT_NAME}-core-exports
    CPM_ARGS
      GIT_REPOSITORY          https://github.com/protocolbuffers/protobuf
      GIT_TAG                 v${PROTOBUF_VERSION}
      GIT_SHALLOW             TRUE
      OPTIONS                 "protobuf_BUILD_TESTS OFF"
                              "protobuf_BUILD_LIBPROTOC ON"
  )

  list(POP_BACK CMAKE_MESSAGE_CONTEXT)
endfunction()
