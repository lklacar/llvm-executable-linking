; ModuleID = 'example.c'
source_filename = "example.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define dso_local i32 @sys_write(i32, i8*, i32) local_unnamed_addr #0 {
  %4 = tail call i32 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i32 1, i32 %0, i8* %1, i32 %2) #3, !srcloc !2
  ret i32 %4
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: norecurse nounwind uwtable writeonly
define dso_local i8* @itoa(i32, i8* returned, i32) local_unnamed_addr #2 {
  %4 = icmp eq i32 %0, 0
  br i1 %4, label %5, label %6

; <label>:5:                                      ; preds = %3
  store i8 48, i8* %1, align 1, !tbaa !3
  br label %36

; <label>:6:                                      ; preds = %3
  %7 = icmp slt i32 %0, 0
  %8 = icmp eq i32 %2, 10
  %9 = and i1 %7, %8
  %10 = sub nsw i32 0, %0
  %11 = select i1 %9, i32 %10, i32 %0
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %27, label %13

; <label>:13:                                     ; preds = %6, %13
  %14 = phi i64 [ %21, %13 ], [ 0, %6 ]
  %15 = phi i32 [ %23, %13 ], [ %11, %6 ]
  %16 = srem i32 %15, %2
  %17 = icmp sgt i32 %16, 9
  %18 = select i1 %17, i32 87, i32 48
  %19 = add nsw i32 %18, %16
  %20 = trunc i32 %19 to i8
  %21 = add nuw i64 %14, 1
  %22 = getelementptr inbounds i8, i8* %1, i64 %14
  store i8 %20, i8* %22, align 1, !tbaa !3
  %23 = sdiv i32 %15, %2
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %13

; <label>:25:                                     ; preds = %13
  %26 = trunc i64 %21 to i32
  br label %27

; <label>:27:                                     ; preds = %25, %6
  %28 = phi i32 [ 0, %6 ], [ %26, %25 ]
  br i1 %9, label %29, label %33

; <label>:29:                                     ; preds = %27
  %30 = add nuw nsw i32 %28, 1
  %31 = zext i32 %28 to i64
  %32 = getelementptr inbounds i8, i8* %1, i64 %31
  store i8 45, i8* %32, align 1, !tbaa !3
  br label %33

; <label>:33:                                     ; preds = %27, %29
  %34 = phi i32 [ %30, %29 ], [ %28, %27 ]
  %35 = sext i32 %34 to i64
  br label %36

; <label>:36:                                     ; preds = %33, %5
  %37 = phi i64 [ %35, %33 ], [ 1, %5 ]
  %38 = getelementptr inbounds i8, i8* %1, i64 %37
  store i8 0, i8* %38, align 1, !tbaa !3
  ret i8* %1
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  %1 = alloca [100 x i8], align 16
  br label %2

; <label>:2:                                      ; preds = %2, %0
  %3 = phi i32 [ 1, %0 ], [ %16, %2 ]
  %4 = phi i32 [ 1, %0 ], [ %15, %2 ]
  %5 = phi i32 [ 0, %0 ], [ %14, %2 ]
  %6 = add nsw i32 %4, %5
  %7 = add nsw i32 %6, %4
  %8 = add nsw i32 %7, %6
  %9 = add nsw i32 %8, %7
  %10 = add nsw i32 %9, %8
  %11 = add nsw i32 %10, %9
  %12 = add nsw i32 %11, %10
  %13 = add nsw i32 %12, %11
  %14 = add nsw i32 %13, %12
  %15 = add nsw i32 %14, %13
  %16 = add nuw nsw i32 %3, 10
  %17 = icmp eq i32 %16, 2000000001
  br i1 %17, label %18, label %2

; <label>:18:                                     ; preds = %2
  %19 = getelementptr inbounds [100 x i8], [100 x i8]* %1, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 100, i8* nonnull %19) #3
  %20 = icmp eq i32 %15, 0
  br i1 %20, label %21, label %22

; <label>:21:                                     ; preds = %18
  store i8 48, i8* %19, align 16, !tbaa !3
  br label %49

; <label>:22:                                     ; preds = %18
  %23 = icmp slt i32 %15, 0
  %24 = sub nsw i32 0, %15
  %25 = select i1 %23, i32 %24, i32 %15
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %40, label %27

; <label>:27:                                     ; preds = %22, %27
  %28 = phi i64 [ %33, %27 ], [ 0, %22 ]
  %29 = phi i32 [ %35, %27 ], [ %25, %22 ]
  %30 = srem i32 %29, 10
  %31 = trunc i32 %30 to i8
  %32 = add i8 %31, 48
  %33 = add nuw i64 %28, 1
  %34 = getelementptr inbounds [100 x i8], [100 x i8]* %1, i64 0, i64 %28
  store i8 %32, i8* %34, align 1, !tbaa !3
  %35 = sdiv i32 %29, 10
  %36 = add i32 %29, 9
  %37 = icmp ult i32 %36, 19
  br i1 %37, label %38, label %27

; <label>:38:                                     ; preds = %27
  %39 = trunc i64 %33 to i32
  br label %40

; <label>:40:                                     ; preds = %38, %22
  %41 = phi i32 [ 0, %22 ], [ %39, %38 ]
  br i1 %23, label %42, label %46

; <label>:42:                                     ; preds = %40
  %43 = add nuw nsw i32 %41, 1
  %44 = zext i32 %41 to i64
  %45 = getelementptr inbounds [100 x i8], [100 x i8]* %1, i64 0, i64 %44
  store i8 45, i8* %45, align 1, !tbaa !3
  br label %46

; <label>:46:                                     ; preds = %42, %40
  %47 = phi i32 [ %43, %42 ], [ %41, %40 ]
  %48 = sext i32 %47 to i64
  br label %49

; <label>:49:                                     ; preds = %21, %46
  %50 = phi i64 [ 1, %21 ], [ %48, %46 ]
  %51 = getelementptr inbounds [100 x i8], [100 x i8]* %1, i64 0, i64 %50
  store i8 0, i8* %51, align 1, !tbaa !3
  %52 = call i32 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i32 1, i32 1, i8* nonnull %19, i32 100) #3, !srcloc !2
  call void @llvm.lifetime.end.p0i8(i64 100, i8* nonnull %19) #3
  ret i32 %15
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { norecurse nounwind uwtable writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 8.0.0-3 (tags/RELEASE_800/final)"}
!2 = !{i32 139}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
