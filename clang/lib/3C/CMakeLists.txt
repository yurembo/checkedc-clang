set( LLVM_LINK_COMPONENTS
        ${LLVM_TARGETS_TO_BUILD}
        Option
        Support
        )
        if (FIVE_C)
          add_compile_definitions(FIVE_C)
          set(five_c_source
            DeclRewriter_5C.cpp
          )
        endif()

        if (MSVC)
          set_source_files_properties(ArrayBoundsInferenceConsumer.cpp PROPERTIES COMPILE_FLAGS /bigobj)
          set_source_files_properties(ConstraintBuilder.cpp PROPERTIES COMPILE_FLAGS /bigobj)
          set_source_files_properties(DeclRewriter.cpp PROPERTIES COMPILE_FLAGS /bigobj)
          set_source_files_properties(RewriteUtils.cpp PROPERTIES COMPILE_FLAGS /bigobj)
        endif()

        add_clang_library(clang3C
          ABounds.cpp
          AVarBoundsInfo.cpp
          AVarGraph.cpp
          ArrayBoundsInferenceConsumer.cpp
          CastPlacement.cpp
          3C.cpp
          3CInteractiveData.cpp
          CheckedRegions.cpp
          ConstraintBuilder.cpp
          ConstraintResolver.cpp
          Constraints.cpp
          ConstraintsGraph.cpp
          ConstraintVariables.cpp
          DeclRewriter.cpp
          IntermediateToolHook.cpp
          MappingVisitor.cpp
          PersistentSourceLoc.cpp
          ProgramInfo.cpp
          ProgramVar.cpp
          RewriteUtils.cpp
          StructInit.cpp
          TypeVariableAnalysis.cpp
          Utils.cpp
          ${five_c_source}
          LINK_LIBS
          clangAST
          clangAnalysis
          clangBasic
          clangDriver
          clangFrontend
          clangRewriteFrontend
          clangStaticAnalyzerFrontend
          clangTooling
          clangTransformer
        )
	target_include_directories(obj.clang3C PUBLIC)
