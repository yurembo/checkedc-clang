set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-error -Wno-unused-parameter")
get_property(dialect_libs GLOBAL PROPERTY MLIR_DIALECT_LIBS)

add_flang_library(FortranLower
  CharacterExpr.cpp
  CharacterRuntime.cpp
  Coarray.cpp
  ComplexExpr.cpp
  ConvertType.cpp
  DoLoopHelper.cpp
  FIRBuilder.cpp
  IntrinsicCall.cpp
  IO.cpp
  Mangler.cpp
  OpenMP.cpp
  PFTBuilder.cpp

  DEPENDS
  FIROptimizer
  ${dialect_libs}

  LINK_LIBS
  FIROptimizer
  ${dialect_libs}
  FortranCommon
  FortranParser
  FortranEvaluate
  FortranSemantics
  MLIRAffineToStandard
  MLIRLLVMIR
  MLIRSCFToStandard
  MLIRStandardOps

  LINK_COMPONENTS
  Support
)
