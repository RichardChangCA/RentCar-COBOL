       CLASS-ID.中车类 INHERITS FROM 汽车类.
       OBJECT SECTION.
       CLASS-CONTROL.
       中车类 IS CLASS "中车类"
       汽车类 IS CLASS "汽车类".
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
        SELECT 中车 ASSIGN TO "中车.dat"
        ORGANIZATION IS INDEXED
        ACCESS IS DYNAMIC
        RECORD KEY IS 中车号.
       DATA DIVISION.
       FILE SECTION.
       FD 中车.
       01 中车记录.
        05 中车号 PIC 9.
        05 中车车牌子 PIC BX(6).
        05 中车车标 PIC BX(10).
        05 中车类型 PIC BX(5).
        05 中车公里 PIC B9(6).
        05 中车日比率 PIC B999.

       METHOD-ID.创建中车文件并初始化.
       PROCEDURE DIVISION.
       OPEN OUTPUT 中车.
       MOVE 1 TO 中车号.
       MOVE "HDB232" TO 中车车牌子.
       MOVE "标致" TO 中车车标.
       MOVE "3008" TO 中车类型.
       MOVE 100 TO 中车公里.
       MOVE 400 TO 中车日比率.
       WRITE 中车记录.
       MOVE 2 TO 中车号.
       MOVE "KDN321" TO 中车车牌子.
       MOVE "别克" TO 中车车标.
       MOVE "GL8" TO 中车类型.
       MOVE 120 TO 中车公里.
       MOVE 700 TO 中车日比率.
       WRITE 中车记录.
       MOVE 3 TO 中车号.
       MOVE "BBS322" TO 中车车牌子.
       MOVE "丰田" TO 中车车标.
       MOVE "致炫" TO 中车类型.
       MOVE 100 TO 中车公里.
       MOVE 250 TO 中车日比率.
       WRITE 中车记录.
       CLOSE 中车.
       END METHOD 创建中车文件并初始化.
       METHOD-ID.调用中车方法.
       DATA DIVISION.
       LOCAL-STORAGE SECTION.
       01 判断-2 PIC 9.
        88 结束-2 VALUE 1.
        88 没结束-2 VALUE 0.
       PROCEDURE DIVISION.
       SET 没结束-2 TO TRUE.
       INVOKE SELF "打印标题".
       OPEN INPUT 中车.
       PERFORM UNTIL 结束-2
       READ 中车 NEXT RECORD
       AT END SET 结束-2 TO TRUE
       NOT AT END DISPLAY 中车记录
       END-PERFORM.
       CLOSE 中车.
       DISPLAY SPACE.
       DISPLAY "选择一辆你喜欢的车(没有则输入0）"NO ADVANCING.
       END METHOD 调用中车方法.
       END CLASS 中车类.

