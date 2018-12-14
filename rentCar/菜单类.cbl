       CLASS-ID. 菜单类 INHERITS FROM BASE.
       CLASS-CONTROL.
       菜单类 IS CLASS "菜单类".
       OBJECT.
       OBJECT-STORAGE SECTION.
        78 隔离线 VALUE "----------".

       METHOD-ID.菜单.

       DATA DIVISION.
       LINKAGE SECTION.
       77 选择 PIC 9.
       SCREEN SECTION.
        01 新屏幕.
         05 BLANK SCREEN
          FOREGROUND-COLOR 4
          BACKGROUND-COLOR 7.

       PROCEDURE DIVISION RETURNING 选择.
       DISPLAY 新屏幕.
       DISPLAY 隔离线.
       DISPLAY "1、预定车".
       DISPLAY SPACE.
       DISPLAY "2、租车".
       DISPLAY SPACE.
       DISPLAY "3、回车".
       DISPLAY SPACE.
       DISPLAY "4、账单".
       DISPLAY SPACE.
       DISPLAY "5、打印账单".
       DISPLAY SPACE.
       DISPLAY "0、出口".
       DISPLAY 隔离线.
       DISPLAY SPACE.
       DISPLAY "输入你的选择："NO ADVANCING.
       ACCEPT 选择.
       END METHOD 菜单.

       METHOD-ID.菜单-2.
       DATA DIVISION.
       LINKAGE SECTION.
       77 选择-2 PIC 9.
       SCREEN SECTION.
       01 新屏幕.
        05 BLANK SCREEN.
       PROCEDURE DIVISION RETURNING 选择-2.
       DISPLAY 新屏幕.
       DISPLAY 隔离线.
       DISPLAY "1、小车".
       DISPLAY SPACE.
       DISPLAY "2、中车".
       DISPLAY SPACE.
       DISPLAY "3、大车".
       DISPLAY SPACE.
       DISPLAY "4、贵车".
       DISPLAY SPACE.
       DISPLAY "0、退出".
       DISPLAY 隔离线.
       DISPLAY SPACE.
       DISPLAY "输入你的选择:".
       ACCEPT 选择-2.
       END METHOD 菜单-2.


       END OBJECT.

       END CLASS 菜单类.
