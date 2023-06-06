include_guard(GLOBAL)

function(morphues_utils_configure_nlohmann_json)
  list(APPEND CMAKE_MESSAGE_CONTEXT "nlohmann_json")

  morpheus_utils_assert_cpm_initialized()
  set(NLOHMANN_JSON_VERSION "3.9.0" CACHE STRING "Version of nlohmann_json to use")

  # Try to find UCX and download from source if not found
  rapids_cpm_find(nlohmann_json ${NLOHMANN_JSON_VERSION}
    GLOBAL_TARGETS
      nlohmann_json::nlohmann_json
    BUILD_EXPORT_SET
      ${PROJECT_NAME}-core-exports
    INSTALL_EXPORT_SET
      ${PROJECT_NAME}-core-exports
    CPM_ARGS
      GIT_REPOSITORY          https://github.com/nlohmann/json.git
      GIT_TAG                 v${NLOHMANN_JSON_VERSION}
      GIT_SHALLOW             TRUE
      OPTIONS                 "JSON_Install ON"
  )

  list(POP_BACK CMAKE_MESSAGE_CONTEXT)
endfunction()
