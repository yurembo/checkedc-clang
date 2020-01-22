; RUN: llc -mtriple=aarch64-linux-gnu -mattr=+sve < %s | FileCheck %s

;
; LDFF1B
;

define <vscale x 16 x i8> @ldff1b(<vscale x 16 x i1> %pg, i8* %a) {
; CHECK-LABEL: ldff1b:
; CHECK: ldff1b { z0.b }, p0/z, [x0]
; CHECK-NEXT: ret
  %load = call <vscale x 16 x i8> @llvm.aarch64.sve.ldff1.nxv16i8(<vscale x 16 x i1> %pg, i8* %a)
  ret <vscale x 16 x i8> %load
}

define <vscale x 8 x i16> @ldff1b_h(<vscale x 8 x i1> %pg, i8* %a) {
; CHECK-LABEL: ldff1b_h:
; CHECK: ldff1b { z0.h }, p0/z, [x0]
; CHECK-NEXT: ret
  %load = call <vscale x 8 x i8> @llvm.aarch64.sve.ldff1.nxv8i8(<vscale x 8 x i1> %pg, i8* %a)
  %res = zext <vscale x 8 x i8> %load to <vscale x 8 x i16>
  ret <vscale x 8 x i16> %res
}

define <vscale x 4 x i32> @ldff1b_s(<vscale x 4 x i1> %pg, i8* %a) {
; CHECK-LABEL: ldff1b_s:
; CHECK: ldff1b { z0.s }, p0/z, [x0]
; CHECK-NEXT: ret
  %load = call <vscale x 4 x i8> @llvm.aarch64.sve.ldff1.nxv4i8(<vscale x 4 x i1> %pg, i8* %a)
  %res = zext <vscale x 4 x i8> %load to <vscale x 4 x i32>
  ret <vscale x 4 x i32> %res
}

define <vscale x 2 x i64> @ldff1b_d(<vscale x 2 x i1> %pg, i8* %a) {
; CHECK-LABEL: ldff1b_d:
; CHECK: ldff1b { z0.d }, p0/z, [x0]
; CHECK-NEXT: ret
  %load = call <vscale x 2 x i8> @llvm.aarch64.sve.ldff1.nxv2i8(<vscale x 2 x i1> %pg, i8* %a)
  %res = zext <vscale x 2 x i8> %load to <vscale x 2 x i64>
  ret <vscale x 2 x i64> %res
}

;
; LDFF1SB
;

define <vscale x 8 x i16> @ldff1sb_h(<vscale x 8 x i1> %pg, i8* %a) {
; CHECK-LABEL: ldff1sb_h:
; CHECK: ldff1sb { z0.h }, p0/z, [x0]
; CHECK-NEXT: ret
  %load = call <vscale x 8 x i8> @llvm.aarch64.sve.ldff1.nxv8i8(<vscale x 8 x i1> %pg, i8* %a)
  %res = sext <vscale x 8 x i8> %load to <vscale x 8 x i16>
  ret <vscale x 8 x i16> %res
}

define <vscale x 4 x i32> @ldff1sb_s(<vscale x 4 x i1> %pg, i8* %a) {
; CHECK-LABEL: ldff1sb_s:
; CHECK: ldff1sb { z0.s }, p0/z, [x0]
; CHECK-NEXT: ret
  %load = call <vscale x 4 x i8> @llvm.aarch64.sve.ldff1.nxv4i8(<vscale x 4 x i1> %pg, i8* %a)
  %res = sext <vscale x 4 x i8> %load to <vscale x 4 x i32>
  ret <vscale x 4 x i32> %res
}

define <vscale x 2 x i64> @ldff1sb_d(<vscale x 2 x i1> %pg, i8* %a) {
; CHECK-LABEL: ldff1sb_d:
; CHECK: ldff1sb { z0.d }, p0/z, [x0]
; CHECK-NEXT: ret
  %load = call <vscale x 2 x i8> @llvm.aarch64.sve.ldff1.nxv2i8(<vscale x 2 x i1> %pg, i8* %a)
  %res = sext <vscale x 2 x i8> %load to <vscale x 2 x i64>
  ret <vscale x 2 x i64> %res
}

;
; LDFF1H
;

