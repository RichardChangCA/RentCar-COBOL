       CLASS-ID.�г��� INHERITS FROM ������.
       OBJECT SECTION.
       CLASS-CONTROL.
       �г��� IS CLASS "�г���"
       ������ IS CLASS "������".
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
        SELECT �г� ASSIGN TO "�г�.dat"
        ORGANIZATION IS INDEXED
        ACCESS IS DYNAMIC
        RECORD KEY IS �г���.
       DATA DIVISION.
       FILE SECTION.
       FD �г�.
       01 �г���¼.
        05 �г��� PIC 9.
        05 �г������� PIC BX(6).
        05 �г����� PIC BX(10).
        05 �г����� PIC BX(5).
        05 �г����� PIC B9(6).
        05 �г��ձ��� PIC B999.

       METHOD-ID.�����г��ļ�����ʼ��.
       PROCEDURE DIVISION.
       OPEN OUTPUT �г�.
       MOVE 1 TO �г���.
       MOVE "HDB232" TO �г�������.
       MOVE "����" TO �г�����.
       MOVE "3008" TO �г�����.
       MOVE 100 TO �г�����.
       MOVE 400 TO �г��ձ���.
       WRITE �г���¼.
       MOVE 2 TO �г���.
       MOVE "KDN321" TO �г�������.
       MOVE "���" TO �г�����.
       MOVE "GL8" TO �г�����.
       MOVE 120 TO �г�����.
       MOVE 700 TO �г��ձ���.
       WRITE �г���¼.
       MOVE 3 TO �г���.
       MOVE "BBS322" TO �г�������.
       MOVE "����" TO �г�����.
       MOVE "����" TO �г�����.
       MOVE 100 TO �г�����.
       MOVE 250 TO �г��ձ���.
       WRITE �г���¼.
       CLOSE �г�.
       END METHOD �����г��ļ�����ʼ��.
       METHOD-ID.�����г�����.
       DATA DIVISION.
       LOCAL-STORAGE SECTION.
       01 �ж�-2 PIC 9.
        88 ����-2 VALUE 1.
        88 û����-2 VALUE 0.
       PROCEDURE DIVISION.
       SET û����-2 TO TRUE.
       INVOKE SELF "��ӡ����".
       OPEN INPUT �г�.
       PERFORM UNTIL ����-2
       READ �г� NEXT RECORD
       AT END SET ����-2 TO TRUE
       NOT AT END DISPLAY �г���¼
       END-PERFORM.
       CLOSE �г�.
       DISPLAY SPACE.
       DISPLAY "ѡ��һ����ϲ���ĳ�(û��������0��"NO ADVANCING.
       END METHOD �����г�����.
       END CLASS �г���.

