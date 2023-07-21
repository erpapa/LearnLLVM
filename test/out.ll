; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx13.0.0"

%"class.std::__1::basic_ostream" = type { ptr, %"class.std::__1::basic_ios.base" }
%"class.std::__1::basic_ios.base" = type <{ %"class.std::__1::ios_base", ptr, i32 }>
%"class.std::__1::ios_base" = type { ptr, i32, i64, i64, i32, i32, ptr, ptr, ptr, ptr, i64, i64, ptr, i64, i64, ptr, i64, i64 }
%"class.std::__1::basic_istream" = type { ptr, i64, %"class.std::__1::basic_ios.base" }
%"class.std::__1::locale::id" = type <{ %"struct.std::__1::once_flag", i32, [4 x i8] }>
%"struct.std::__1::once_flag" = type { i64 }
%"class.std::__1::locale" = type { ptr }
%"class.std::__1::basic_ostream<char>::sentry" = type { i8, ptr }
%"class.std::__1::basic_ios" = type <{ %"class.std::__1::ios_base", ptr, i32, [4 x i8] }>
%"class.std::__1::basic_string" = type { %"class.std::__1::__compressed_pair" }
%"class.std::__1::__compressed_pair" = type { %"struct.std::__1::__compressed_pair_elem" }
%"struct.std::__1::__compressed_pair_elem" = type { %"struct.std::__1::basic_string<char>::__rep" }
%"struct.std::__1::basic_string<char>::__rep" = type { %union.anon }
%union.anon = type { %"struct.std::__1::basic_string<char>::__long" }
%"struct.std::__1::basic_string<char>::__long" = type { i64, i64, ptr }
%"struct.std::__1::basic_string<char>::__short" = type { %union.anon.0, [23 x i8] }
%union.anon.0 = type { i8 }

@a.str = private constant [2 x i8] c"a\00"
@b.str = private constant [2 x i8] c"b\00"
@_ZNSt3__14coutE = external global %"class.std::__1::basic_ostream", align 8
@.str = private unnamed_addr constant [16 x i8] c"The result is: \00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"Enter a value for \00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c": \00", align 1
@_ZNSt3__13cinE = external global %"class.std::__1::basic_istream", align 8
@_ZNSt3__15ctypeIcE2idE = external global %"class.std::__1::locale::id", align 8

define i32 @main(i32 %0, ptr %1) {
entry:
  %2 = call i32 @calc_read(ptr @a.str)
  %3 = call i32 @calc_read(ptr @b.str)
  %4 = add nsw i32 %2, %3
  %5 = mul nsw i32 %4, 3
  call void @calc_write(i32 %5)
  ret i32 0
}

; Function Attrs: noinline optnone ssp uwtable
define void @calc_write(i32 %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = call nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr @.str)
  %4 = load i32, ptr %2, align 4
  %5 = call nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi(ptr %3, i32 %4)
  %6 = call nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E(ptr %5, ptr @_ZNSt3__14endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_)
  ret void
}

; Function Attrs: noinline optnone ssp uwtable
define linkonce_odr nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr nonnull align 8 dereferenceable(8) %0, ptr %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = call i64 @_ZNSt3__111char_traitsIcE6lengthEPKc(ptr %7) #6
  %9 = call nonnull align 8 dereferenceable(8) ptr @_ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m(ptr nonnull align 8 dereferenceable(8) %5, ptr %6, i64 %8)
  ret ptr %9
}

declare nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi(ptr, i32) #1

; Function Attrs: noinline optnone ssp uwtable
define linkonce_odr nonnull align 8 dereferenceable(8) ptr @_ZNSt3__14endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_(ptr nonnull align 8 dereferenceable(8) %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = bitcast ptr %4 to ptr
  %6 = load ptr, ptr %5, align 8
  %7 = getelementptr i8, ptr %6, i64 -24
  %8 = bitcast ptr %7 to ptr
  %9 = load i64, ptr %8, align 8
  %10 = bitcast ptr %4 to ptr
  %11 = getelementptr inbounds i8, ptr %10, i64 %9
  %12 = bitcast ptr %11 to ptr
  %13 = call signext i8 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenEc(ptr %12, i8 signext 10)
  %14 = call nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(ptr %3, i8 signext %13)
  %15 = load ptr, ptr %2, align 8
  %16 = call nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv(ptr %15)
  %17 = load ptr, ptr %2, align 8
  ret ptr %17
}

; Function Attrs: noinline optnone ssp uwtable
define internal nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E(ptr %0, ptr %1) #0 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call nonnull align 8 dereferenceable(8) ptr %6(ptr nonnull align 8 dereferenceable(8) %5)
  ret ptr %7
}

; Function Attrs: noinline optnone ssp uwtable
define internal signext i8 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenEc(ptr %0, i8 signext %1) #0 align 2 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca i8, align 1
  %5 = alloca %"class.std::__1::locale", align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i8 %1, ptr %4, align 1
  %8 = load ptr, ptr %3, align 8
  %9 = bitcast ptr %8 to ptr
  call void @_ZNKSt3__18ios_base6getlocEv(ptr sret(%"class.std::__1::locale") align 8 %5, ptr %9)
  %10 = invoke nonnull align 8 dereferenceable(25) ptr @_ZNSt3__1L9use_facetINS_5ctypeIcEEEERKT_RKNS_6localeE(ptr nonnull align 8 dereferenceable(8) %5)
          to label %11 unwind label %15

11:                                               ; preds = %2
  %12 = load i8, ptr %4, align 1
  %13 = invoke signext i8 @_ZNKSt3__15ctypeIcE5widenEc(ptr %10, i8 signext %12)
          to label %14 unwind label %15

14:                                               ; preds = %11
  call void @_ZNSt3__16localeD1Ev(ptr %5)
  ret i8 %13