define <vscale x 8 x i16> @ldff1h(<vscale x 8 x i1> %pg, i16* %a) {
; CHECK-LABEL: ldff1h:
; CHECK: ldff1h { z0.h }, p0/z, [x0]
; CHECK-NEXT: ret
  %load = call <vscale x 8 x i16> @llvm.aarch64.sve.ldff1.nxv8i16(<vscale x 8 x i1> %pg, i16* %a)
  ret <vscale x 8 x i16> %load
}

define <vscale x 4 x i32> @ldff1h_s(<vscale x 4 x i1> %pg, i16* %a) {
; CHECK-LABEL: ldff1h_s:
; CHECK: ldff1h { z0.s }, p0/z, [x0]
; CHECK-NEXT: ret
  %load = call <vscale x 4 x i16> @llvm.aarch64.sve.ldff1.nxv4i16(<vscale x 4 x i1> %pg, i16* %a)
  %res = zext <vscale x 4 x i16> %load to <vscale x 4 x i32>
  ret <vscale x 4 x i32> %res
}

define <vscale x 2 x i64> @ldff1h_d(<vscale x 2 x i1> %pg, i16* %a) {
; CHECK-LABEL: ldff1h_d:
; CHECK: ldff1h { z0.d }, p0/z, [x0]
; CHECK-NEXT: ret
  %load = call <vscale x 2 x i16> @llvm.aarch64.sve.ldff1.nxv2i16(<vscale x 2 x i1> %pg, i16* %a)
  %res = zext <vscale x 2 x i16> %load to <vscale x 2 x i64>
  ret <vscale x 2 x i64> %res
}

define <vscale x 8 x half> @ldff1h_f16(<vscale x 8 x i1> %pg, half* %a) {
; CHECK-LABEL: ldff1h_f16:
; CHECK: ldff1h { z0.h }, p0/z, [x0]
; CHECK-NEXT: ret
  %load = call <vscale x 8 x half> @llvm.aarch64.sve.ldff1.nxv8f16(<vscale x 8 x i1> %pg, half* %a)
  ret <vscale x 8 x half> %load
}

;
; LDFF1SH
;

define <vscale x 4 x i32> @ldff1sh_s(<vscale x 4 x i1> %pg, i16* %a) {
; CHECK-LABEL: ldff1sh_s:
; CHECK: ldff1sh { z0.s }, p0/z, [x0]
; CHECK-NEXT: ret
  %load = call <vscale x 4 x i16> @llvm.aarch64.sve.ldff1.nxv4i16(<vscale x 4 x i1> %pg, i16* %a)
  %res = sext <vscale x 4 x i16> %load to <vscale x 4 x i32>
  ret <vscale x 4 x i32> %res
}

define <vscale x 2 x i64> @ldff1sh_d(<vscale x 2 x i1> %pg, i16* %a) {
; CHECK-LABEL: ldff1sh_d:
; CHECK: ldff1sh { z0.d }, p0/z, [x0]
; CHECK-NEXT: ret
  %load = call <vscale x 2 x i16> @llvm.aarch64.sve.ldff1.nxv2i16(<vscale x 2 x i1> %pg, i16* %a)
  %res = sext <vscale x 2 x i16> %load to <vscale x 2 x i64>
  ret <vscale x 2 x i64> %res
}

;
; LDFF1W
;

define <vscale x 4 x i32> @ldff1w(<vscale x 4 x i1> %pg, i32* %a) {
; CHECK-LABEL: ldff1w:
; CHECK: ldff1w { z0.s }, p0/z, [x0]
; CHECK-NEXT: ret
  %load = call <vscale x 4 x i32> @llvm.aarch64.sve.ldff1.nxv4i32(<vscale x 4 x i1> %pg, i32* %a)
  ret <vscale x 4 x i32> %load
}

define <vscale x 2 x i64> @ldff1w_d(<vscale x 2 x i1> %pg, i32* %a) {
; CHECK-LABEL: ldff1w_d:
; CHECK: ldff1w { z0.d }, p0/z, [x0]
; CHECK-NEXT: ret
  %load = call <vscale x 2 x i32> @llvm.aarch64.sve.ldff1.nxv2i32(<vscale x 2 x i1> %pg, i32* %a)
  %res = zext <vscale x 2 x i32> %load to <vscale x 2 x i64>
  ret <vscale x 2 x i64> %res
}

