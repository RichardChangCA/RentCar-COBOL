       IDENTIFICATION DIVISION.
       PROGRAM-ID.打印.
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
       77 打印账单选项 PIC 99.
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
       DISPLAY 新屏幕.
       OPEN INPUT 账单.
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
       DISPLAY "输入账单号,选择打印的账单(退出输入0):" NO ADVANCING.
       ACCEPT 打印账单选项.
       IF 打印账单选项=0 THEN
       CLOSE 账单
       EXIT PROGRAM
       END-IF.
       MOVE 打印账单选项 TO 账单号.
       READ 账单 KEY IS 账单号.
       DISPLAY 新屏幕.
       DISPLAY "编号:    " NO ADVANCING 账单号.
       DISPLAY "顾客名称:" NO ADVANCING 账单顾客名称.
       DISPLAY "顾客号码:" NO ADVANCING 账单顾客号码.
       DISPLAY "车型:    " NO ADVANCING 账单车型.
       DISPLAY "车号:    " NO ADVANCING 账单车号.
       DISPLAY "车牌子:  " NO ADVANCING 账单车车牌子.
       DISPLAY "车标:    " NO ADVANCING 账单车车标.
       DISPLAY "车类型:  " NO ADVANCING 账单车类型.
       DISPLAY "车公里:  " NO ADVANCING 账单车公里.
       DISPLAY "日比率:  " NO ADVANCING 账单车日比率.
       DISPLAY "预定日:  " NO ADVANCING 账单预定日.
       DISPLAY "归还日:  " NO ADVANCING 账单归还日.
       DISPLAY "总天数:  " NO ADVANCING 总天数.
       DISPLAY "总金额:  " NO ADVANCING 总金额.
       DISPLAY SPACE.
       CLOSE 账单.
       DISPLAY "键入空格键退出...".
       STOP " ".
       EXIT PROGRAM.
