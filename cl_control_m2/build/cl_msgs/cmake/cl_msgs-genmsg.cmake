# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "cl_msgs: 7 messages, 0 services")

set(MSG_I_FLAGS "-Icl_msgs:/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/melodic/share/sensor_msgs/cmake/../msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(cl_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control3.msg" NAME_WE)
add_custom_target(_cl_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cl_msgs" "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control3.msg" ""
)

get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_1.msg" NAME_WE)
add_custom_target(_cl_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cl_msgs" "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_1.msg" ""
)

get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/robot_state.msg" NAME_WE)
add_custom_target(_cl_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cl_msgs" "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/robot_state.msg" ""
)

get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_2.msg" NAME_WE)
add_custom_target(_cl_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cl_msgs" "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_2.msg" ""
)

get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control2.msg" NAME_WE)
add_custom_target(_cl_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cl_msgs" "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control2.msg" ""
)

get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control1.msg" NAME_WE)
add_custom_target(_cl_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cl_msgs" "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control1.msg" ""
)

get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_3.msg" NAME_WE)
add_custom_target(_cl_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cl_msgs" "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_3.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(cl_msgs
  "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control3.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cl_msgs
)
_generate_msg_cpp(cl_msgs
  "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_1.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cl_msgs
)
_generate_msg_cpp(cl_msgs
  "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/robot_state.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cl_msgs
)
_generate_msg_cpp(cl_msgs
  "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_2.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cl_msgs
)
_generate_msg_cpp(cl_msgs
  "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control2.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cl_msgs
)
_generate_msg_cpp(cl_msgs
  "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control1.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cl_msgs
)
_generate_msg_cpp(cl_msgs
  "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_3.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cl_msgs
)

### Generating Services

### Generating Module File
_generate_module_cpp(cl_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cl_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(cl_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(cl_msgs_generate_messages cl_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control3.msg" NAME_WE)
add_dependencies(cl_msgs_generate_messages_cpp _cl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_1.msg" NAME_WE)
add_dependencies(cl_msgs_generate_messages_cpp _cl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/robot_state.msg" NAME_WE)
add_dependencies(cl_msgs_generate_messages_cpp _cl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_2.msg" NAME_WE)
add_dependencies(cl_msgs_generate_messages_cpp _cl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control2.msg" NAME_WE)
add_dependencies(cl_msgs_generate_messages_cpp _cl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control1.msg" NAME_WE)
add_dependencies(cl_msgs_generate_messages_cpp _cl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_3.msg" NAME_WE)
add_dependencies(cl_msgs_generate_messages_cpp _cl_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cl_msgs_gencpp)
add_dependencies(cl_msgs_gencpp cl_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cl_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(cl_msgs
  "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control3.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cl_msgs
)
_generate_msg_eus(cl_msgs
  "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_1.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cl_msgs
)
_generate_msg_eus(cl_msgs
  "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/robot_state.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cl_msgs
)
_generate_msg_eus(cl_msgs
  "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_2.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cl_msgs
)
_generate_msg_eus(cl_msgs
  "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control2.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cl_msgs
)
_generate_msg_eus(cl_msgs
  "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control1.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cl_msgs
)
_generate_msg_eus(cl_msgs
  "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_3.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cl_msgs
)

### Generating Services

### Generating Module File
_generate_module_eus(cl_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cl_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(cl_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(cl_msgs_generate_messages cl_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control3.msg" NAME_WE)
add_dependencies(cl_msgs_generate_messages_eus _cl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_1.msg" NAME_WE)
add_dependencies(cl_msgs_generate_messages_eus _cl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/robot_state.msg" NAME_WE)
add_dependencies(cl_msgs_generate_messages_eus _cl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_2.msg" NAME_WE)
add_dependencies(cl_msgs_generate_messages_eus _cl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control2.msg" NAME_WE)
add_dependencies(cl_msgs_generate_messages_eus _cl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control1.msg" NAME_WE)
add_dependencies(cl_msgs_generate_messages_eus _cl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_3.msg" NAME_WE)
add_dependencies(cl_msgs_generate_messages_eus _cl_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cl_msgs_geneus)
add_dependencies(cl_msgs_geneus cl_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cl_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(cl_msgs
  "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control3.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cl_msgs
)
_generate_msg_lisp(cl_msgs
  "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_1.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cl_msgs
)
_generate_msg_lisp(cl_msgs
  "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/robot_state.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cl_msgs
)
_generate_msg_lisp(cl_msgs
  "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_2.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cl_msgs
)
_generate_msg_lisp(cl_msgs
  "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control2.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cl_msgs
)
_generate_msg_lisp(cl_msgs
  "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control1.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cl_msgs
)
_generate_msg_lisp(cl_msgs
  "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_3.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cl_msgs
)

### Generating Services

### Generating Module File
_generate_module_lisp(cl_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cl_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(cl_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(cl_msgs_generate_messages cl_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control3.msg" NAME_WE)
add_dependencies(cl_msgs_generate_messages_lisp _cl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_1.msg" NAME_WE)
add_dependencies(cl_msgs_generate_messages_lisp _cl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/robot_state.msg" NAME_WE)
add_dependencies(cl_msgs_generate_messages_lisp _cl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_2.msg" NAME_WE)
add_dependencies(cl_msgs_generate_messages_lisp _cl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control2.msg" NAME_WE)
add_dependencies(cl_msgs_generate_messages_lisp _cl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control1.msg" NAME_WE)
add_dependencies(cl_msgs_generate_messages_lisp _cl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_3.msg" NAME_WE)
add_dependencies(cl_msgs_generate_messages_lisp _cl_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cl_msgs_genlisp)
add_dependencies(cl_msgs_genlisp cl_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cl_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(cl_msgs
  "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control3.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cl_msgs
)
_generate_msg_nodejs(cl_msgs
  "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_1.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cl_msgs
)
_generate_msg_nodejs(cl_msgs
  "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/robot_state.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cl_msgs
)
_generate_msg_nodejs(cl_msgs
  "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_2.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cl_msgs
)
_generate_msg_nodejs(cl_msgs
  "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control2.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cl_msgs
)
_generate_msg_nodejs(cl_msgs
  "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control1.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cl_msgs
)
_generate_msg_nodejs(cl_msgs
  "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_3.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cl_msgs
)

### Generating Services

### Generating Module File
_generate_module_nodejs(cl_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cl_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(cl_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(cl_msgs_generate_messages cl_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control3.msg" NAME_WE)
add_dependencies(cl_msgs_generate_messages_nodejs _cl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_1.msg" NAME_WE)
add_dependencies(cl_msgs_generate_messages_nodejs _cl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/robot_state.msg" NAME_WE)
add_dependencies(cl_msgs_generate_messages_nodejs _cl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_2.msg" NAME_WE)
add_dependencies(cl_msgs_generate_messages_nodejs _cl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control2.msg" NAME_WE)
add_dependencies(cl_msgs_generate_messages_nodejs _cl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control1.msg" NAME_WE)
add_dependencies(cl_msgs_generate_messages_nodejs _cl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_3.msg" NAME_WE)
add_dependencies(cl_msgs_generate_messages_nodejs _cl_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cl_msgs_gennodejs)
add_dependencies(cl_msgs_gennodejs cl_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cl_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(cl_msgs
  "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control3.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cl_msgs
)
_generate_msg_py(cl_msgs
  "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_1.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cl_msgs
)
_generate_msg_py(cl_msgs
  "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/robot_state.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cl_msgs
)
_generate_msg_py(cl_msgs
  "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_2.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cl_msgs
)
_generate_msg_py(cl_msgs
  "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control2.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cl_msgs
)
_generate_msg_py(cl_msgs
  "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control1.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cl_msgs
)
_generate_msg_py(cl_msgs
  "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_3.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cl_msgs
)

### Generating Services

### Generating Module File
_generate_module_py(cl_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cl_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(cl_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(cl_msgs_generate_messages cl_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control3.msg" NAME_WE)
add_dependencies(cl_msgs_generate_messages_py _cl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_1.msg" NAME_WE)
add_dependencies(cl_msgs_generate_messages_py _cl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/robot_state.msg" NAME_WE)
add_dependencies(cl_msgs_generate_messages_py _cl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_2.msg" NAME_WE)
add_dependencies(cl_msgs_generate_messages_py _cl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control2.msg" NAME_WE)
add_dependencies(cl_msgs_generate_messages_py _cl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/control1.msg" NAME_WE)
add_dependencies(cl_msgs_generate_messages_py _cl_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/liang/cl_rootws/cl_control_m2/src/cl_msgs/msg/VCU_info_3.msg" NAME_WE)
add_dependencies(cl_msgs_generate_messages_py _cl_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cl_msgs_genpy)
add_dependencies(cl_msgs_genpy cl_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cl_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cl_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cl_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(cl_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(cl_msgs_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(cl_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cl_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cl_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(cl_msgs_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(cl_msgs_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(cl_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cl_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cl_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(cl_msgs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(cl_msgs_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(cl_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cl_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cl_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(cl_msgs_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(cl_msgs_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(cl_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cl_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cl_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cl_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(cl_msgs_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(cl_msgs_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(cl_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
