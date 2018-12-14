       IDENTIFICATION DIVISION.
       PROGRAM-ID.预定.
       AUTHOR.张凌峰20152649.
       ENVIRONMENT DIVISION.
       OBJECT SECTION.
       CLASS-CONTROL.
        顾客类 IS CLASS "顾客类"
        菜单类 IS CLASS "菜单类"
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

        SELECT 小车 ASSIGN TO "小车.dat"
        ORGANIZATION IS INDEXED
        ACCESS IS DYNAMIC
        RECORD KEY IS 小车号.

        SELECT 中车 ASSIGN TO "中车.dat"
        ORGANIZATION IS INDEXED
        ACCESS IS DYNAMIC
        RECORD KEY IS 中车号.

        SELECT 大车 ASSIGN TO "大车.dat"
        ORGANIZATION IS INDEXED
        ACCESS IS DYNAMIC
        RECORD KEY IS 大车号.

        SELECT 贵车 ASSIGN TO "贵车.dat"
        ORGANIZATION IS INDEXED
        ACCESS IS DYNAMIC
        RECORD KEY IS 贵车号.

        SELECT 预定 ASSIGN TO "预定.dat"
        ORGANIZATION IS INDEXED
        ACCESS IS DYNAMIC
        RECORD KEY IS 预定顾客号.
       DATA DIVISION.
       FILE SECTION.
       FD 顾客.
       01 顾客记录.
        05 顾客号 PIC 99.
        05 顾客名称 PIC BX(10).
        05 顾客号码 PIC B9(4).
       FD 小车.
       01 小车记录.
        05 小车号 PIC 9.
        05 小车车牌子 PIC BX(6).
        05 小车车标 PIC BX(10).
        05 小车类型 PIC BX(5).
        05 小车公里 PIC B9(6).
        05 小车日比率 PIC B999.
       FD 中车.
       01 中车记录.
        05 中车号 PIC 9.
        05 中车车牌子 PIC BX(6).
        05 中车车标 PIC BX(10).
        05 中车类型 PIC BX(5).
        05 中车公里 PIC B9(6).
        05 中车日比率 PIC B999.
       FD 大车.
       01 大车记录.
        05 大车号 PIC 9.
        05 大车车牌子 PIC BX(6).
        05 大车车标 PIC BX(10).
        05 大车类型 PIC BX(5).
        05 大车公里 PIC B9(6).
        05 大车日比率 PIC B999.
       FD 贵车.
       01 贵车记录.
        05 贵车号 PIC 9.
        05 贵车车牌子 PIC BX(6).
        05 贵车车标 PIC BX(10).
        05 贵车类型 PIC BX(5).
        05 贵车公里 PIC B9(6).
        05 贵车日比率 PIC B999.
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
       77 选择-2 PIC 9.
       77 L PIC 9.
       77 测试预定日 PIC 9(8).
       77 测试归还日 PIC 9(8).
       01 是否结束 PIC 9.
        88 结束 VALUE 1.
        88 没结束 VALUE 0.
       01 小车对象 OBJECT REFERENCE.
       01 中车对象 OBJECT REFERENCE.
       01 大车对象 OBJECT REFERENCE.
       01 贵车对象 OBJECT REFERENCE.
       77 小车选号 PIC 9.
       77 中车选号 PIC 9.
       77 大车选号 PIC 9.
       77 贵车选号 PIC 9.
       77 测试车类型 PIC BX(5).
       77 返回的顾客号 PIC 99.
       LINKAGE SECTION.
       01 顾客对象 OBJECT REFERENCE.
       01 菜单对象 OBJECT REFERENCE.
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
       PROCEDURE DIVISION USING 菜单对象 顾客对象.
       INVOKE 顾客对象 "输入顾客信息" RETURNING 返回的顾客号.
       OPEN INPUT 顾客.
       MOVE 返回的顾客号 TO 顾客号.
       READ 顾客 KEY IS 顾客号.
       车程序.
       INVOKE 菜单对象 "菜单-2" RETURNING 选择-2.
       EVALUATE 选择-2
       WHEN 1 PERFORM 读小车文件
       WHEN 2 PERFORM 读中车文件
       WHEN 3 PERFORM 读大车文件
       WHEN 4 PERFORM 读贵车文件
       WHEN OTHER
       CLOSE 顾客
       EXIT PROGRAM
       END-EVALUATE.
       改变日期.
       DISPLAY 新屏幕.
       OPEN INPUT 预定.
       SET 没结束 TO TRUE.
       MOVE 1 TO L.
       DISPLAY 预定标题.
       DISPLAY SPACE.
       PERFORM UNTIL 结束
       READ 预定 NEXT RECORD
       AT END SET 结束 TO TRUE
       NOT AT END
       DISPLAY 预定记录
       END-READ
       END-PERFORM
       DISPLAY SPACE.
       DISPLAY "确定预定日(格式为八位数，例20160917，取消键入0)"
       ACCEPT 测试预定日.
       IF 测试预定日=0 THEN
       CLOSE 预定
       EXIT PROGRAM
       END-IF.
       DISPLAY SPACE.
       DISPLAY "确定归还日(格式为八位数，例20160917，取消键入0)".
       ACCEPT 测试归还日.
       IF 测试归还日=0
       THEN CLOSE 预定
       EXIT PROGRAM
       END-IF.
       IF 测试预定日>测试归还日
       THEN DISPLAY "日期输入错误"
            DISPLAY "键入回车键重新输入日期"
            STOP " "
            CLOSE 预定
            GO TO 改变日期
       END-IF.
       CLOSE 预定.
       读预定文件.
       OPEN INPUT 预定.
       SET 没结束 TO TRUE.
       PERFORM UNTIL 结束
       READ 预定 NEXT RECORD
       AT END SET 结束 TO TRUE
       NOT AT END
       IF 测试车类型 = 预定车类型
       THEN PERFORM 车型匹配
       ELSE CONTINUE
       END-IF
       END-READ
       END-PERFORM.
       CLOSE 预定.
       OPEN I-O 预定.
       MOVE 顾客号 TO 预定顾客号.
       MOVE 顾客名称 TO 预定顾客名称.
       MOVE 顾客号码 TO 预定顾客号码.
       CLOSE 顾客.
       MOVE 测试预定日 TO 预定日.
       MOVE 测试归还日 TO 归还日.
       EVALUATE 选择-2
       WHEN 1 PERFORM 传送小车文件
       WHEN 2 PERFORM 传送中车文件
       WHEN 3 PERFORM 传送大车文件
       WHEN 4 PERFORM 传送贵车文件
       END-EVALUATE.
       WRITE 预定记录.
       CLOSE 预定.
       OPEN INPUT 预定.
       DISPLAY 新屏幕.
       DISPLAY "预定成功!".
       MOVE 3 TO L.
       DISPLAY 预定标题.
       DISPLAY SPACE.
       SET 没结束 TO TRUE.
       PERFORM UNTIL 结束
       READ 预定 NEXT RECORD
       AT END SET 结束 TO TRUE
       NOT AT END DISPLAY 预定记录
       END-READ
       END-PERFORM
       DISPLAY "...输入回车键继续".
       STOP " ".
       CLOSE 预定.
       EXIT PROGRAM.

       车型匹配.
       IF (测试归还日 < 预定日) OR (测试预定日 > 归还日)
       THEN CONTINUE
       ELSE DISPLAY "此日期内无车,按回车键改变日期"
            STOP " "
            CLOSE 预定
            GO TO 改变日期
       END-IF.


       读小车文件.
       INVOKE 小车类 "NEW" RETURNING 小车对象.
       INVOKE 小车对象 "调用小车方法".
       ACCEPT 小车选号.
       IF 小车选号 IS ZERO
       THEN GO TO 车程序.
       OPEN INPUT 小车.
       MOVE 小车选号 TO 小车号.
       READ 小车 KEY IS 小车号.
       MOVE 小车类型 TO 测试车类型.
       CLOSE 小车.

       传送小车文件.
       MOVE "小车" TO 预定车型.
       MOVE 小车选号 TO 小车号.
       OPEN INPUT 小车.
       READ 小车 KEY IS 小车号.
       MOVE 小车号 TO 预定车号.
       MOVE 小车车牌子 TO 预定车车牌子.
       MOVE 小车车标 TO 预定车车标.
       MOVE 小车类型 TO 预定车类型.
       MOVE 小车公里 TO 预定车公里.
       MOVE 小车日比率 TO 预定车日比率.
       CLOSE 小车.

       读中车文件.
       INVOKE 中车类 "NEW" RETURNING 中车对象.
       INVOKE 中车对象 "调用中车方法".
       ACCEPT 中车选号.
       IF 中车选号 IS ZERO
       THEN GO TO 车程序.
       MOVE 中车选号 TO 中车号.
       OPEN INPUT 中车.
       READ 中车 KEY IS 中车号.
       MOVE 中车类型 TO 测试车类型.
       CLOSE 中车.

       传送中车文件.
       MOVE "中车" TO 预定车型.
       MOVE 中车选号 TO 中车号.
       OPEN INPUT 中车.
       READ 中车 KEY IS 中车号.
       MOVE 中车号 TO 预定车号.
       MOVE 中车车牌子 TO 预定车车牌子.
       MOVE 中车车标 TO 预定车车标.
       MOVE 中车类型 TO 预定车类型.
       MOVE 中车公里 TO 预定车公里.
       MOVE 中车日比率 TO 预定车日比率.
       CLOSE 中车.

       读大车文件.
       INVOKE 大车类 "NEW" RETURNING 大车对象.
       INVOKE 大车对象 "调用大车方法".
       ACCEPT 大车选号.
       IF 大车选号 IS ZERO
       THEN GO TO 车程序.
       MOVE 大车选号 TO 大车号.
       OPEN INPUT 大车.
       READ 大车 KEY IS 大车号.
       MOVE 大车类型 TO 测试车类型.
       CLOSE 大车.

       传送大车文件.
       MOVE "大车" TO 预定车型.
       MOVE 大车选号 TO 大车号.
       OPEN INPUT 大车.
       READ 大车 KEY IS 大车号.
       MOVE 大车号 TO 预定车号.
       MOVE 大车车牌子 TO 预定车车牌子.
       MOVE 大车车标 TO 预定车车标.
       MOVE 大车类型 TO 预定车类型.
       MOVE 大车公里 TO 预定车公里.
       MOVE 大车日比率 TO 预定车日比率.
       CLOSE 大车.

       读贵车文件.
       INVOKE 贵车类 "NEW" RETURNING 贵车对象.
       INVOKE 贵车对象 "调用贵车方法".
       ACCEPT 贵车选号.
       IF 贵车选号 IS ZERO
       THEN GO TO 车程序.
       MOVE 贵车选号 TO 贵车号.
       OPEN INPUT 贵车.
       READ 贵车 KEY IS 贵车号.
       MOVE 贵车类型 TO 测试车类型.
       CLOSE 贵车.

       传送贵车文件.
       MOVE "贵车" TO 预定车型.
       MOVE 贵车选号 TO 贵车号.
       OPEN INPUT 贵车.
       READ 贵车 KEY IS 贵车号.
       MOVE 贵车号 TO 预定车号.
       MOVE 贵车车牌子 TO 预定车车牌子.
       MOVE 贵车车标 TO 预定车车标.
       MOVE 贵车类型 TO 预定车类型.
       MOVE 贵车公里 TO 预定车公里.
       MOVE 贵车日比率 TO 预定车日比率.
       CLOSE 贵车.