15:                                               ; preds = %11, %2
  %16 = landingpad { ptr, i32 }
          cleanup
  %17 = extractvalue { ptr, i32 } %16, 0
  store ptr %17, ptr %6, align 8
  %18 = extractvalue { ptr, i32 } %16, 1
  store i32 %18, ptr %7, align 4
  invoke void @_ZNSt3__16localeD1Ev(ptr %5)
          to label %19 unwind label %25

19:                                               ; preds = %15
  br label %20

20:                                               ; preds = %19
  %21 = load ptr, ptr %6, align 8
  %22 = load i32, ptr %7, align 4
  %23 = insertvalue { ptr, i32 } undef, ptr %21, 0
  %24 = insertvalue { ptr, i32 } %23, i32 %22, 1
  resume { ptr, i32 } %24

25:                                               ; preds = %15
  %26 = landingpad { ptr, i32 }
          catch ptr null
  %27 = extractvalue { ptr, i32 } %26, 0
  call void @__clang_call_terminate(ptr %27) #7
  unreachable
}

declare nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(ptr, i8 signext) #1

declare nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv(ptr) #1

declare i32 @__gxx_personality_v0(...)

declare void @_ZNKSt3__18ios_base6getlocEv(ptr sret(%"class.std::__1::locale") align 8, ptr) #1

; Function Attrs: noinline optnone ssp uwtable
define internal nonnull align 8 dereferenceable(25) ptr @_ZNSt3__1L9use_facetINS_5ctypeIcEEEERKT_RKNS_6localeE(ptr nonnull align 8 dereferenceable(8) %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZNKSt3__16locale9use_facetERNS0_2idE(ptr %3, ptr nonnull align 8 dereferenceable(12) @_ZNSt3__15ctypeIcE2idE)
  %5 = bitcast ptr %4 to ptr
  ret ptr %5
}

; Function Attrs: noinline optnone ssp uwtable
define internal signext i8 @_ZNKSt3__15ctypeIcE5widenEc(ptr %0, i8 signext %1) #0 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca i8, align 1
  store ptr %0, ptr %3, align 8
  store i8 %1, ptr %4, align 1
  %5 = load ptr, ptr %3, align 8
  %6 = load i8, ptr %4, align 1
  %7 = bitcast ptr %5 to ptr
  %8 = load ptr, ptr %7, align 8
  %9 = getelementptr inbounds ptr, ptr %8, i64 7
  %10 = load ptr, ptr %9, align 8
  %11 = call signext i8 %10(ptr %5, i8 signext %6)
  ret i8 %11
}

declare void @_ZNSt3__16localeD1Ev(ptr) unnamed_addr #1

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(ptr %0) #2 {
  %2 = call ptr @__cxa_begin_catch(ptr %0) #6
  call void @_ZSt9terminatev() #7
  unreachable
}

declare ptr @__cxa_begin_catch(ptr)

declare void @_ZSt9terminatev()

declare ptr @_ZNKSt3__16locale9use_facetERNS0_2idE(ptr, ptr nonnull align 8 dereferenceable(12)) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define linkonce_odr i64 @_ZNSt3__111char_traitsIcE6lengthEPKc(ptr %0) #3 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call i64 @strlen(ptr %3) #6
  ret i64 %4
}

; Function Attrs: noinline optnone ssp uwtable
define linkonce_odr nonnull align 8 dereferenceable(8) ptr @_ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m(ptr nonnull align 8 dereferenceable(8) %0, ptr %1, i64 %2) #0 personality ptr @__gxx_personality_v0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca %"class.std::__1::basic_ostream<char>::sentry", align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca %"class.std::__1::locale", align 8
  %11 = alloca %"class.std::__1::locale", align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %12 = load ptr, ptr %4, align 8
  invoke void @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_(ptr %7, ptr nonnull align 8 dereferenceable(8) %12)
          to label %13 unwind label %80

13:                                               ; preds = %3
  %14 = invoke zeroext i1 @_ZNKSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentrycvbEv(ptr %7)
          to label %15 unwind label %84

15:                                               ; preds = %13
  br i1 %14, label %16, label %89

16:                                               ; preds = %15
  %17 = load ptr, ptr %4, align 8
  call void @_ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC1ERNS_13basic_ostreamIcS2_EE(ptr %11, ptr nonnull align 8 dereferenceable(8) %17) #6
  %18 = load ptr, ptr %5, align 8
  %19 = load ptr, ptr %4, align 8
  %20 = bitcast ptr %19 to ptr
  %21 = load ptr, ptr %20, align 8
  %22 = getelementptr i8, ptr %21, i64 -24
  %23 = bitcast ptr %22 to ptr
  %24 = load i64, ptr %23, align 8
  %25 = bitcast ptr %19 to ptr
  %26 = getelementptr inbounds i8, ptr %25, i64 %24
  %27 = bitcast ptr %26 to ptr
  %28 = invoke i32 @_ZNKSt3__18ios_base5flagsEv(ptr %27)
          to label %29 unwind label %84

29:                                               ; preds = %16
  %30 = and i32 %28, 176
  %31 = icmp eq i32 %30, 32
  br i1 %31, label %32, label %36

32:                                               ; preds = %29
  %33 = load ptr, ptr %5, align 8
  %34 = load i64, ptr %6, align 8
  %35 = getelementptr inbounds i8, ptr %33, i64 %34
  br label %38

36:                                               ; preds = %29
  %37 = load ptr, ptr %5, align 8
  br label %38

