%struct.TreeNode = type { i32, ptr, ptr }

@.str = private unnamed_addr constant [48 x i8] c"El ancestro com\C3\BAn m\C3\A1s bajo de %d y %d es: %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [37 x i8] c"No se encontr\C3\B3 un ancestro com\C3\BAn.\0A\00", align 1

define ptr @lowestCommonAncestor(ptr %0, ptr %1, ptr %2) {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = icmp eq ptr %10, null
  br i1 %11, label %20, label %12

12:                                               
  %13 = load ptr, ptr %5, align 8
  %14 = load ptr, ptr %6, align 8
  %15 = icmp eq ptr %13, %14
  br i1 %15, label %20, label %16

16:                                               
  %17 = load ptr, ptr %5, align 8
  %18 = load ptr, ptr %7, align 8
  %19 = icmp eq ptr %17, %18
  br i1 %19, label %20, label %22

20:                                            
  %21 = load ptr, ptr %5, align 8
  store ptr %21, ptr %4, align 8
  br label %51

22:                                               
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds %struct.TreeNode, ptr %23, i32 0, i32 1
  %25 = load ptr, ptr %24, align 8
  %26 = load ptr, ptr %6, align 8
  %27 = load ptr, ptr %7, align 8
  %28 = call ptr @lowestCommonAncestor(ptr %25, ptr %26, ptr %27)
  store ptr %28, ptr %8, align 8
  %29 = load ptr, ptr %5, align 8
  %30 = getelementptr inbounds %struct.TreeNode, ptr %29, i32 0, i32 2
  %31 = load ptr, ptr %30, align 8
  %32 = load ptr, ptr %6, align 8
  %33 = load ptr, ptr %7, align 8
  %34 = call ptr @lowestCommonAncestor(ptr %31, ptr %32, ptr %33)
  store ptr %34, ptr %9, align 8
  %35 = load ptr, ptr %8, align 8
  %36 = icmp ne ptr %35, null
  br i1 %36, label %37, label %42

37:                                              
  %38 = load ptr, ptr %9, align 8
  %39 = icmp ne ptr %38, null
  br i1 %39, label %40, label %42

40:                                              
  %41 = load ptr, ptr %5, align 8
  store ptr %41, ptr %4, align 8
  br label %51

42:                                            
  %43 = load ptr, ptr %8, align 8
  %44 = icmp ne ptr %43, null
  br i1 %44, label %45, label %47

45:                                             
  %46 = load ptr, ptr %8, align 8
  br label %49

47:                                           
  %48 = load ptr, ptr %9, align 8
  br label %49

49:                                               
  %50 = phi ptr [ %46, %45 ], [ %48, %47 ]
  store ptr %50, ptr %4, align 8
  br label %51

51:                                               
  %52 = load ptr, ptr %4, align 8
  ret ptr %52
}

define ptr @newNode(i32 %0) {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store i32 %0, ptr %2, align 4
  %4 = call noalias ptr @malloc(i64 24) #4
  store ptr %4, ptr %3, align 8
  %5 = load i32, ptr %2, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %struct.TreeNode, ptr %6, i32 0, i32 0
  store i32 %5, ptr %7, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.TreeNode, ptr %8, i32 0, i32 1
  store ptr null, ptr %9, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.TreeNode, ptr %10, i32 0, i32 2
  store ptr null, ptr %11, align 8
  %12 = load ptr, ptr %3, align 8
  ret ptr %12
}

