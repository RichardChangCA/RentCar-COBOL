       CLASS-ID.С���� INHERITS FROM ������.
       OBJECT SECTION.
       CLASS-CONTROL.
       С���� IS CLASS "С����"
       ������ IS CLASS "������".
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
        SELECT С�� ASSIGN TO "С��.dat"
        ORGANIZATION IS INDEXED
        ACCESS IS DYNAMIC
        RECORD KEY IS С����.
       DATA DIVISION.
       FILE SECTION.
       FD С��.
       01 С����¼.
        05 С���� PIC 9.
        05 С�������� PIC BX(6).
        05 С������ PIC BX(10).
        05 С������ PIC BX(5).
        05 С������ PIC B9(6).
        05 С���ձ��� PIC B999.

       METHOD-ID.����С���ļ�����ʼ��.
       PROCEDURE DIVISION.
       OPEN OUTPUT С��.
       MOVE 1 TO С����.
       MOVE "ABC123" TO С��������.
       MOVE "�����ִ�" TO С������.
       MOVE "�ö�" TO С������.
       MOVE 135 TO С������.
       MOVE 300 TO С���ձ���.
       WRITE С����¼.
       MOVE 2 TO С����.
       MOVE "ABD426" TO С��������.
       MOVE "�Ϻ�����" TO С������.
       MOVE "POLO" TO С������.
       MOVE 80 TO С������.
       MOVE 220 TO С���ձ���.
       WRITE С����¼.
       MOVE 3 TO С����.
       MOVE "ACC694" TO С��������.
       MOVE "�����ִ�" TO С������.
       MOVE "����" TO С������.
       MOVE 180 TO С������.
       MOVE 240 TO С���ձ���.
       WRITE С����¼.
       CLOSE С��.
       END METHOD ����С���ļ�����ʼ��.

       METHOD-ID.����С������.
       DATA DIVISION.
       LOCAL-STORAGE SECTION.
       01 �ж�-2 PIC 9.
        88 ����-2 VALUE 1.
        88 û����-2 VALUE 0.
       PROCEDURE DIVISION.
       SET û����-2 TO TRUE.
       INVOKE SELF "��ӡ����".
       OPEN INPUT С��.
       PERFORM UNTIL ����-2
       READ С�� NEXT RECORD
       AT END SET ����-2 TO TRUE
       NOT AT END DISPLAY С����¼
       END-PERFORM.
       CLOSE С��.
       DISPLAY SPACE.
       DISPLAY "ѡ��һ����ϲ���ĳ�(û��������0��"NO ADVANCING.
       END METHOD ����С������.
       END CLASS С����.
