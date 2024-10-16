#pragma once

#ifdef _WIN32
  #define LIB_DEPENDENCY_EXPORT __declspec(dllexport)
#else
  #define LIB_DEPENDENCY_EXPORT
#endif

LIB_DEPENDENCY_EXPORT void dependency();
