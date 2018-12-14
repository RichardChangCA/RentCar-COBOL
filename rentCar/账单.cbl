       IDENTIFICATION DIVISION.
       PROGRAM-ID.账单.
       AUTHOR.张凌峰20152649.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

        SELECT 账单 ASSIGN TO "账单.dat"
        ORGANIZATION IS INDEXED
        ACCESS IS DYNAMIC
        RECORD KEY IS 账单号.

       DATA DIVISION.
       FILE SECTION.
       FD 账单.
       01 账单记录.
        05 账单号 PIC 99.
        05 账单顾客名称 PIC BX(10).
        05 账单顾客号码 PIC B9(4).
        05 账单车型 PIC BX(4).
        05 账单车号 PIC B9.
        05 账单车车牌子 PIC BX(6).
        05 账单车车标 PIC BX(10).
        05 账单车类型 PIC BX(5).
        05 账单车公里 PIC B9(6).
        05 账单车日比率 PIC B999.
        05 账单预定日 PIC B9(8).
        05 账单归还日 PIC B9(8).
        05 总天数 PIC B99.
        05 总金额 PIC B99999.

       WORKING-STORAGE SECTION.
       77 L PIC 9.
       01 是否结束 PIC 9.
        88 结束 VALUE 1.
        88 没结束 VALUE 0.

       SCREEN SECTION.
       01 新屏幕.
        05 BLANK SCREEN.
       01 账单标题.
        05 LINE L.
        05 COLUMN 1 VALUE "账单顾客号".
        05 COLUMN 12 VALUE "名称".
        05 COLUMN 17 VALUE "号码".
        05 COLUMN 22 VALUE "车型".
        05 COLUMN 26 VALUE "号".
        05 COLUMN 29 VALUE "牌".
        05 COLUMN 31 VALUE "标".
        05 COLUMN 34 VALUE "类型".
        05 COLUMN 39 VALUE "公里".
        05 COLUMN 44 VALUE "日比率".
        05 COLUMN 51 VALUE "借日".
        05 COLUMN 56 VALUE "归日".
        05 COLUMN 61 VALUE "总天数".
        05 COLUMN 68 VALUE "总金额".

       PROCEDURE DIVISION.
       OPEN INPUT 账单.
       DISPLAY 新屏幕.
       MOVE 1 TO L.
       DISPLAY 账单标题.
       DISPLAY SPACE.
       SET 没结束 TO TRUE.
       PERFORM UNTIL 结束
       READ 账单 NEXT RECORD
       AT END SET 结束 TO TRUE
       NOT AT END DISPLAY 账单记录
       END-READ
       END-PERFORM.
       CLOSE 账单.
       DISPLAY "输入任意键继续...".
       STOP " ".
       EXIT PROGRAM.

