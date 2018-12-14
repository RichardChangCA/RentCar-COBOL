       CLASS-ID.顾客类 INHERITS FROM BASE.

       CLASS-CONTROL.
       顾客类 IS CLASS "顾客类".

       OBJECT.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
        SELECT 顾客 ASSIGN TO "顾客.dat"
        ORGANIZATION IS INDEXED
        ACCESS IS DYNAMIC
        RECORD KEY IS 顾客号.

       DATA DIVISION.
       FILE SECTION.
       FD 顾客.
       01 顾客记录.
        05 顾客号 PIC 99.
        05 顾客名称 PIC BX(10).
        05 顾客号码 PIC B9(4).

       METHOD-ID.创建顾客文件.
       PROCEDURE DIVISION.
       OPEN OUTPUT 顾客.
       CLOSE 顾客.
       END METHOD 创建顾客文件.

       METHOD-ID.输入顾客信息.
       DATA DIVISION.
       LOCAL-STORAGE SECTION.
       01 是否结束 PIC 9.
        88 结束 VALUE 1.
        88 没结束 VALUE 0.
       77 假设顾客号 PIC 99.
       77 L PIC 9.
       LINKAGE SECTION.
       77 返回的顾客号 PIC 99.
       SCREEN SECTION.
       01 新屏幕.
        05 BLANK SCREEN.
       01 输入标题.
        05 LINE L.
        05 COLUMN 1 VALUE "号.".
        05 COLUMN 4 VALUE "名称.".
        05 COLUMN 15 VALUE "号码.".
       01 加记录.
        05 LINE L.
      * 05 COLUMN 6 PIC 99 TO 顾客号.
        05 COLUMN 4 PIC X(10) TO 顾客名称.
        05 COLUMN 14 PIC 9(4) TO 顾客号码.
       PROCEDURE DIVISION RETURNING 返回的顾客号.
       OPEN INPUT 顾客.
       MOVE 1 TO 假设顾客号.
       SET 没结束 TO TRUE.
       PERFORM UNTIL 结束
       READ 顾客 NEXT RECORD
       AT END SET 结束 TO TRUE
       NOT AT END IF 假设顾客号 <= 顾客号
                  THEN COMPUTE 假设顾客号 = 顾客号 + 1
                  END-IF
       END-READ
       END-PERFORM
       CLOSE 顾客.
       OPEN I-O 顾客.
       MOVE 2 TO L.
       DISPLAY 新屏幕.
       DISPLAY "输入顾客信息(输入完一项后按右键)".
       DISPLAY 输入标题.
       DISPLAY SPACE.
       MOVE 假设顾客号 TO 顾客号.
       DISPLAY 顾客号.
       MOVE 3 TO L.
       ACCEPT 加记录.
       DISPLAY SPACE.
       MOVE 顾客号 TO 返回的顾客号.
       WRITE 顾客记录.
       CLOSE 顾客.
       END METHOD 输入顾客信息.

       END OBJECT.

       END CLASS 顾客类.