38:                                               ; preds = %36, %32
  %39 = phi ptr [ %35, %32 ], [ %37, %36 ]
  %40 = load ptr, ptr %5, align 8
  %41 = load i64, ptr %6, align 8
  %42 = getelementptr inbounds i8, ptr %40, i64 %41
  %43 = load ptr, ptr %4, align 8
  %44 = bitcast ptr %43 to ptr
  %45 = load ptr, ptr %44, align 8
  %46 = getelementptr i8, ptr %45, i64 -24
  %47 = bitcast ptr %46 to ptr
  %48 = load i64, ptr %47, align 8
  %49 = bitcast ptr %43 to ptr
  %50 = getelementptr inbounds i8, ptr %49, i64 %48
  %51 = bitcast ptr %50 to ptr
  %52 = load ptr, ptr %4, align 8
  %53 = bitcast ptr %52 to ptr
  %54 = load ptr, ptr %53, align 8
  %55 = getelementptr i8, ptr %54, i64 -24
  %56 = bitcast ptr %55 to ptr
  %57 = load i64, ptr %56, align 8
  %58 = bitcast ptr %52 to ptr
  %59 = getelementptr inbounds i8, ptr %58, i64 %57
  %60 = bitcast ptr %59 to ptr
  %61 = invoke signext i8 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE4fillEv(ptr %60)
          to label %62 unwind label %84

62:                                               ; preds = %38
  %63 = getelementptr inbounds %"class.std::__1::locale", ptr %11, i32 0, i32 0
  %64 = load ptr, ptr %63, align 8
  %65 = invoke ptr @_ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_(ptr %64, ptr %18, ptr %39, ptr %42, ptr nonnull align 8 dereferenceable(136) %51, i8 signext %61)
          to label %66 unwind label %84

66:                                               ; preds = %62
  %67 = getelementptr inbounds %"class.std::__1::locale", ptr %10, i32 0, i32 0
  store ptr %65, ptr %67, align 8
  %68 = call zeroext i1 @_ZNKSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEE6failedEv(ptr %10) #6
  br i1 %68, label %69, label %88

69:                                               ; preds = %66
  %70 = load ptr, ptr %4, align 8
  %71 = bitcast ptr %70 to ptr
  %72 = load ptr, ptr %71, align 8
  %73 = getelementptr i8, ptr %72, i64 -24
  %74 = bitcast ptr %73 to ptr
  %75 = load i64, ptr %74, align 8
  %76 = bitcast ptr %70 to ptr
  %77 = getelementptr inbounds i8, ptr %76, i64 %75
  %78 = bitcast ptr %77 to ptr
  invoke void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateEj(ptr %78, i32 5)
          to label %79 unwind label %84

79:                                               ; preds = %69
  br label %88

80:                                               ; preds = %89, %3
  %81 = landingpad { ptr, i32 }
          catch ptr null
  %82 = extractvalue { ptr, i32 } %81, 0
  store ptr %82, ptr %8, align 8
  %83 = extractvalue { ptr, i32 } %81, 1
  store i32 %83, ptr %9, align 4
  br label %92

84:                                               ; preds = %69, %62, %38, %16, %13
  %85 = landingpad { ptr, i32 }
          catch ptr null
  %86 = extractvalue { ptr, i32 } %85, 0
  store ptr %86, ptr %8, align 8
  %87 = extractvalue { ptr, i32 } %85, 1
  store i32 %87, ptr %9, align 4
  invoke void @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev(ptr %7)
          to label %91 unwind label %117

88:                                               ; preds = %79, %66
  br label %89

89:                                               ; preds = %88, %15
  invoke void @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev(ptr %7)
          to label %90 unwind label %80

90:                                               ; preds = %89
  br label %105

91:                                               ; preds = %84
  br label %92

92:                                               ; preds = %91, %80
  %93 = load ptr, ptr %8, align 8
  %94 = call ptr @__cxa_begin_catch(ptr %93) #6
  %95 = load ptr, ptr %4, align 8
  %96 = bitcast ptr %95 to ptr
  %97 = load ptr, ptr %96, align 8
  %98 = getelementptr i8, ptr %97, i64 -24
  %99 = bitcast ptr %98 to ptr
  %100 = load i64, ptr %99, align 8
  %101 = bitcast ptr %95 to ptr
  %102 = getelementptr inbounds i8, ptr %101, i64 %100
  %103 = bitcast ptr %102 to ptr
  invoke void @_ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv(ptr %103)
          to label %104 unwind label %107

104:                                              ; preds = %92
  call void @__cxa_end_catch()
  br label %105

105:                                              ; preds = %104, %90
  %106 = load ptr, ptr %4, align 8
  ret ptr %106

107:                                              ; preds = %92
  %108 = landingpad { ptr, i32 }
          cleanup
  %109 = extractvalue { ptr, i32 } %108, 0
  store ptr %109, ptr %8, align 8
  %110 = extractvalue { ptr, i32 } %108, 1
  store i32 %110, ptr %9, align 4
  invoke void @__cxa_end_catch()
          to label %111 unwind label %117

111:                                              ; preds = %107
  br label %112

112:                                              ; preds = %111
  %113 = load ptr, ptr %8, align 8
  %114 = load i32, ptr %9, align 4
  %115 = insertvalue { ptr, i32 } undef, ptr %113, 0
  %116 = insertvalue { ptr, i32 } %115, i32 %114, 1
  resume { ptr, i32 } %116

117:                                              ; preds = %107, %84
  %118 = landingpad { ptr, i32 }
          catch ptr null
  %119 = extractvalue { ptr, i32 } %118, 0
  call void @__clang_call_terminate(ptr %119) #7
  unreachable
}

