       CLASS-ID.���� INHERITS FROM ������.
       OBJECT SECTION.
       CLASS-CONTROL.
       ���� IS CLASS "����"
       ������ IS CLASS "������".
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
        SELECT �� ASSIGN TO "��.dat"
        ORGANIZATION IS INDEXED
        ACCESS IS DYNAMIC
        RECORD KEY IS �󳵺�.
       DATA DIVISION.
       FILE SECTION.
       FD ��.
       01 �󳵼�¼.
        05 �󳵺� PIC 9.
        05 �󳵳����� PIC BX(6).
        05 �󳵳��� PIC BX(10).
        05 ������ PIC BX(5).
        05 �󳵹��� PIC B9(6).
        05 ���ձ��� PIC B999.

       METHOD-ID.�������ļ�����ʼ��.
       PROCEDURE DIVISION.
       OPEN OUTPUT ��.
       MOVE 1 TO �󳵺�.
       MOVE "LBG222" TO �󳵳�����.
       MOVE "����" TO �󳵳���.
       MOVE "c��" TO ������.
       MOVE 200 TO �󳵹���.
       MOVE 999 TO ���ձ���.
       WRITE �󳵼�¼.
       MOVE 2 TO �󳵺�.
       MOVE "HML233" TO �󳵳�����.
       MOVE "����" TO �󳵳���.
       MOVE "H6" TO ������.
       MOVE 150 TO �󳵹���.
       MOVE 699 TO ���ձ���.
       WRITE �󳵼�¼.
       MOVE 3 TO �󳵺�.
       MOVE "LSL332" TO �󳵳�����.
       MOVE "����" TO �󳵳���.
       MOVE "X5" TO ������.
       MOVE 300 TO �󳵹���.
       MOVE 799 TO ���ձ���.
       WRITE �󳵼�¼.
       MOVE 4 TO �󳵺�.
       MOVE "LHH215" TO �󳵳�����.
       MOVE "·��" TO �󳵳���.
       MOVE "��ʤ" TO ������.
       MOVE 210 TO �󳵹���.
       MOVE 799 TO ���ձ���.
       WRITE �󳵼�¼.
       CLOSE ��.
       END METHOD �������ļ�����ʼ��.

       METHOD-ID.���ù󳵷���.
       DATA DIVISION.
       LOCAL-STORAGE SECTION.
       01 �ж�-2 PIC 9.
        88 ����-2 VALUE 1.
        88 û����-2 VALUE 0.
       PROCEDURE DIVISION.
       SET û����-2 TO TRUE.
       INVOKE SELF "��ӡ����".
       OPEN INPUT ��.
       PERFORM UNTIL ����-2
       READ �� NEXT RECORD
       AT END SET ����-2 TO TRUE
       NOT AT END DISPLAY �󳵼�¼
       END-PERFORM.
       CLOSE ��.
       DISPLAY SPACE.
       DISPLAY "ѡ��һ����ϲ���ĳ�(û��������0��"NO ADVANCING.
       END METHOD ���ù󳵷���.
       END CLASS ����.

