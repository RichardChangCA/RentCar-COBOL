       CLASS-ID.大车类 INHERITS FROM 汽车类.
       OBJECT SECTION.
       CLASS-CONTROL.
       大车类 IS CLASS "大车类"
       汽车类 IS CLASS "汽车类".
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
        SELECT 大车 ASSIGN TO "大车.dat"
        ORGANIZATION IS INDEXED
        ACCESS IS DYNAMIC
        RECORD KEY IS 大车号.
       DATA DIVISION.
       FILE SECTION.
       FD 大车.
       01 大车记录.
        05 大车号 PIC 9.
        05 大车车牌子 PIC BX(6).
        05 大车车标 PIC BX(10).
        05 大车类型 PIC BX(5).
        05 大车公里 PIC B9(6).
        05 大车日比率 PIC B999.

       METHOD-ID.创建大车文件并初始化.
       PROCEDURE DIVISION.
       OPEN OUTPUT 大车.
       MOVE 1 TO 大车号.
       MOVE "AAA245" TO 大车车牌子.
       MOVE "一汽" TO 大车车标.
       MOVE "货车" TO 大车类型.
       MOVE 80 TO 大车公里.
       MOVE 100 TO 大车日比率.
       WRITE 大车记录.
       MOVE 2 TO 大车号.
       MOVE "AAB366" TO 大车车牌子.
       MOVE "长安" TO 大车车标.
       MOVE "货车" TO 大车类型.
       MOVE 90 TO 大车公里.
       MOVE 110 TO 大车日比率.
       WRITE 大车记录.
       CLOSE 大车.
       END METHOD 创建大车文件并初始化.
       METHOD-ID.调用大车方法.
       DATA DIVISION.
       LOCAL-STORAGE SECTION.
       01 判断-2 PIC 9.
        88 结束-2 VALUE 1.
        88 没结束-2 VALUE 0.
       PROCEDURE DIVISION.
       SET 没结束-2 TO TRUE.
       INVOKE SELF "打印标题".
       OPEN INPUT 大车.
       PERFORM UNTIL 结束-2
       READ 大车 NEXT RECORD
       AT END SET 结束-2 TO TRUE
       NOT AT END DISPLAY 大车记录
       END-PERFORM.
       CLOSE 大车.
       DISPLAY SPACE.
       DISPLAY "选择一辆你喜欢的车(没有则输入0）"NO ADVANCING.
       END METHOD 调用大车方法.
       END CLASS 大车类.