declare void @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_(ptr, ptr nonnull align 8 dereferenceable(8)) unnamed_addr #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal zeroext i1 @_ZNKSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentrycvbEv(ptr %0) #3 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::basic_ostream<char>::sentry", ptr %3, i32 0, i32 0
  %5 = load i8, ptr %4, align 8
  %6 = trunc i8 %5 to i1
  ret i1 %6
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @_ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC1ERNS_13basic_ostreamIcS2_EE(ptr %0, ptr nonnull align 8 dereferenceable(8) %1) unnamed_addr #3 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  call void @_ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC2ERNS_13basic_ostreamIcS2_EE(ptr %5, ptr nonnull align 8 dereferenceable(8) %6) #6
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @_ZNKSt3__18ios_base5flagsEv(ptr %0) #3 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::ios_base", ptr %3, i32 0, i32 1
  %5 = load i32, ptr %4, align 8
  ret i32 %5
}

; Function Attrs: noinline optnone ssp uwtable
define internal signext i8 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE4fillEv(ptr %0) #0 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call i32 @_ZNSt3__111char_traitsIcE3eofEv() #6
  %5 = getelementptr inbounds %"class.std::__1::basic_ios", ptr %3, i32 0, i32 2
  %6 = load i32, ptr %5, align 8
  %7 = call zeroext i1 @_ZNSt3__111char_traitsIcE11eq_int_typeEii(i32 %4, i32 %6) #6
  br i1 %7, label %8, label %12

8:                                                ; preds = %1
  %9 = call signext i8 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenEc(ptr %3, i8 signext 32)
  %10 = sext i8 %9 to i32
  %11 = getelementptr inbounds %"class.std::__1::basic_ios", ptr %3, i32 0, i32 2
  store i32 %10, ptr %11, align 8
  br label %12

12:                                               ; preds = %8, %1
  %13 = getelementptr inbounds %"class.std::__1::basic_ios", ptr %3, i32 0, i32 2
  %14 = load i32, ptr %13, align 8
  %15 = trunc i32 %14 to i8
  ret i8 %15
}

; Function Attrs: noinline optnone ssp uwtable
define linkonce_odr hidden ptr @_ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_(ptr %0, ptr %1, ptr %2, ptr %3, ptr nonnull align 8 dereferenceable(136) %4, i8 signext %5) #0 personality ptr @__gxx_personality_v0 {
  %7 = alloca %"class.std::__1::locale", align 8
  %8 = alloca %"class.std::__1::locale", align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i8, align 1
  %14 = alloca %"class.std::__1::locale", align 8
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  %17 = alloca i64, align 8
  %18 = alloca %"class.std::__1::locale", align 8
  %19 = alloca %"class.std::__1::basic_string", align 8
  %20 = alloca ptr, align 8
  %21 = alloca i32, align 4
  %22 = alloca %"class.std::__1::locale", align 8
  %23 = alloca i32, align 4
  %24 = alloca %"class.std::__1::locale", align 8
  %25 = getelementptr inbounds %"class.std::__1::locale", ptr %8, i32 0, i32 0
  store ptr %0, ptr %25, align 8
  store ptr %1, ptr %9, align 8
  store ptr %2, ptr %10, align 8
  store ptr %3, ptr %11, align 8
  store ptr %4, ptr %12, align 8
  store i8 %5, ptr %13, align 1
  %26 = getelementptr inbounds %"class.std::__1::locale", ptr %8, i32 0, i32 0
  %27 = load ptr, ptr %26, align 8
  %28 = call ptr @_ZNSt3__1L15__get_nullptr_tEv()
  %29 = getelementptr inbounds %"class.std::__1::locale", ptr %14, i32 0, i32 0
  store ptr %28, ptr %29, align 8
  %30 = call ptr @_ZNKSt3__19nullptr_tcvPT_INS_15basic_streambufIcNS_11char_traitsIcEEEEEEv(ptr %14)
  %31 = icmp eq ptr %27, %30
  br i1 %31, label %32, label %35

32:                                               ; preds = %6
  %33 = bitcast ptr %7 to ptr
  %34 = bitcast ptr %8 to ptr
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %33, ptr align 8 %34, i64 8, i1 false)
  br label %136

35:                                               ; preds = %6
  %36 = load ptr, ptr %11, align 8
  %37 = load ptr, ptr %9, align 8
  %38 = ptrtoint ptr %36 to i64
  %39 = ptrtoint ptr %37 to i64
  %40 = sub i64 %38, %39
  store i64 %40, ptr %15, align 8
  %41 = load ptr, ptr %12, align 8
  %42 = call i64 @_ZNKSt3__18ios_base5widthEv(ptr %41)
  store i64 %42, ptr %16, align 8
  %43 = load i64, ptr %16, align 8
  %44 = load i64, ptr %15, align 8
  %45 = icmp sgt i64 %43, %44
  br i1 %45, label %46, label %50

46:                                               ; preds = %35
  %47 = load i64, ptr %15, align 8
  %48 = load i64, ptr %16, align 8
  %49 = sub nsw i64 %48, %47
  store i64 %49, ptr %16, align 8
  br label %51

50:                                               ; preds = %35
  store i64 0, ptr %16, align 8
  br label %51

51:                                               ; preds = %50, %46
  %52 = load ptr, ptr %10, align 8
  %53 = load ptr, ptr %9, align 8
  %54 = ptrtoint ptr %52 to i64
  %55 = ptrtoint ptr %53 to i64
  %56 = sub i64 %54, %55
  store i64 %56, ptr %17, align 8
  %57 = load i64, ptr %17, align 8
  %58 = icmp sgt i64 %57, 0
  br i1 %58, label %59, label %75

59:                                               ; preds = %51
  %60 = getelementptr inbounds %"class.std::__1::locale", ptr %8, i32 0, i32 0
  %61 = load ptr, ptr %60, align 8
  %62 = load ptr, ptr %9, align 8
  %63 = load i64, ptr %17, align 8
  %64 = call i64 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnEPKcl(ptr %61, ptr %62, i64 %63)
  %65 = load i64, ptr %17, align 8
  %66 = icmp ne i64 %64, %65
  br i1 %66, label %67, label %74

