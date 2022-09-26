# jolt.cmake -- Wrapper for Jolt.cmake in the jolt source code, so we don't need to use the jolt CMakeLists.txt

set(PHYSICS_REPO_ROOT "${CMAKE_CURRENT_LIST_DIR}/joltphysics/src")

include("${SRCDIR}/vphysics_jolt/joltphysics/src/Jolt/Jolt.cmake")

# Common defs
target_compile_definitions(
	Jolt PUBLIC
	
	JPH_DISABLE_CUSTOM_ALLOCATOR=1
	JPH_DEBUG_RENDERER=1
	$<$<CONFIG:Debug>:JPH_ENABLE_ASSERTS>
)

# Arch-related things

if (USE_AVX)
	target_compile_definitions(
		Jolt PUBLIC
		JPH_USE_AVX=1
	)
endif()

if (USE_AVX2)
	target_compile_definitions(
		Jolt PUBLIC
		JPH_USE_AVX2=1
	)
endif()

if (USE_SSE41)
	target_compile_definitions(
		Jolt PUBLIC
		JPH_USE_SSE4_1=1
	)
endif()

if (USE_SSE42)
	target_compile_definitions(
		Jolt PUBLIC
		JPH_USE_SSE4_2=1
	)
endif()

if (USE_F16C)
	target_compile_definitions(
		Jolt PUBLIC
		JPH_USE_F16C=1
	)
endif()

if (USE_FMADD)
	target_compile_definitions(
		Jolt PUBLIC
		JPH_USE_FMADD=1
	)
endif()

set_property(TARGET Jolt PROPERTY FOLDER "${SLN_FOLDER_PREFIX}Libs")
