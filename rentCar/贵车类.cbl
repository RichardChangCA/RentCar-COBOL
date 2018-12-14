       CLASS-ID.贵车类 INHERITS FROM 汽车类.
       OBJECT SECTION.
       CLASS-CONTROL.
       贵车类 IS CLASS "贵车类"
       汽车类 IS CLASS "汽车类".
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
        SELECT 贵车 ASSIGN TO "贵车.dat"
        ORGANIZATION IS INDEXED
        ACCESS IS DYNAMIC
        RECORD KEY IS 贵车号.
       DATA DIVISION.
       FILE SECTION.
       FD 贵车.
       01 贵车记录.
        05 贵车号 PIC 9.
        05 贵车车牌子 PIC BX(6).
        05 贵车车标 PIC BX(10).
        05 贵车类型 PIC BX(5).
        05 贵车公里 PIC B9(6).
        05 贵车日比率 PIC B999.

       METHOD-ID.创建贵车文件并初始化.
       PROCEDURE DIVISION.
       OPEN OUTPUT 贵车.
       MOVE 1 TO 贵车号.
       MOVE "LBG222" TO 贵车车牌子.
       MOVE "奔驰" TO 贵车车标.
       MOVE "c级" TO 贵车类型.
       MOVE 200 TO 贵车公里.
       MOVE 999 TO 贵车日比率.
       WRITE 贵车记录.
       MOVE 2 TO 贵车号.
       MOVE "HML233" TO 贵车车牌子.
       MOVE "悍马" TO 贵车车标.
       MOVE "H6" TO 贵车类型.
       MOVE 150 TO 贵车公里.
       MOVE 699 TO 贵车日比率.
       WRITE 贵车记录.
       MOVE 3 TO 贵车号.
       MOVE "LSL332" TO 贵车车牌子.
       MOVE "宝马" TO 贵车车标.
       MOVE "X5" TO 贵车类型.
       MOVE 300 TO 贵车公里.
       MOVE 799 TO 贵车日比率.
       WRITE 贵车记录.
       MOVE 4 TO 贵车号.
       MOVE "LHH215" TO 贵车车牌子.
       MOVE "路虎" TO 贵车车标.
       MOVE "揽胜" TO 贵车类型.
       MOVE 210 TO 贵车公里.
       MOVE 799 TO 贵车日比率.
       WRITE 贵车记录.
       CLOSE 贵车.
       END METHOD 创建贵车文件并初始化.

       METHOD-ID.调用贵车方法.
       DATA DIVISION.
       LOCAL-STORAGE SECTION.
       01 判断-2 PIC 9.
        88 结束-2 VALUE 1.
        88 没结束-2 VALUE 0.
       PROCEDURE DIVISION.
       SET 没结束-2 TO TRUE.
       INVOKE SELF "打印标题".
       OPEN INPUT 贵车.
       PERFORM UNTIL 结束-2
       READ 贵车 NEXT RECORD
       AT END SET 结束-2 TO TRUE
       NOT AT END DISPLAY 贵车记录
       END-PERFORM.
       CLOSE 贵车.
       DISPLAY SPACE.
       DISPLAY "选择一辆你喜欢的车(没有则输入0）"NO ADVANCING.
       END METHOD 调用贵车方法.
       END CLASS 贵车类.