67:                                               ; preds = %59
  %68 = call ptr @_ZNSt3__1L15__get_nullptr_tEv()
  %69 = getelementptr inbounds %"class.std::__1::locale", ptr %18, i32 0, i32 0
  store ptr %68, ptr %69, align 8
  %70 = call ptr @_ZNKSt3__19nullptr_tcvPT_INS_15basic_streambufIcNS_11char_traitsIcEEEEEEv(ptr %18)
  %71 = getelementptr inbounds %"class.std::__1::locale", ptr %8, i32 0, i32 0
  store ptr %70, ptr %71, align 8
  %72 = bitcast ptr %7 to ptr
  %73 = bitcast ptr %8 to ptr
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %72, ptr align 8 %73, i64 8, i1 false)
  br label %136

74:                                               ; preds = %59
  br label %75

75:                                               ; preds = %74, %51
  %76 = load i64, ptr %16, align 8
  %77 = icmp sgt i64 %76, 0
  br i1 %77, label %78, label %107

78:                                               ; preds = %75
  %79 = load i64, ptr %16, align 8
  %80 = load i8, ptr %13, align 1
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1Emc(ptr %19, i64 %79, i8 signext %80)
  %81 = getelementptr inbounds %"class.std::__1::locale", ptr %8, i32 0, i32 0
  %82 = load ptr, ptr %81, align 8
  %83 = call ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataEv(ptr %19) #6
  %84 = load i64, ptr %16, align 8
  %85 = invoke i64 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnEPKcl(ptr %82, ptr %83, i64 %84)
          to label %86 unwind label %98

86:                                               ; preds = %78
  %87 = load i64, ptr %16, align 8
  %88 = icmp ne i64 %85, %87
  br i1 %88, label %89, label %102

89:                                               ; preds = %86
  %90 = invoke ptr @_ZNSt3__1L15__get_nullptr_tEv()
          to label %91 unwind label %98

91:                                               ; preds = %89
  %92 = getelementptr inbounds %"class.std::__1::locale", ptr %22, i32 0, i32 0
  store ptr %90, ptr %92, align 8
  %93 = invoke ptr @_ZNKSt3__19nullptr_tcvPT_INS_15basic_streambufIcNS_11char_traitsIcEEEEEEv(ptr %22)
          to label %94 unwind label %98

94:                                               ; preds = %91
  %95 = getelementptr inbounds %"class.std::__1::locale", ptr %8, i32 0, i32 0
  store ptr %93, ptr %95, align 8
  %96 = bitcast ptr %7 to ptr
  %97 = bitcast ptr %8 to ptr
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %96, ptr align 8 %97, i64 8, i1 false)
  store i32 1, ptr %23, align 4
  br label %103

98:                                               ; preds = %91, %89, %78
  %99 = landingpad { ptr, i32 }
          cleanup
  %100 = extractvalue { ptr, i32 } %99, 0
  store ptr %100, ptr %20, align 8
  %101 = extractvalue { ptr, i32 } %99, 1
  store i32 %101, ptr %21, align 4
  invoke void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr %19)
          to label %106 unwind label %144

102:                                              ; preds = %86
  store i32 0, ptr %23, align 4
  br label %103

103:                                              ; preds = %102, %94
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr %19)
  %104 = load i32, ptr %23, align 4
  switch i32 %104, label %147 [
    i32 0, label %105
    i32 1, label %136
  ]

105:                                              ; preds = %103
  br label %107

106:                                              ; preds = %98
  br label %139

107:                                              ; preds = %105, %75
  %108 = load ptr, ptr %11, align 8
  %109 = load ptr, ptr %10, align 8
  %110 = ptrtoint ptr %108 to i64
  %111 = ptrtoint ptr %109 to i64
  %112 = sub i64 %110, %111
  store i64 %112, ptr %17, align 8
  %113 = load i64, ptr %17, align 8
  %114 = icmp sgt i64 %113, 0
  br i1 %114, label %115, label %131

115:                                              ; preds = %107
  %116 = getelementptr inbounds %"class.std::__1::locale", ptr %8, i32 0, i32 0
  %117 = load ptr, ptr %116, align 8
  %118 = load ptr, ptr %10, align 8
  %119 = load i64, ptr %17, align 8
  %120 = call i64 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnEPKcl(ptr %117, ptr %118, i64 %119)
  %121 = load i64, ptr %17, align 8
  %122 = icmp ne i64 %120, %121
  br i1 %122, label %123, label %130

123:                                              ; preds = %115
  %124 = call ptr @_ZNSt3__1L15__get_nullptr_tEv()
  %125 = getelementptr inbounds %"class.std::__1::locale", ptr %24, i32 0, i32 0
  store ptr %124, ptr %125, align 8
  %126 = call ptr @_ZNKSt3__19nullptr_tcvPT_INS_15basic_streambufIcNS_11char_traitsIcEEEEEEv(ptr %24)
  %127 = getelementptr inbounds %"class.std::__1::locale", ptr %8, i32 0, i32 0
  store ptr %126, ptr %127, align 8
  %128 = bitcast ptr %7 to ptr
  %129 = bitcast ptr %8 to ptr
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %128, ptr align 8 %129, i64 8, i1 false)
  br label %136

130:                                              ; preds = %115
  br label %131

131:                                              ; preds = %130, %107
  %132 = load ptr, ptr %12, align 8
  %133 = call i64 @_ZNSt3__18ios_base5widthEl(ptr %132, i64 0)
  %134 = bitcast ptr %7 to ptr
  %135 = bitcast ptr %8 to ptr
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %134, ptr align 8 %135, i64 8, i1 false)
  br label %136

136:                                              ; preds = %131, %123, %103, %67, %32
  %137 = getelementptr inbounds %"class.std::__1::locale", ptr %7, i32 0, i32 0
  %138 = load ptr, ptr %137, align 8
  ret ptr %138

