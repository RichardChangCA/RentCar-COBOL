       IDENTIFICATION DIVISION.
       PROGRAM-ID.�⳵.
       AUTHOR.�����20152649.
       ENVIRONMENT DIVISION.
       FILE-CONTROL.
        SELECT Ԥ�� ASSIGN TO "Ԥ��.dat"
        ORGANIZATION IS INDEXED
        ACCESS IS DYNAMIC
        RECORD KEY IS Ԥ���˿ͺ�.
       DATA DIVISION.

       FILE SECTION.
       FD Ԥ��.
       01 Ԥ����¼.
        05 Ԥ���˿ͺ� PIC 99.
        05 Ԥ���˿����� PIC BX(10).
        05 Ԥ���˿ͺ��� PIC B9(4).
        05 Ԥ������ PIC BX(4).
        05 Ԥ������ PIC B9.
        05 Ԥ���������� PIC BX(6).
        05 Ԥ�������� PIC BX(10).
        05 Ԥ�������� PIC BX(5).
        05 Ԥ�������� PIC B9(6).
        05 Ԥ�����ձ��� PIC B999.
        05 Ԥ���� PIC B9(8).
        05 �黹�� PIC B9(8).
       WORKING-STORAGE SECTION.
       77 L PIC 9.
       77 �⳵�� PIC 99.
       01 �Ƿ���� PIC 9.
        88 û���� VALUE 1.
        88 ���� VALUE 0.
       77 �ж����� PIC B9(8).
       SCREEN SECTION.
       01 ����Ļ.
        05 BLANK SCREEN.
       01 Ԥ������.
        05 LINE L.
        05 COLUMN 1 VALUE "Ԥ���˿ͺ�".
        05 COLUMN 12 VALUE "����".
        05 COLUMN 22 VALUE "����".
        05 COLUMN 26 VALUE "����".
        05 COLUMN 31 VALUE "��".
        05 COLUMN 34 VALUE "��".
        05 COLUMN 40 VALUE "��".
        05 COLUMN 44 VALUE "����".
        05 COLUMN 50 VALUE "����".
        05 COLUMN 56 VALUE "�ձ���".
        05 COLUMN 63 VALUE "����".
        05 COLUMN 71 VALUE "����".
       PROCEDURE DIVISION.
       DISPLAY ����Ļ.
       MOVE 1 TO L.
       DISPLAY Ԥ������.
       DISPLAY SPACE.
       OPEN I-O Ԥ��.
       SET û���� TO TRUE.
       PERFORM UNTIL ����
       READ Ԥ�� NEXT RECORD
       AT END SET ���� TO TRUE
       NOT AT END DISPLAY Ԥ����¼
       END-READ
       END-PERFORM
       DISPLAY SPACE.
       DISPLAY "�����⳵�˿͵�Ԥ���˿ͺ�(û������0):" NO ADVANCING.
       ACCEPT �⳵��.
       IF �⳵��=0 THEN
       CLOSE Ԥ��
       EXIT PROGRAM
       END-IF
       MOVE �⳵�� TO Ԥ���˿ͺ�.
       READ Ԥ�� KEY IS Ԥ���˿ͺ�.
       DISPLAY Ԥ����¼.
       DISPLAY SPACE.
       DISPLAY "������������(��ʽΪ��λ��������,��20160917)".
       ACCEPT �ж�����.
       IF �ж�����<Ԥ����
       THEN DISPLAY "δ���⳵���ڣ��⳵ʧ��!".
       IF �ж�����>=Ԥ���� AND <=�黹��
       THEN DISPLAY "�⳵�ɹ�!"
            MOVE �ж����� TO Ԥ����.
       IF �ж�����>�黹��
       THEN DISPLAY "�⳵�˵��ѹ���!"
            DELETE Ԥ�� RECORD.
       CLOSE Ԥ��.
       DISPLAY "...�����������".
       STOP " ".
       EXIT PROGRAM.