define i32 @main() {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  %6 = call ptr @newNode(i32 3)
  store ptr %6, ptr %2, align 8
  %7 = call ptr @newNode(i32 5)
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds %struct.TreeNode, ptr %8, i32 0, i32 1
  store ptr %7, ptr %9, align 8
  %10 = call ptr @newNode(i32 1)
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.TreeNode, ptr %11, i32 0, i32 2
  store ptr %10, ptr %12, align 8
  %13 = call ptr @newNode(i32 6)
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds %struct.TreeNode, ptr %14, i32 0, i32 1
  %16 = load ptr, ptr %15, align 8
  %17 = getelementptr inbounds %struct.TreeNode, ptr %16, i32 0, i32 1
  store ptr %13, ptr %17, align 8
  %18 = call ptr @newNode(i32 2)
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds %struct.TreeNode, ptr %19, i32 0, i32 1
  %21 = load ptr, ptr %20, align 8
  %22 = getelementptr inbounds %struct.TreeNode, ptr %21, i32 0, i32 2
  store ptr %18, ptr %22, align 8
  %23 = call ptr @newNode(i32 0)
  %24 = load ptr, ptr %2, align 8
  %25 = getelementptr inbounds %struct.TreeNode, ptr %24, i32 0, i32 2
  %26 = load ptr, ptr %25, align 8
  %27 = getelementptr inbounds %struct.TreeNode, ptr %26, i32 0, i32 1
  store ptr %23, ptr %27, align 8
  %28 = call ptr @newNode(i32 8)
  %29 = load ptr, ptr %2, align 8
  %30 = getelementptr inbounds %struct.TreeNode, ptr %29, i32 0, i32 2
  %31 = load ptr, ptr %30, align 8
  %32 = getelementptr inbounds %struct.TreeNode, ptr %31, i32 0, i32 2
  store ptr %28, ptr %32, align 8
  %33 = call ptr @newNode(i32 7)
  %34 = load ptr, ptr %2, align 8
  %35 = getelementptr inbounds %struct.TreeNode, ptr %34, i32 0, i32 1
  %36 = load ptr, ptr %35, align 8
  %37 = getelementptr inbounds %struct.TreeNode, ptr %36, i32 0, i32 2
  %38 = load ptr, ptr %37, align 8
  %39 = getelementptr inbounds %struct.TreeNode, ptr %38, i32 0, i32 1
  store ptr %33, ptr %39, align 8
  %40 = call ptr @newNode(i32 4)
  %41 = load ptr, ptr %2, align 8
  %42 = getelementptr inbounds %struct.TreeNode, ptr %41, i32 0, i32 1
  %43 = load ptr, ptr %42, align 8
  %44 = getelementptr inbounds %struct.TreeNode, ptr %43, i32 0, i32 2
  %45 = load ptr, ptr %44, align 8
  %46 = getelementptr inbounds %struct.TreeNode, ptr %45, i32 0, i32 2
  store ptr %40, ptr %46, align 8
  %47 = load ptr, ptr %2, align 8
  %48 = getelementptr inbounds %struct.TreeNode, ptr %47, i32 0, i32 1
  %49 = load ptr, ptr %48, align 8
  store ptr %49, ptr %3, align 8
  %50 = load ptr, ptr %2, align 8
  %51 = getelementptr inbounds %struct.TreeNode, ptr %50, i32 0, i32 2
  %52 = load ptr, ptr %51, align 8
  store ptr %52, ptr %4, align 8
  %53 = load ptr, ptr %2, align 8
  %54 = load ptr, ptr %3, align 8
  %55 = load ptr, ptr %4, align 8
  %56 = call ptr @lowestCommonAncestor(ptr %53, ptr %54, ptr %55)
  store ptr %56, ptr %5, align 8
  %57 = load ptr, ptr %5, align 8
  %58 = icmp ne ptr %57, null
  br i1 %58, label %59, label %70

59:                                               ; preds = %0
  %60 = load ptr, ptr %3, align 8
  %61 = getelementptr inbounds %struct.TreeNode, ptr %60, i32 0, i32 0
  %62 = load i32, ptr %61, align 8
  %63 = load ptr, ptr %4, align 8
  %64 = getelementptr inbounds %struct.TreeNode, ptr %63, i32 0, i32 0
  %65 = load i32, ptr %64, align 8
  %66 = load ptr, ptr %5, align 8
  %67 = getelementptr inbounds %struct.TreeNode, ptr %66, i32 0, i32 0
  %68 = load i32, ptr %67, align 8
  %69 = call i32 (ptr, ...) @printf(ptr @.str, i32 %62, i32 %65, i32 %68)
  br label %72

70:                                               ; preds = %0
  %71 = call i32 (ptr, ...) @printf(ptr @.str.1)
  br label %72

72:                                               ; preds = %70, %59
  %73 = load ptr, ptr %2, align 8
  %74 = getelementptr inbounds %struct.TreeNode, ptr %73, i32 0, i32 1
  %75 = load ptr, ptr %74, align 8
  store ptr %75, ptr %3, align 8
  %76 = load ptr, ptr %2, align 8
  %77 = getelementptr inbounds %struct.TreeNode, ptr %76, i32 0, i32 1
  %78 = load ptr, ptr %77, align 8
  %79 = getelementptr inbounds %struct.TreeNode, ptr %78, i32 0, i32 2
  %80 = load ptr, ptr %79, align 8
  %81 = getelementptr inbounds %struct.TreeNode, ptr %80, i32 0, i32 2
  %82 = load ptr, ptr %81, align 8
  store ptr %82, ptr %4, align 8
  %83 = load ptr, ptr %2, align 8
  %84 = load ptr, ptr %3, align 8
  %85 = load ptr, ptr %4, align 8
  %86 = call ptr @lowestCommonAncestor(ptr %83, ptr %84, ptr %85)
  store ptr %86, ptr %5, align 8
  %87 = load ptr, ptr %5, align 8
  %88 = icmp ne ptr %87, null
  br i1 %88, label %89, label %100

89:                                             
  %90 = load ptr, ptr %3, align 8
  %91 = getelementptr inbounds %struct.TreeNode, ptr %90, i32 0, i32 0
  %92 = load i32, ptr %91, align 8
  %93 = load ptr, ptr %4, align 8
  %94 = getelementptr inbounds %struct.TreeNode, ptr %93, i32 0, i32 0
  %95 = load i32, ptr %94, align 8
  %96 = load ptr, ptr %5, align 8
  %97 = getelementptr inbounds %struct.TreeNode, ptr %96, i32 0, i32 0
  %98 = load i32, ptr %97, align 8
  %99 = call i32 (ptr, ...) @printf(ptr @.str, i32 %92, i32 %95, i32 %98)
  br label %102

100:                                              
  %101 = call i32 (ptr, ...) @printf(ptr @.str.1)
  br label %102

102:                                            
  %103 = load ptr, ptr %2, align 8
  %104 = getelementptr inbounds %struct.TreeNode, ptr %103, i32 0, i32 1
  %105 = load ptr, ptr %104, align 8
  %106 = getelementptr inbounds %struct.TreeNode, ptr %105, i32 0, i32 2
  %107 = load ptr, ptr %106, align 8
  %108 = getelementptr inbounds %struct.TreeNode, ptr %107, i32 0, i32 1
  %109 = load ptr, ptr %108, align 8
  call void @free(ptr %109) 
  %110 = load ptr, ptr %2, align 8
  %111 = getelementptr inbounds %struct.TreeNode, ptr %110, i32 0, i32 1
  %112 = load ptr, ptr %111, align 8
  %113 = getelementptr inbounds %struct.TreeNode, ptr %112, i32 0, i32 2
  %114 = load ptr, ptr %113, align 8
  %115 = getelementptr inbounds %struct.TreeNode, ptr %114, i32 0, i32 2
  %116 = load ptr, ptr %115, align 8
  call void @free(ptr %116) 
  %117 = load ptr, ptr %2, align 8
  %118 = getelementptr inbounds %struct.TreeNode, ptr %117, i32 0, i32 1
  %119 = load ptr, ptr %118, align 8
  %120 = getelementptr inbounds %struct.TreeNode, ptr %119, i32 0, i32 1
  %121 = load ptr, ptr %120, align 8
  call void @free(ptr %121) 
  %122 = load ptr, ptr %2, align 8
  %123 = getelementptr inbounds %struct.TreeNode, ptr %122, i32 0, i32 1
  %124 = load ptr, ptr %123, align 8
  %125 = getelementptr inbounds %struct.TreeNode, ptr %124, i32 0, i32 2
  %126 = load ptr, ptr %125, align 8
  call void @free(ptr %126) 
  %127 = load ptr, ptr %2, align 8
  %128 = getelementptr inbounds %struct.TreeNode, ptr %127, i32 0, i32 2
  %129 = load ptr, ptr %128, align 8
  %130 = getelementptr inbounds %struct.TreeNode, ptr %129, i32 0, i32 1
  %131 = load ptr, ptr %130, align 8
  call void @free(ptr %131) 
  %132 = load ptr, ptr %2, align 8
  %133 = getelementptr inbounds %struct.TreeNode, ptr %132, i32 0, i32 2
  %134 = load ptr, ptr %133, align 8
  %135 = getelementptr inbounds %struct.TreeNode, ptr %134, i32 0, i32 2
  %136 = load ptr, ptr %135, align 8
  call void @free(ptr %136) 
  %137 = load ptr, ptr %2, align 8
  %138 = getelementptr inbounds %struct.TreeNode, ptr %137, i32 0, i32 1
  %139 = load ptr, ptr %138, align 8
  call void @free(ptr %139) 
  %140 = load ptr, ptr %2, align 8
  %141 = getelementptr inbounds %struct.TreeNode, ptr %140, i32 0, i32 2
  %142 = load ptr, ptr %141, align 8
  call void @free(ptr %142) 
  %143 = load ptr, ptr %2, align 8
  call void @free(ptr %143) 
  ret i32 0
}

declare ptr @malloc(i64) 
declare i32 @printf(ptr, ...)
declare void @free(ptr)

