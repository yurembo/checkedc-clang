; RUN: llc < %s | FileCheck %s --check-prefix=ASM
; RUN: llc < %s -filetype=obj | llvm-readobj - --codeview | FileCheck %s --check-prefix=OBJ

; // C++ source to regenerate:
; namespace Test1 {
; const float TestConst1 = 3.14;
; }
; struct S {
;   static const int TestConst2 = -10;
;   enum { SEnum = 42 };
; };
; enum TestEnum : int {
;   ENUM_A = 2147000000,
;   ENUM_B = -2147000000,
; };
; void useConst(int);
; void foo() {
;   useConst(Test1::TestConst1);
;   useConst(S::TestConst2);
;   useConst(ENUM_B);
;   useConst(S::SEnum);
; }
; 
; $ clang a.cpp -S -emit-llvm -g -gcodeview

; ASM-LABEL:  .long 241                     # Symbol subsection for globals

; ASM:	      .short	4359                    # Record kind: S_CONSTANT
; ASM-NEXT:	  .long	4099                    # Type
; ASM-NEXT:	  .byte	0x04, 0x80, 0xc3, 0xf5  # Value
; ASM-NEXT:	  .byte	0x48, 0x40
; ASM-NEXT:	  .asciz	"Test1::TestConst1"     # Name
; ASM-NEXT:	  .p2align	2

; ASM:	      .short	4359                    # Record kind: S_CONSTANT
; ASM-NEXT:	  .long	4101                    # Type
; ASM-NEXT:	  .byte	0x0a, 0x80, 0xf6, 0xff  # Value
; ASM-NEXT:	  .byte	0xff, 0xff, 0xff, 0xff
; ASM-NEXT:	  .byte	0xff, 0xff
; ASM-NEXT:	  .asciz	"S::TestConst2"         # Name
; ASM-NEXT:	  .p2align	2

; ASM:	      .short	4359                    # Record kind: S_CONSTANT
; ASM-NEXT:	  .long	4110                    # Type
; ASM-NEXT:	  .byte	0x0a, 0x80, 0x40, 0x61  # Value
; ASM-NEXT:	  .byte	0x07, 0x80, 0xff, 0xff
; ASM-NEXT:	  .byte	0xff, 0xff
; ASM-NEXT:	  .asciz	"ENUM_B"                # Name
; ASM-NEXT:	  .p2align	2
; ASM-NOT:    .asciz "S::SEnum"             # Name

