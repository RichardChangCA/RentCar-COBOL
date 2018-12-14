       IDENTIFICATION DIVISION.
       PROGRAM-ID.回车.
       AUTHOR.张凌峰20152649.
       ENVIRONMENT DIVISION.
       OBJECT SECTION.
       FILE-CONTROL.

        SELECT 预定 ASSIGN TO "预定.dat"
        ORGANIZATION IS INDEXED
        ACCESS IS DYNAMIC
        RECORD KEY IS 预定顾客号.

        SELECT 账单 ASSIGN TO "账单.dat"
        ORGANIZATION IS INDEXED
        ACCESS IS DYNAMIC
        RECORD KEY IS 账单号.

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
       77 还车号 PIC 99.
       01 是否结束 PIC 9.
        88 结束 VALUE 1.
        88 没结束 VALUE 0.
       77 今日日期 PIC B9(8).
       77 计算账单归还日 PIC 9(8).
       77 计算账单预定日 PIC 9(8).
       77 计算总天数 PIC 99.
       77 计算总金额 PIC 9(5).
       77 计算账单车日比率 PIC 999.
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
       SET 没结束 TO TRUE.
       OPEN I-O 预定.
       PERFORM UNTIL 结束
       READ 预定 NEXT RECORD
       AT END SET 结束 TO TRUE
       NOT AT END DISPLAY 预定记录
       END-READ
       END-PERFORM.
       DISPLAY SPACE.
       DISPLAY "选择还车的顾客(没有键入0)" NO ADVANCING.
       ACCEPT 还车号.
       IF 还车号=0 THEN
       CLOSE 预定
       EXIT PROGRAM
       END-IF.
       MOVE 还车号 TO 预定顾客号.
       READ 预定 KEY IS 预定顾客号.
       DISPLAY "输入今日日期(格式为八位数，例20160917)".
       ACCEPT 今日日期.
       MOVE 今日日期 TO 归还日.
       OPEN I-O 账单.
       MOVE 预定顾客号 TO 账单号.
       MOVE 预定顾客名称 TO 账单顾客名称.
       MOVE 预定顾客号码 TO 账单顾客号码.
       MOVE 预定车型 TO 账单车型.
       MOVE 预定车号 TO 账单车号.
       MOVE 预定车车牌子 TO 账单车车牌子.
       MOVE 预定车车标 TO 账单车车标.
       MOVE 预定车类型 TO 账单车类型.
       MOVE 预定车公里 TO 账单车公里.
       MOVE 预定车日比率 TO 账单车日比率.
       MOVE 预定日 TO 账单预定日.
       MOVE 归还日 TO 账单归还日.
       MOVE 账单归还日 TO 计算账单归还日.
       MOVE 账单预定日 TO 计算账单预定日.
       MOVE 账单车日比率 TO 计算账单车日比率.
       COMPUTE 计算总天数 = 计算账单归还日 - 计算账单预定日.
       COMPUTE 计算总金额 = 计算总天数 * 计算账单车日比率.
       MOVE 计算总天数 TO 总天数.
       MOVE 计算总金额 TO 总金额.
       DELETE 预定 RECORD.
       CLOSE 预定.
       WRITE 账单记录.
       CLOSE 账单.
       DISPLAY "回车成功!".
       DISPLAY SPACE.
       DISPLAY "...按任意键继续".
       STOP " ".
       EXIT PROGRAM.
