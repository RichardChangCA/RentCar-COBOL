       CLASS-ID. �˵��� INHERITS FROM BASE.
       CLASS-CONTROL.
       �˵��� IS CLASS "�˵���".
       OBJECT.
       OBJECT-STORAGE SECTION.
        78 ������ VALUE "----------".

       METHOD-ID.�˵�.

       DATA DIVISION.
       LINKAGE SECTION.
       77 ѡ�� PIC 9.
       SCREEN SECTION.
        01 ����Ļ.
         05 BLANK SCREEN
          FOREGROUND-COLOR 4
          BACKGROUND-COLOR 7.

       PROCEDURE DIVISION RETURNING ѡ��.
       DISPLAY ����Ļ.
       DISPLAY ������.
       DISPLAY "1��Ԥ����".
       DISPLAY SPACE.
       DISPLAY "2���⳵".
       DISPLAY SPACE.
       DISPLAY "3���س�".
       DISPLAY SPACE.
       DISPLAY "4���˵�".
       DISPLAY SPACE.
       DISPLAY "5����ӡ�˵�".
       DISPLAY SPACE.
       DISPLAY "0������".
       DISPLAY ������.
       DISPLAY SPACE.
       DISPLAY "�������ѡ��"NO ADVANCING.
       ACCEPT ѡ��.
       END METHOD �˵�.

       METHOD-ID.�˵�-2.
       DATA DIVISION.
       LINKAGE SECTION.
       77 ѡ��-2 PIC 9.
       SCREEN SECTION.
       01 ����Ļ.
        05 BLANK SCREEN.
       PROCEDURE DIVISION RETURNING ѡ��-2.
       DISPLAY ����Ļ.
       DISPLAY ������.
       DISPLAY "1��С��".
       DISPLAY SPACE.
       DISPLAY "2���г�".
       DISPLAY SPACE.
       DISPLAY "3����".
       DISPLAY SPACE.
       DISPLAY "4����".
       DISPLAY SPACE.
       DISPLAY "0���˳�".
       DISPLAY ������.
       DISPLAY SPACE.
       DISPLAY "�������ѡ��:".
       ACCEPT ѡ��-2.
       END METHOD �˵�-2.


       END OBJECT.

       END CLASS �˵���.