139:                                              ; preds = %106
  %140 = load ptr, ptr %20, align 8
  %141 = load i32, ptr %21, align 4
  %142 = insertvalue { ptr, i32 } undef, ptr %140, 0
  %143 = insertvalue { ptr, i32 } %142, i32 %141, 1
  resume { ptr, i32 } %143

144:                                              ; preds = %98
  %145 = landingpad { ptr, i32 }
          catch ptr null
  %146 = extractvalue { ptr, i32 } %145, 0
  call void @__clang_call_terminate(ptr %146) #7
  unreachable

147:                                              ; preds = %103
  unreachable
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal zeroext i1 @_ZNKSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEE6failedEv(ptr %0) #3 align 2 personality ptr @__gxx_personality_v0 {
  %2 = alloca ptr, align 8
  %3 = alloca %"class.std::__1::locale", align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %"class.std::__1::locale", ptr %6, i32 0, i32 0
  %8 = load ptr, ptr %7, align 8
  %9 = invoke ptr @_ZNSt3__1L15__get_nullptr_tEv()
          to label %10 unwind label %14

10:                                               ; preds = %1
  %11 = getelementptr inbounds %"class.std::__1::locale", ptr %3, i32 0, i32 0
  store ptr %9, ptr %11, align 8
  %12 = call ptr @_ZNKSt3__19nullptr_tcvPT_INS_15basic_streambufIcNS_11char_traitsIcEEEEEEv(ptr %3)
  %13 = icmp eq ptr %8, %12
  ret i1 %13

14:                                               ; preds = %1
  %15 = landingpad { ptr, i32 }
          filter [0 x ptr] zeroinitializer
  %16 = extractvalue { ptr, i32 } %15, 0
  store ptr %16, ptr %4, align 8
  %17 = extractvalue { ptr, i32 } %15, 1
  store i32 %17, ptr %5, align 4
  br label %18

18:                                               ; preds = %14
  %19 = load ptr, ptr %4, align 8
  call void @__cxa_call_unexpected(ptr %19) #8
  unreachable
}

; Function Attrs: noinline optnone ssp uwtable
define internal void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateEj(ptr %0, i32 %1) #0 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = bitcast ptr %5 to ptr
  %7 = load i32, ptr %4, align 4
  call void @_ZNSt3__18ios_base8setstateEj(ptr %6, i32 %7)
  ret void
}

declare void @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev(ptr) unnamed_addr #1

declare void @_ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv(ptr) #1

declare void @__cxa_end_catch()

; Function Attrs: noinline optnone ssp uwtable
define internal void @_ZNSt3__18ios_base8setstateEj(ptr %0, i32 %1) #0 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %"class.std::__1::ios_base", ptr %5, i32 0, i32 4
  %7 = load i32, ptr %6, align 8
  %8 = load i32, ptr %4, align 4
  %9 = or i32 %7, %8
  call void @_ZNSt3__18ios_base5clearEj(ptr %5, i32 %9)
  ret void
}

declare void @_ZNSt3__18ios_base5clearEj(ptr, i32) #1

; Function Attrs: noinline optnone ssp uwtable
define internal ptr @_ZNSt3__1L15__get_nullptr_tEv() #0 {
  %1 = alloca %"class.std::__1::locale", align 8
  call void @_ZNSt3__19nullptr_tC1EMNS0_5__natEi(ptr %1, i64 -1)
  %2 = getelementptr inbounds %"class.std::__1::locale", ptr %1, i32 0, i32 0
  %3 = load ptr, ptr %2, align 8
  ret ptr %3
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal ptr @_ZNKSt3__19nullptr_tcvPT_INS_15basic_streambufIcNS_11char_traitsIcEEEEEEv(ptr %0) #3 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr null
}

declare void @__cxa_call_unexpected(ptr)

; Function Attrs: noinline optnone ssp uwtable
define internal void @_ZNSt3__19nullptr_tC1EMNS0_5__natEi(ptr %0, i64 %1) unnamed_addr #0 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load i64, ptr %4, align 8
  call void @_ZNSt3__19nullptr_tC2EMNS0_5__natEi(ptr %5, i64 %6)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @_ZNSt3__19nullptr_tC2EMNS0_5__natEi(ptr %0, i64 %1) unnamed_addr #3 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %"class.std::__1::locale", ptr %5, i32 0, i32 0
  store ptr null, ptr %6, align 8
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @_ZNKSt3__18ios_base5widthEv(ptr %0) #3 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::ios_base", ptr %3, i32 0, i32 3
  %5 = load i64, ptr %4, align 8
  ret i64 %5
}

; Function Attrs: noinline optnone ssp uwtable
define internal i64 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnEPKcl(ptr %0, ptr %1, i64 %2) #0 align 2 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load i64, ptr %6, align 8
  %10 = bitcast ptr %7 to ptr
  %11 = load ptr, ptr %10, align 8
  %12 = getelementptr inbounds ptr, ptr %11, i64 12
  %13 = load ptr, ptr %12, align 8
  %14 = call i64 %13(ptr %7, ptr %8, i64 %9)
  ret i64 %14
}

; Function Attrs: noinline optnone ssp uwtable
define internal void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1Emc(ptr %0, i64 %1, i8 signext %2) unnamed_addr #0 align 2 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8, align 1
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store i8 %2, ptr %6, align 1
  %7 = load ptr, ptr %4, align 8
  %8 = load i64, ptr %5, align 8
  %9 = load i8, ptr %6, align 1
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2Emc(ptr %7, i64 %8, i8 signext %9)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataEv(ptr %0) #3 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerEv(ptr %3) #6
  %5 = call ptr @_ZNSt3__1L12__to_addressIKcEEPT_S3_(ptr %4) #6
  ret ptr %5
}

