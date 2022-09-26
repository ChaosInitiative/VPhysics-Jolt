# vphysics_jolt.cmake

set(VPHYSICSJOLT_ROOT "${CMAKE_CURRENT_LIST_DIR}")
set(VPHYSICSJOLT_DIR "${VPHYSICSJOLT_ROOT}/vphysics_jolt")

set(
	VPHYSICSJOLT_SOURCE_FILES

	"${SRCDIR}/public/collisionutils.cpp"
	"${SRCDIR}/public/filesystem_helpers.cpp"

	"${VPHYSICSJOLT_DIR}/vjolt_collide.cpp"
	"${VPHYSICSJOLT_DIR}/vjolt_collide_trace.cpp"
	"${VPHYSICSJOLT_DIR}/vjolt_constraints.cpp"
	"${VPHYSICSJOLT_DIR}/vjolt_controller_fluid.cpp"
	"${VPHYSICSJOLT_DIR}/vjolt_controller_motion.cpp"
	"${VPHYSICSJOLT_DIR}/vjolt_controller_player.cpp"
	"${VPHYSICSJOLT_DIR}/vjolt_controller_vehicle.cpp"
	"${VPHYSICSJOLT_DIR}/vjolt_controller_shadow.cpp"
	"${VPHYSICSJOLT_DIR}/vjolt_debugrender.cpp"
	"${VPHYSICSJOLT_DIR}/vjolt_environment.cpp"
	"${VPHYSICSJOLT_DIR}/vjolt_friction.cpp"
	"${VPHYSICSJOLT_DIR}/vjolt_interface.cpp"
	"${VPHYSICSJOLT_DIR}/vjolt_keyvalues_schema.cpp"
	"${VPHYSICSJOLT_DIR}/vjolt_object.cpp"
	"${VPHYSICSJOLT_DIR}/vjolt_objectpairhash.cpp"
	"${VPHYSICSJOLT_DIR}/vjolt_parse.cpp"
	"${VPHYSICSJOLT_DIR}/vjolt_querymodel.cpp"
	"${VPHYSICSJOLT_DIR}/vjolt_surfaceprops.cpp"
)

add_library(vphysics_jolt MODULE ${VPHYSICSJOLT_SOURCE_FILES})
set_property(TARGET vphysics_jolt PROPERTY FOLDER "${SLN_FOLDER_PREFIX}Engine")

target_compile_definitions(
	vphysics_jolt PRIVATE
	STUDIORENDER_EXPORTS
	PROTECTED_THINGS_ENABLE
)

target_link_libraries(
	vphysics_jolt PRIVATE
	mathlib
	tier2
	Jolt
)

target_precompile_headers(
	vphysics_jolt PRIVATE
	"${VPHYSICSJOLT_ROOT}/joltphysics/src/Jolt/Jolt.h"
	"${VPHYSICSJOLT_DIR}/cbase.h"
)