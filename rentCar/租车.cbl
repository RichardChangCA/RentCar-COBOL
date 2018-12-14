       IDENTIFICATION DIVISION.
       PROGRAM-ID.租车.
       AUTHOR.张凌峰20152649.
       ENVIRONMENT DIVISION.
       FILE-CONTROL.
        SELECT 预定 ASSIGN TO "预定.dat"
        ORGANIZATION IS INDEXED
        ACCESS IS DYNAMIC
        RECORD KEY IS 预定顾客号.
       DATA DIVISION.

       FILE SECTION.
       FD 预定.
       01 预定记录.
        05 预定顾客号 PIC 99.
        05 预定顾客名称 PIC BX(10).
        05 预定顾客号码 PIC B9(4).
        05 预定车型 PIC BX(4).
        05 预定车号 PIC B9.
        05 预定车车牌子 PIC BX(6).
        05 预定车车标 PIC BX(10).
        05 预定车类型 PIC BX(5).
        05 预定车公里 PIC B9(6).
        05 预定车日比率 PIC B999.
        05 预定日 PIC B9(8).
        05 归还日 PIC B9(8).
       WORKING-STORAGE SECTION.
       77 L PIC 9.
       77 租车号 PIC 99.
       01 是否结束 PIC 9.
        88 没结束 VALUE 1.
        88 结束 VALUE 0.
       77 判断日期 PIC B9(8).
       SCREEN SECTION.
       01 新屏幕.
        05 BLANK SCREEN.
       01 预定标题.
        05 LINE L.
        05 COLUMN 1 VALUE "预定顾客号".
        05 COLUMN 12 VALUE "名称".
        05 COLUMN 22 VALUE "号码".
        05 COLUMN 26 VALUE "车型".
        05 COLUMN 31 VALUE "号".
        05 COLUMN 34 VALUE "牌".
        05 COLUMN 40 VALUE "标".
        05 COLUMN 44 VALUE "类型".
        05 COLUMN 50 VALUE "公里".
        05 COLUMN 56 VALUE "日比率".
        05 COLUMN 63 VALUE "借日".
        05 COLUMN 71 VALUE "归日".
       PROCEDURE DIVISION.
       DISPLAY 新屏幕.
       MOVE 1 TO L.
       DISPLAY 预定标题.
       DISPLAY SPACE.
       OPEN I-O 预定.
       SET 没结束 TO TRUE.
       PERFORM UNTIL 结束
       READ 预定 NEXT RECORD
       AT END SET 结束 TO TRUE
       NOT AT END DISPLAY 预定记录
       END-READ
       END-PERFORM
       DISPLAY SPACE.
       DISPLAY "输入租车顾客的预定顾客号(没有输入0):" NO ADVANCING.
       ACCEPT 租车号.
       IF 租车号=0 THEN
       CLOSE 预定
       EXIT PROGRAM
       END-IF
       MOVE 租车号 TO 预定顾客号.
       READ 预定 KEY IS 预定顾客号.
       DISPLAY 预定记录.
       DISPLAY SPACE.
       DISPLAY "输入今天的日期(格式为八位数年月日,例20160917)".
       ACCEPT 判断日期.
       IF 判断日期<预定日
       THEN DISPLAY "未到租车日期，租车失败!".
       IF 判断日期>=预定日 AND <=归还日
       THEN DISPLAY "租车成功!"
            MOVE 判断日期 TO 预定日.
       IF 判断日期>归还日
       THEN DISPLAY "租车账单已过期!"
            DELETE 预定 RECORD.
       CLOSE 预定.
       DISPLAY "...按任意键继续".
       STOP " ".
       EXIT PROGRAM.