declare void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr) unnamed_addr #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i64 @_ZNSt3__18ios_base5widthEl(ptr %0, i64 %1) #3 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %"class.std::__1::ios_base", ptr %6, i32 0, i32 3
  %8 = load i64, ptr %7, align 8
  store i64 %8, ptr %5, align 8
  %9 = load i64, ptr %4, align 8
  %10 = getelementptr inbounds %"class.std::__1::ios_base", ptr %6, i32 0, i32 3
  store i64 %9, ptr %10, align 8
  %11 = load i64, ptr %5, align 8
  ret i64 %11
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerEv(ptr %0) #3 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call zeroext i1 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longEv(ptr %3) #6
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = call ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerEv(ptr %3) #6
  br label %9

7:                                                ; preds = %1
  %8 = call ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerEv(ptr %3) #6
  br label %9

9:                                                ; preds = %7, %5
  %10 = phi ptr [ %6, %5 ], [ %8, %7 ]
  ret ptr %10
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal ptr @_ZNSt3__1L12__to_addressIKcEEPT_S3_(ptr %0) #3 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr %3
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal zeroext i1 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longEv(ptr %0) #3 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::basic_string", ptr %3, i32 0, i32 0
  %5 = call nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstEv(ptr %4) #6
  %6 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__rep", ptr %5, i32 0, i32 0
  %7 = bitcast ptr %6 to ptr
  %8 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short", ptr %7, i32 0, i32 0
  %9 = bitcast ptr %8 to ptr
  %10 = load i8, ptr %9, align 8
  %11 = zext i8 %10 to i64
  %12 = and i64 %11, 1
  %13 = icmp ne i64 %12, 0
  ret i1 %13
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerEv(ptr %0) #3 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::basic_string", ptr %3, i32 0, i32 0
  %5 = call nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstEv(ptr %4) #6
  %6 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__rep", ptr %5, i32 0, i32 0
  %7 = bitcast ptr %6 to ptr
  %8 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__long", ptr %7, i32 0, i32 2
  %9 = load ptr, ptr %8, align 8
  ret ptr %9
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerEv(ptr %0) #3 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::basic_string", ptr %3, i32 0, i32 0
  %5 = call nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstEv(ptr %4) #6
  %6 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__rep", ptr %5, i32 0, i32 0
  %7 = bitcast ptr %6 to ptr
  %8 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short", ptr %7, i32 0, i32 1
  %9 = getelementptr inbounds [23 x i8], ptr %8, i64 0, i64 0
  %10 = call ptr @_ZNSt3__114pointer_traitsIPKcE10pointer_toERS1_(ptr nonnull align 1 dereferenceable(1) %9) #6
  ret ptr %10
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstEv(ptr %0) #3 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = bitcast ptr %3 to ptr
  %5 = call nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getEv(ptr %4) #6
  ret ptr %5
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal ptr @_ZNSt3__114pointer_traitsIPKcE10pointer_toERS1_(ptr nonnull align 1 dereferenceable(1) %0) #3 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @_ZNSt3__1L9addressofIKcEEPT_RS2_(ptr nonnull align 1 dereferenceable(1) %3) #6
  ret ptr %4
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal ptr @_ZNSt3__1L9addressofIKcEEPT_RS2_(ptr nonnull align 1 dereferenceable(1) %0) #3 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr %3
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getEv(ptr %0) #3 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem", ptr %3, i32 0, i32 0
  ret ptr %4
}

; Function Attrs: noinline optnone ssp uwtable
define internal void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2Emc(ptr %0, i64 %1, i8 signext %2) unnamed_addr #0 align 2 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8, align 1
  %7 = alloca %union.anon.0, align 1
  %8 = alloca %union.anon.0, align 1
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store i8 %2, ptr %6, align 1
  %9 = load ptr, ptr %4, align 8
  %10 = bitcast ptr %9 to ptr
  %11 = getelementptr inbounds %"class.std::__1::basic_string", ptr %9, i32 0, i32 0
  call void @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC1INS_18__default_init_tagESA_EEOT_OT0_(ptr %11, ptr nonnull align 1 dereferenceable(1) %7, ptr nonnull align 1 dereferenceable(1) %8)
  %12 = load i64, ptr %5, align 8
  %13 = load i8, ptr %6, align 1
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEmc(ptr %9, i64 %12, i8 signext %13)
  ret void
}

; Function Attrs: noinline optnone ssp uwtable
define internal void @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC1INS_18__default_init_tagESA_EEOT_OT0_(ptr %0, ptr nonnull align 1 dereferenceable(1) %1, ptr nonnull align 1 dereferenceable(1) %2) unnamed_addr #0 align 2 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load ptr, ptr %6, align 8
  call void @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC2INS_18__default_init_tagESA_EEOT_OT0_(ptr %7, ptr nonnull align 1 dereferenceable(1) %8, ptr nonnull align 1 dereferenceable(1) %9)
  ret void
}

declare void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEmc(ptr, i64, i8 signext) #1