define <vscale x 4 x float> @ldff1w_f32(<vscale x 4 x i1> %pg, float* %a) {
; CHECK-LABEL: ldff1w_f32:
; CHECK: ldff1w { z0.s }, p0/z, [x0]
; CHECK-NEXT: ret
  %load = call <vscale x 4 x float> @llvm.aarch64.sve.ldff1.nxv4f32(<vscale x 4 x i1> %pg, float* %a)
  ret <vscale x 4 x float> %load
}

define <vscale x 2 x float> @ldff1w_2f32(<vscale x 2 x i1> %pg, float* %a) {
; CHECK-LABEL: ldff1w_2f32:
; CHECK: ldff1w { z0.d }, p0/z, [x0]
; CHECK-NEXT: ret
  %load = call <vscale x 2 x float> @llvm.aarch64.sve.ldff1.nxv2f32(<vscale x 2 x i1> %pg, float* %a)
  ret <vscale x 2 x float> %load
}

;
; LDFF1SW
;

define <vscale x 2 x i64> @ldff1sw_d(<vscale x 2 x i1> %pg, i32* %a) {
; CHECK-LABEL: ldff1sw_d:
; CHECK: ldff1sw { z0.d }, p0/z, [x0]
; CHECK-NEXT: ret
  %load = call <vscale x 2 x i32> @llvm.aarch64.sve.ldff1.nxv2i32(<vscale x 2 x i1> %pg, i32* %a)
  %res = sext <vscale x 2 x i32> %load to <vscale x 2 x i64>
  ret <vscale x 2 x i64> %res
}

;
; LDFF1D
;

define <vscale x 2 x i64> @ldff1d(<vscale x 2 x i1> %pg, i64* %a) {
; CHECK-LABEL: ldff1d:
; CHECK: ldff1d { z0.d }, p0/z, [x0]
; CHECK-NEXT: ret
  %load = call <vscale x 2 x i64> @llvm.aarch64.sve.ldff1.nxv2i64(<vscale x 2 x i1> %pg, i64* %a)
  ret <vscale x 2 x i64> %load
}


define <vscale x 2 x double> @ldff1d_f64(<vscale x 2 x i1> %pg, double* %a) {
; CHECK-LABEL: ldff1d_f64:
; CHECK: ldff1d { z0.d }, p0/z, [x0]
; CHECK-NEXT: ret
  %load = call <vscale x 2 x double> @llvm.aarch64.sve.ldff1.nxv2f64(<vscale x 2 x i1> %pg, double* %a)
  ret <vscale x 2 x double> %load
}

declare <vscale x 16 x i8> @llvm.aarch64.sve.ldff1.nxv16i8(<vscale x 16 x i1>, i8*)

declare <vscale x 8 x i8> @llvm.aarch64.sve.ldff1.nxv8i8(<vscale x 8 x i1>, i8*)
declare <vscale x 8 x i16> @llvm.aarch64.sve.ldff1.nxv8i16(<vscale x 8 x i1>, i16*)
declare <vscale x 8 x half> @llvm.aarch64.sve.ldff1.nxv8f16(<vscale x 8 x i1>, half*)

declare <vscale x 4 x i8> @llvm.aarch64.sve.ldff1.nxv4i8(<vscale x 4 x i1>, i8*)
declare <vscale x 4 x i16> @llvm.aarch64.sve.ldff1.nxv4i16(<vscale x 4 x i1>, i16*)
declare <vscale x 4 x i32> @llvm.aarch64.sve.ldff1.nxv4i32(<vscale x 4 x i1>, i32*)
declare <vscale x 2 x float> @llvm.aarch64.sve.ldff1.nxv2f32(<vscale x 2 x i1>, float*)
declare <vscale x 4 x float> @llvm.aarch64.sve.ldff1.nxv4f32(<vscale x 4 x i1>, float*)

declare <vscale x 2 x i8> @llvm.aarch64.sve.ldff1.nxv2i8(<vscale x 2 x i1>, i8*)
declare <vscale x 2 x i16> @llvm.aarch64.sve.ldff1.nxv2i16(<vscale x 2 x i1>, i16*)
declare <vscale x 2 x i32> @llvm.aarch64.sve.ldff1.nxv2i32(<vscale x 2 x i1>, i32*)
declare <vscale x 2 x i64> @llvm.aarch64.sve.ldff1.nxv2i64(<vscale x 2 x i1>, i64*)
declare <vscale x 2 x double> @llvm.aarch64.sve.ldff1.nxv2f64(<vscale x 2 x i1>, double*)