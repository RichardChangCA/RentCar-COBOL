       CLASS-ID.������ INHERITS FROM BASE.
       CLASS-CONTROL.
       ������ IS CLASS "������".
       METHOD-ID.��ӡ����.
       LOCAL-STORAGE SECTION.
       77 L PIC 9.
       SCREEN SECTION.
       01 ����Ļ.
        05 BLANK SCREEN.
       01 �������.
        05 LINE L.
        05 COLUMN 1 VALUE "��".
        05 COLUMN 3 VALUE "|������".
        05 COLUMN 11 VALUE "|����".
        05 COLUMN 17 VALUE "|������".
        05 COLUMN 25 VALUE "|������".
        05 COLUMN 33 VALUE "|�ձ���".
       PROCEDURE DIVISION.
       DISPLAY ����Ļ.
       MOVE 1 TO L.
       DISPLAY �������.
       DISPLAY SPACE.
       END METHOD ��ӡ����.
       END CLASS ������.
