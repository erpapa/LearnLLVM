; ModuleID = 'Calculate.Module'
source_filename = "Calculate.Module"

@a.str = private constant [2 x i8] c"a\00"
@b.str = private constant [2 x i8] c"b\00"

define i32 @main(i32 %0, ptr %1) {
entry:
  %2 = call i32 @calc_read(ptr @a.str)
  %3 = call i32 @calc_read(ptr @b.str)
  %4 = add nsw i32 %2, %3
  %5 = mul nsw i32 %4, 3
  call void @calc_write(i32 %5)
  ret i32 0
}

declare i32 @calc_read(ptr)

declare void @calc_write(i32)