; OBJ:        CodeViewDebugInfo [
; OBJ:          Section: .debug$S
; OBJ:          Magic: 0x4
; OBJ:          Subsection [
; OBJ:            SubSectionType: Symbols (0xF1)
; OBJ:            ConstantSym {
; OBJ-NEXT:         Kind: S_CONSTANT (0x1107)
; OBJ-NEXT:         Type: const float (0x1003)
; OBJ-NEXT:         Value: 1078523331
; OBJ-NEXT:         Name: Test1::TestConst1
; OBJ-NEXT:       }
; OBJ-NEXT:       ConstantSym {
; OBJ-NEXT:         Kind: S_CONSTANT (0x1107)
; OBJ-NEXT:         Type: const int (0x1005)
; OBJ-NEXT:         Value: 18446744073709551606
; OBJ-NEXT:         Name: S::TestConst2
; OBJ-NEXT:       }
; OBJ-NEXT:       ConstantSym {
; OBJ-NEXT:         Kind: S_CONSTANT (0x1107)
; OBJ-NEXT:         Type: TestEnum (0x100E)
; OBJ-NEXT:         Value: 18446744071562551616
; OBJ-NEXT:         Name: ENUM_B
; OBJ-NEXT:       }
; OBJ-NOT:          Name: S::SEnum

; ModuleID = 'a.cpp'
source_filename = "a.cpp"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.25.28614"

; Function Attrs: noinline optnone uwtable
define dso_local void @"?foo@@YAXXZ"() #0 !dbg !31 {
entry:
  call void @"?useConst@@YAXH@Z"(i32 3), !dbg !35
  call void @"?useConst@@YAXH@Z"(i32 -10), !dbg !36
  call void @"?useConst@@YAXH@Z"(i32 -2147000000), !dbg !37
  call void @"?useConst@@YAXH@Z"(i32 42), !dbg !38
  ret void, !dbg !39
}

declare dso_local void @"?useConst@@YAXH@Z"(i32) #1

attributes #0 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!26, !27, !28, !29}
!llvm.ident = !{!30}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !1, producer: "clang version 11.0.0 (https://github.com/llvm/llvm-project.git 202f144bffd0be254a829924195e1b8ebabcbb79)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !15, globals: !16, nameTableKind: None)
!1 = !DIFile(filename: "a.cpp", directory: "F:\\llvm-project\\__test", checksumkind: CSK_MD5, checksum: "a1dbf3aabea9e8f9d1be48f60287942f")
!2 = !{!3, !11}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, scope: !4, file: !1, line: 6, baseType: !8, size: 32, elements: !9, identifier: ".?AW4<unnamed-enum-SEnum>@S@@")
!4 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "S", file: !1, line: 4, size: 8, flags: DIFlagTypePassByValue, elements: !5, identifier: ".?AUS@@")
!5 = !{!6, !3}
!6 = !DIDerivedType(tag: DW_TAG_member, name: "TestConst2", scope: !4, file: !1, line: 5, baseType: !7, flags: DIFlagStaticMember, extraData: i32 -10)
!7 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !8)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{!10}
!10 = !DIEnumerator(name: "SEnum", value: 42)
!11 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "TestEnum", file: !1, line: 8, baseType: !8, size: 32, elements: !12, identifier: ".?AW4TestEnum@@")
!12 = !{!13, !14}
!13 = !DIEnumerator(name: "ENUM_A", value: 2147000000)
!14 = !DIEnumerator(name: "ENUM_B", value: -2147000000)
!15 = !{!4}
!16 = !{!17, !22, !24}
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression(DW_OP_constu, 1078523331, DW_OP_stack_value))
!18 = distinct !DIGlobalVariable(name: "TestConst1", scope: !19, file: !1, line: 2, type: !20, isLocal: true, isDefinition: true)
!19 = !DINamespace(name: "Test1", scope: null)
!20 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !21)
!21 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression(DW_OP_constu, 18446744073709551606, DW_OP_stack_value))
!23 = distinct !DIGlobalVariable(name: "TestConst2", scope: !0, file: !1, line: 5, type: !7, isLocal: true, isDefinition: true, declaration: !6)
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression(DW_OP_constu, 18446744071562551616, DW_OP_stack_value))
!25 = distinct !DIGlobalVariable(name: "ENUM_B", scope: !0, file: !1, line: 10, type: !11, isLocal: true, isDefinition: true)
!26 = !{i32 2, !"CodeView", i32 1}
!27 = !{i32 2, !"Debug Info Version", i32 3}
!28 = !{i32 1, !"wchar_size", i32 2}
!29 = !{i32 7, !"PIC Level", i32 2}
!30 = !{!"clang version 11.0.0 (https://github.com/llvm/llvm-project.git 202f144bffd0be254a829924195e1b8ebabcbb79)"}
!31 = distinct !DISubprogram(name: "foo", linkageName: "?foo@@YAXXZ", scope: !1, file: !1, line: 13, type: !32, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !34)
!32 = !DISubroutineType(types: !33)
!33 = !{null}
!34 = !{}
!35 = !DILocation(line: 14, scope: !31)
!36 = !DILocation(line: 15, scope: !31)
!37 = !DILocation(line: 16, scope: !31)
!38 = !DILocation(line: 17, scope: !31)
!39 = !DILocation(line: 18, scope: !31)
