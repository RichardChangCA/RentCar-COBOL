       IDENTIFICATION DIVISION.
       PROGRAM-ID.租用汽车.
       AUTHOR.张凌峰20152649.
       ENVIRONMENT DIVISION.
       OBJECT SECTION.
       CLASS-CONTROL.
        菜单类 IS CLASS "菜单类"
        顾客类 IS CLASS "顾客类"
        小车类 IS CLASS "小车类"
        中车类 IS CLASS "中车类"
        大车类 IS CLASS "大车类"
        贵车类 IS CLASS "贵车类".
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
        SELECT 顾客 ASSIGN TO "顾客.dat"
        ORGANIZATION IS INDEXED
        ACCESS IS DYNAMIC
        RECORD KEY IS 顾客号.

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
       FD 顾客.
       01 顾客记录.
        05 顾客号 PIC 99.
        05 顾客名称 PIC BX(10).
        05 顾客号码 PIC B9(4).
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
       01 有顾客吗 PIC 9.
        88 无顾客 VALUE ZERO.
        88 有顾客 VALUE 1.
       77 L PIC 9.
       77 选择 PIC 9.
       77 顾客需求 PIC 9.
       01 菜单对象 OBJECT REFERENCE.
       01 顾客对象 OBJECT REFERENCE.
       01 小车对象 OBJECT REFERENCE.
       01 中车对象 OBJECT REFERENCE.
       01 大车对象 OBJECT REFERENCE.
       01 贵车对象 OBJECT REFERENCE.
       77 新文件请求 PIC 9.

       SCREEN SECTION.
       01 新屏幕.
        05 BLANK SCREEN
           FOREGROUND-COLOR 4
           BACKGROUND-COLOR 7.

       PROCEDURE DIVISION.
       INVOKE 顾客类 "NEW" RETURNING 顾客对象.
       INVOKE 小车类 "NEW" RETURNING 小车对象.
       INVOKE 中车类 "NEW" RETURNING 中车对象.
       INVOKE 大车类 "NEW" RETURNING 大车对象.
       INVOKE 贵车类 "NEW" RETURNING 贵车对象.
       DISPLAY 新屏幕.
       DISPLAY "是否需要创建新文件(需要则输入1)".
       ACCEPT 新文件请求.
       EVALUATE 新文件请求
       WHEN 1 PERFORM 创建新文件
       WHEN OTHER CONTINUE
       END-EVALUATE
       SET 有顾客 TO TRUE.
       PERFORM UNTIL 无顾客
       DISPLAY 新屏幕
       DISPLAY "有需要进行的任务吗？（有则输入1）"
       ACCEPT 顾客需求
       EVALUATE 顾客需求
       WHEN 1 PERFORM 执行
       WHEN OTHER SET 无顾客 TO TRUE
       END-EVALUATE.
       DISPLAY "程序已结束".
       STOP RUN.

       创建新文件.
       OPEN OUTPUT 预定.
       CLOSE 预定.
       OPEN OUTPUT 账单.
       CLOSE 账单.
       INVOKE 顾客对象 "创建顾客文件".
       INVOKE 小车对象 "创建小车文件并初始化".
       INVOKE 中车对象 "创建中车文件并初始化".
       INVOKE 大车对象 "创建大车文件并初始化".
       INVOKE 贵车对象 "创建贵车文件并初始化".

       执行.
       INVOKE 菜单类 "NEW" RETURNING 菜单对象.
       MOVE 1 TO 选择.
       PERFORM UNTIL 选择 IS ZERO
       INVOKE 菜单对象 "菜单" RETURNING 选择
       EVALUATE 选择
       WHEN 1 CALL "预定" USING 菜单对象 顾客对象
       WHEN 2 CALL "租车"
       WHEN 3 CALL "回车"
       WHEN 4 CALL "账单"
       WHEN 5 CALL "打印"
       WHEN OTHER MOVE ZERO TO 选择
       END-EVALUATE
       END-PERFORM.
