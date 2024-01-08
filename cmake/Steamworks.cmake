include(FetchContent)

if (DEFINED ENV{STEAMWORKS_SDK_URL})
	set (STEAMWORKS_SDK_URL "$ENV{STEAMWORKS_SDK_URL}")
endif()

if (NOT DEFINED STEAMWORKS_SDK_URL)
	set(STEAMWORKS_SDK_URL "https://partner.steamgames.com/downloads/steamworks_sdk_158a.zip")
endif()

FetchContent_Declare(
	Steamworks
	URL "${STEAMWORKS_SDK_URL}"
    DOWNLOAD_EXTRACT_TIMESTAMP true
)

FetchContent_GetProperties(Steamworks)
if (NOT Steamworks_POPULATED)
	FetchContent_Populate(Steamworks)
endif()

set(Steamworks_INCLUDE_DIR "${steamworks_SOURCE_DIR}/public/steam")
set(Steamworks_REDISTRIBUTABLE "${steamworks_SOURCE_DIR}/redistributable_bin/win64/steam_api64.dll")
set(Steamworks_REDISTRIBUTABLE_DIR "${steamworks_SOURCE_DIR}/redistributable_bin/win64")
set(Steamworks_IMPLIB "${steamworks_SOURCE_DIR}/redistributable_bin/win64/steam_api64.lib")

add_library(Steamworks SHARED IMPORTED)
set_target_properties(Steamworks PROPERTIES IMPORTED_LOCATION "${Steamworks_REDISTRIBUTABLE}")
set_target_properties(Steamworks PROPERTIES IMPORTED_IMPLIB "${Steamworks_IMPLIB}")
target_include_directories(Steamworks INTERFACE "${Steamworks_INCLUDE_DIR}")