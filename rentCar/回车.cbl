       IDENTIFICATION DIVISION.
       PROGRAM-ID.�س�.
       AUTHOR.�����20152649.
       ENVIRONMENT DIVISION.
       OBJECT SECTION.
       FILE-CONTROL.

        SELECT Ԥ�� ASSIGN TO "Ԥ��.dat"
        ORGANIZATION IS INDEXED
        ACCESS IS DYNAMIC
        RECORD KEY IS Ԥ���˿ͺ�.

        SELECT �˵� ASSIGN TO "�˵�.dat"
        ORGANIZATION IS INDEXED
        ACCESS IS DYNAMIC
        RECORD KEY IS �˵���.

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
       FD �˵�.
       01 �˵���¼.
        05 �˵��� PIC 99.
        05 �˵��˿����� PIC BX(10).
        05 �˵��˿ͺ��� PIC B9(4).
        05 �˵����� PIC BX(4).
        05 �˵����� PIC B9.
        05 �˵��������� PIC BX(6).
        05 �˵������� PIC BX(10).
        05 �˵������� PIC BX(5).
        05 �˵������� PIC B9(6).
        05 �˵����ձ��� PIC B999.
        05 �˵�Ԥ���� PIC B9(8).
        05 �˵��黹�� PIC B9(8).
        05 ������ PIC B99.
        05 �ܽ�� PIC B99999.

       WORKING-STORAGE SECTION.
       77 L PIC 9.
       77 ������ PIC 99.
       01 �Ƿ���� PIC 9.
        88 ���� VALUE 1.
        88 û���� VALUE 0.
       77 �������� PIC B9(8).
       77 �����˵��黹�� PIC 9(8).
       77 �����˵�Ԥ���� PIC 9(8).
       77 ���������� PIC 99.
       77 �����ܽ�� PIC 9(5).
       77 �����˵����ձ��� PIC 999.
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
       SET û���� TO TRUE.
       OPEN I-O Ԥ��.
       PERFORM UNTIL ����
       READ Ԥ�� NEXT RECORD
       AT END SET ���� TO TRUE
       NOT AT END DISPLAY Ԥ����¼
       END-READ
       END-PERFORM.
       DISPLAY SPACE.
       DISPLAY "ѡ�񻹳��Ĺ˿�(û�м���0)" NO ADVANCING.
       ACCEPT ������.
       IF ������=0 THEN
       CLOSE Ԥ��
       EXIT PROGRAM
       END-IF.
       MOVE ������ TO Ԥ���˿ͺ�.
       READ Ԥ�� KEY IS Ԥ���˿ͺ�.
       DISPLAY "�����������(��ʽΪ��λ������20160917)".
       ACCEPT ��������.
       MOVE �������� TO �黹��.
       OPEN I-O �˵�.
       MOVE Ԥ���˿ͺ� TO �˵���.
       MOVE Ԥ���˿����� TO �˵��˿�����.
       MOVE Ԥ���˿ͺ��� TO �˵��˿ͺ���.
       MOVE Ԥ������ TO �˵�����.
       MOVE Ԥ������ TO �˵�����.
       MOVE Ԥ���������� TO �˵���������.
       MOVE Ԥ�������� TO �˵�������.
       MOVE Ԥ�������� TO �˵�������.
       MOVE Ԥ�������� TO �˵�������.
       MOVE Ԥ�����ձ��� TO �˵����ձ���.
       MOVE Ԥ���� TO �˵�Ԥ����.
       MOVE �黹�� TO �˵��黹��.
       MOVE �˵��黹�� TO �����˵��黹��.
       MOVE �˵�Ԥ���� TO �����˵�Ԥ����.
       MOVE �˵����ձ��� TO �����˵����ձ���.
       COMPUTE ���������� = �����˵��黹�� - �����˵�Ԥ����.
       COMPUTE �����ܽ�� = ���������� * �����˵����ձ���.
       MOVE ���������� TO ������.
       MOVE �����ܽ�� TO �ܽ��.
       DELETE Ԥ�� RECORD.
       CLOSE Ԥ��.
       WRITE �˵���¼.
       CLOSE �˵�.
       DISPLAY "�س��ɹ�!".
       DISPLAY SPACE.
       DISPLAY "...�����������".
       STOP " ".
       EXIT PROGRAM.
