       IDENTIFICATION DIVISION.
       PROGRAM-ID.��ӡ.
       AUTHOR.�����20152649.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
        SELECT �˵� ASSIGN TO "�˵�.dat"
        ORGANIZATION IS INDEXED
        ACCESS IS DYNAMIC
        RECORD KEY IS �˵���.

       DATA DIVISION.
       FILE SECTION.
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
       77 ��ӡ�˵�ѡ�� PIC 99.
       77 L PIC 9.
       01 �Ƿ���� PIC 9.
        88 ���� VALUE 1.
        88 û���� VALUE 0.

       SCREEN SECTION.
       01 ����Ļ.
        05 BLANK SCREEN.
       01 �˵�����.
        05 LINE L.
        05 COLUMN 1 VALUE "�˵��˿ͺ�".
        05 COLUMN 12 VALUE "����".
        05 COLUMN 17 VALUE "����".
        05 COLUMN 22 VALUE "����".
        05 COLUMN 26 VALUE "��".
        05 COLUMN 29 VALUE "��".
        05 COLUMN 31 VALUE "��".
        05 COLUMN 34 VALUE "����".
        05 COLUMN 39 VALUE "����".
        05 COLUMN 44 VALUE "�ձ���".
        05 COLUMN 51 VALUE "����".
        05 COLUMN 56 VALUE "����".
        05 COLUMN 61 VALUE "������".
        05 COLUMN 68 VALUE "�ܽ��".
       PROCEDURE DIVISION.
       DISPLAY ����Ļ.
       OPEN INPUT �˵�.
       MOVE 1 TO L.
       DISPLAY �˵�����.
       DISPLAY SPACE.
       SET û���� TO TRUE.
       PERFORM UNTIL ����
       READ �˵� NEXT RECORD
       AT END SET ���� TO TRUE
       NOT AT END DISPLAY �˵���¼
       END-READ
       END-PERFORM.
       DISPLAY "�����˵���,ѡ���ӡ���˵�(�˳�����0):" NO ADVANCING.
       ACCEPT ��ӡ�˵�ѡ��.
       IF ��ӡ�˵�ѡ��=0 THEN
       CLOSE �˵�
       EXIT PROGRAM
       END-IF.
       MOVE ��ӡ�˵�ѡ�� TO �˵���.
       READ �˵� KEY IS �˵���.
       DISPLAY ����Ļ.
       DISPLAY "���:    " NO ADVANCING �˵���.
       DISPLAY "�˿�����:" NO ADVANCING �˵��˿�����.
       DISPLAY "�˿ͺ���:" NO ADVANCING �˵��˿ͺ���.
       DISPLAY "����:    " NO ADVANCING �˵�����.
       DISPLAY "����:    " NO ADVANCING �˵�����.
       DISPLAY "������:  " NO ADVANCING �˵���������.
       DISPLAY "����:    " NO ADVANCING �˵�������.
       DISPLAY "������:  " NO ADVANCING �˵�������.
       DISPLAY "������:  " NO ADVANCING �˵�������.
       DISPLAY "�ձ���:  " NO ADVANCING �˵����ձ���.
       DISPLAY "Ԥ����:  " NO ADVANCING �˵�Ԥ����.
       DISPLAY "�黹��:  " NO ADVANCING �˵��黹��.
       DISPLAY "������:  " NO ADVANCING ������.
       DISPLAY "�ܽ��:  " NO ADVANCING �ܽ��.
       DISPLAY SPACE.
       CLOSE �˵�.
       DISPLAY "����ո���˳�...".
       STOP " ".
       EXIT PROGRAM.