; Function Attrs: noinline optnone ssp uwtable
define internal void @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC2INS_18__default_init_tagESA_EEOT_OT0_(ptr %0, ptr nonnull align 1 dereferenceable(1) %1, ptr nonnull align 1 dereferenceable(1) %2) unnamed_addr #0 align 2 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca %union.anon.0, align 1
  %8 = alloca %union.anon.0, align 1
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = bitcast ptr %9 to ptr
  %11 = load ptr, ptr %5, align 8
  %12 = call nonnull align 1 dereferenceable(1) ptr @_ZNSt3__1L7forwardINS_18__default_init_tagEEEOT_RNS_16remove_referenceIS2_E4typeE(ptr nonnull align 1 dereferenceable(1) %11) #6
  call void @_ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EEC2ENS_18__default_init_tagE(ptr %10)
  %13 = bitcast ptr %9 to ptr
  %14 = load ptr, ptr %6, align 8
  %15 = call nonnull align 1 dereferenceable(1) ptr @_ZNSt3__1L7forwardINS_18__default_init_tagEEEOT_RNS_16remove_referenceIS2_E4typeE(ptr nonnull align 1 dereferenceable(1) %14) #6
  call void @_ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EEC2ENS_18__default_init_tagE(ptr %13)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal nonnull align 1 dereferenceable(1) ptr @_ZNSt3__1L7forwardINS_18__default_init_tagEEEOT_RNS_16remove_referenceIS2_E4typeE(ptr nonnull align 1 dereferenceable(1) %0) #3 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr %3
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @_ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EEC2ENS_18__default_init_tagE(ptr %0) unnamed_addr #3 align 2 {
  %2 = alloca %union.anon.0, align 1
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem", ptr %4, i32 0, i32 0
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @_ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EEC2ENS_18__default_init_tagE(ptr %0) unnamed_addr #3 align 2 {
  %2 = alloca %union.anon.0, align 1
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = bitcast ptr %4 to ptr
  call void @_ZNSt3__19allocatorIcEC2Ev(ptr %5) #6
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @_ZNSt3__19allocatorIcEC2Ev(ptr %0) unnamed_addr #3 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = bitcast ptr %3 to ptr
  call void @_ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIcEEEC2Ev(ptr %4) #6
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @_ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIcEEEC2Ev(ptr %0) unnamed_addr #3 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define linkonce_odr i32 @_ZNSt3__111char_traitsIcE3eofEv() #3 align 2 {
  ret i32 -1
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define linkonce_odr zeroext i1 @_ZNSt3__111char_traitsIcE11eq_int_typeEii(i32 %0, i32 %1) #3 align 2 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %3, align 4
  %6 = load i32, ptr %4, align 4
  %7 = icmp eq i32 %5, %6
  ret i1 %7
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @_ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC2ERNS_13basic_ostreamIcS2_EE(ptr %0, ptr nonnull align 8 dereferenceable(8) %1) unnamed_addr #3 align 2 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = bitcast ptr %7 to ptr
  %9 = getelementptr inbounds %"class.std::__1::locale", ptr %7, i32 0, i32 0
  %10 = load ptr, ptr %4, align 8
  %11 = bitcast ptr %10 to ptr
  %12 = load ptr, ptr %11, align 8
  %13 = getelementptr i8, ptr %12, i64 -24
  %14 = bitcast ptr %13 to ptr
  %15 = load i64, ptr %14, align 8
  %16 = bitcast ptr %10 to ptr
  %17 = getelementptr inbounds i8, ptr %16, i64 %15
  %18 = bitcast ptr %17 to ptr
  %19 = invoke ptr @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5rdbufEv(ptr %18)
          to label %20 unwind label %21

20:                                               ; preds = %2
  store ptr %19, ptr %9, align 8
  ret void

21:                                               ; preds = %2
  %22 = landingpad { ptr, i32 }
          filter [0 x ptr] zeroinitializer
  %23 = extractvalue { ptr, i32 } %22, 0
  store ptr %23, ptr %5, align 8
  %24 = extractvalue { ptr, i32 } %22, 1
  store i32 %24, ptr %6, align 4
  br label %25

25:                                               ; preds = %21
  %26 = load ptr, ptr %5, align 8
  call void @__cxa_call_unexpected(ptr %26) #8
  unreachable
}

; Function Attrs: noinline optnone ssp uwtable
define internal ptr @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5rdbufEv(ptr %0) #0 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = bitcast ptr %3 to ptr
  %5 = call ptr @_ZNKSt3__18ios_base5rdbufEv(ptr %4)
  %6 = bitcast ptr %5 to ptr
  ret ptr %6
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal ptr @_ZNKSt3__18ios_base5rdbufEv(ptr %0) #3 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::ios_base", ptr %3, i32 0, i32 6
  %5 = load ptr, ptr %4, align 8
  ret ptr %5
}

; Function Attrs: nounwind
declare i64 @strlen(ptr) #5

; Function Attrs: noinline optnone ssp uwtable
define i32 @calc_read(ptr %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %4 = call nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr @.str.1)
  %5 = load ptr, ptr %2, align 8
  %6 = call nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr nonnull align 8 dereferenceable(8) %4, ptr %5)
  %7 = call nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr nonnull align 8 dereferenceable(8) %6, ptr @.str.2)
  %8 = call nonnull align 8 dereferenceable(16) ptr @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEErsERi(ptr @_ZNSt3__13cinE, ptr nonnull align 4 dereferenceable(4) %3)
  %9 = load i32, ptr %3, align 4
  ret i32 %9
}

declare nonnull align 8 dereferenceable(16) ptr @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEErsERi(ptr, ptr nonnull align 4 dereferenceable(4)) #1

attributes #0 = { noinline optnone ssp uwtable "darwin-stkchk-strong-link" "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "probe-stack"="___chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { "darwin-stkchk-strong-link" "frame-pointer"="all" "no-trapping-math"="true" "probe-stack"="___chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #2 = { noinline noreturn nounwind }
attributes #3 = { noinline nounwind optnone ssp uwtable "darwin-stkchk-strong-link" "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "probe-stack"="___chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { nounwind "darwin-stkchk-strong-link" "frame-pointer"="all" "no-trapping-math"="true" "probe-stack"="___chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }
attributes #8 = { noreturn }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Apple clang version 14.0.0 (clang-1400.0.29.202)"}
!1 = !{i32 2, !"SDK Version", [2 x i32] [i32 13, i32 1]}
!2 = !{i32 1, !"wchar_size", i32 4}
!3 = !{i32 8, !"PIC Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 1}
!5 = !{i32 7, !"frame-pointer", i32 2}
