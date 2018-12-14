       CLASS-ID.小车类 INHERITS FROM 汽车类.
       OBJECT SECTION.
       CLASS-CONTROL.
       小车类 IS CLASS "小车类"
       汽车类 IS CLASS "汽车类".
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
        SELECT 小车 ASSIGN TO "小车.dat"
        ORGANIZATION IS INDEXED
        ACCESS IS DYNAMIC
        RECORD KEY IS 小车号.
       DATA DIVISION.
       FILE SECTION.
       FD 小车.
       01 小车记录.
        05 小车号 PIC 9.
        05 小车车牌子 PIC BX(6).
        05 小车车标 PIC BX(10).
        05 小车类型 PIC BX(5).
        05 小车公里 PIC B9(6).
        05 小车日比率 PIC B999.

       METHOD-ID.创建小车文件并初始化.
       PROCEDURE DIVISION.
       OPEN OUTPUT 小车.
       MOVE 1 TO 小车号.
       MOVE "ABC123" TO 小车车牌子.
       MOVE "北京现代" TO 小车车标.
       MOVE "悦动" TO 小车类型.
       MOVE 135 TO 小车公里.
       MOVE 300 TO 小车日比率.
       WRITE 小车记录.
       MOVE 2 TO 小车号.
       MOVE "ABD426" TO 小车车牌子.
       MOVE "上海大众" TO 小车车标.
       MOVE "POLO" TO 小车类型.
       MOVE 80 TO 小车公里.
       MOVE 220 TO 小车日比率.
       WRITE 小车记录.
       MOVE 3 TO 小车号.
       MOVE "ACC694" TO 小车车牌子.
       MOVE "北京现代" TO 小车车标.
       MOVE "瑞纳" TO 小车类型.
       MOVE 180 TO 小车公里.
       MOVE 240 TO 小车日比率.
       WRITE 小车记录.
       CLOSE 小车.
       END METHOD 创建小车文件并初始化.

       METHOD-ID.调用小车方法.
       DATA DIVISION.
       LOCAL-STORAGE SECTION.
       01 判断-2 PIC 9.
        88 结束-2 VALUE 1.
        88 没结束-2 VALUE 0.
       PROCEDURE DIVISION.
       SET 没结束-2 TO TRUE.
       INVOKE SELF "打印标题".
       OPEN INPUT 小车.
       PERFORM UNTIL 结束-2
       READ 小车 NEXT RECORD
       AT END SET 结束-2 TO TRUE
       NOT AT END DISPLAY 小车记录
       END-PERFORM.
       CLOSE 小车.
       DISPLAY SPACE.
       DISPLAY "选择一辆你喜欢的车(没有则输入0）"NO ADVANCING.
       END METHOD 调用小车方法.
       END CLASS 小车类.
