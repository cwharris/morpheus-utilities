include_guard(GLOBAL)

function(morpheus_utils_configure_gtest)
  list(APPEND CMAKE_MESSAGE_CONTEXT "gtest")

  include(${rapids-cmake-dir}/cpm/gtest.cmake)

  rapids_cpm_gtest(
    BUILD_EXPORT_SET
      ${PROJECT_NAME}-core-exports
    INSTALL_EXPORT_SET
      ${PROJECT_NAME}-core-exports
  )

  if(GTest_ADDED)
    rapids_export(
      BUILD GTest
      VERSION ${GTest_VERSION}
      EXPORT_SET GTestTargets
      GLOBAL_TARGETS gtest gmock gtest_main gmock_main
      NAMESPACE GTest::
    )

    include("${rapids-cmake-dir}/export/find_package_root.cmake")
    rapids_export_find_package_root(
      BUILD GTest [=[${CMAKE_CURRENT_LIST_DIR}]=] cudf-testing-exports
    )
  endif()

#   morpheus_utils_assert_cpm_initialized()
#   set(GTEST_VERSION "1.10.0" CACHE STRING "Version of gtest to use")

#   # Try to find UCX and download from source if not found
#   rapids_cpm_find(gtest ${GTEST_VERSION}
#     GLOBAL_TARGETS
#       GTest::gtest
#       GTest::gmock
#       GTest::gtest_main
#       GTest::gmock_main
#     BUILD_EXPORT_SET
#       ${PROJECT_NAME}-core-exports
#     INSTALL_EXPORT_SET
#       ${PROJECT_NAME}-core-exports
#     CPM_ARGS
#       GIT_REPOSITORY          https://github.com/google/googletest.git
#       GIT_TAG                 release-${GTEST_VERSION}
#       GIT_SHALLOW             TRUE
#   )

  list(POP_BACK CMAKE_MESSAGE_CONTEXT)
endfunction()
