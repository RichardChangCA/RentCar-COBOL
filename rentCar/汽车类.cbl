       CLASS-ID.汽车类 INHERITS FROM BASE.
       CLASS-CONTROL.
       汽车类 IS CLASS "汽车类".
       METHOD-ID.打印标题.
       LOCAL-STORAGE SECTION.
       77 L PIC 9.
       SCREEN SECTION.
       01 新屏幕.
        05 BLANK SCREEN.
       01 输入标题.
        05 LINE L.
        05 COLUMN 1 VALUE "号".
        05 COLUMN 3 VALUE "|车牌子".
        05 COLUMN 11 VALUE "|车标".
        05 COLUMN 17 VALUE "|车类型".
        05 COLUMN 25 VALUE "|车公里".
        05 COLUMN 33 VALUE "|日比率".
       PROCEDURE DIVISION.
       DISPLAY 新屏幕.
       MOVE 1 TO L.
       DISPLAY 输入标题.
       DISPLAY SPACE.
       END METHOD 打印标题.
       END CLASS 汽车类.
