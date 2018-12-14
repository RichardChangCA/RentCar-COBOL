       IDENTIFICATION DIVISION.
       PROGRAM-ID.��������.
       AUTHOR.�����20152649.
       ENVIRONMENT DIVISION.
       OBJECT SECTION.
       CLASS-CONTROL.
        �˵��� IS CLASS "�˵���"
        �˿��� IS CLASS "�˿���"
        С���� IS CLASS "С����"
        �г��� IS CLASS "�г���"
        ���� IS CLASS "����"
        ���� IS CLASS "����".
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
        SELECT �˿� ASSIGN TO "�˿�.dat"
        ORGANIZATION IS INDEXED
        ACCESS IS DYNAMIC
        RECORD KEY IS �˿ͺ�.

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
       FD �˿�.
       01 �˿ͼ�¼.
        05 �˿ͺ� PIC 99.
        05 �˿����� PIC BX(10).
        05 �˿ͺ��� PIC B9(4).
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
       01 �й˿��� PIC 9.
        88 �޹˿� VALUE ZERO.
        88 �й˿� VALUE 1.
       77 L PIC 9.
       77 ѡ�� PIC 9.
       77 �˿����� PIC 9.
       01 �˵����� OBJECT REFERENCE.
       01 �˿Ͷ��� OBJECT REFERENCE.
       01 С������ OBJECT REFERENCE.
       01 �г����� OBJECT REFERENCE.
       01 �󳵶��� OBJECT REFERENCE.
       01 �󳵶��� OBJECT REFERENCE.
       77 ���ļ����� PIC 9.

       SCREEN SECTION.
       01 ����Ļ.
        05 BLANK SCREEN
           FOREGROUND-COLOR 4
           BACKGROUND-COLOR 7.

       PROCEDURE DIVISION.
       INVOKE �˿��� "NEW" RETURNING �˿Ͷ���.
       INVOKE С���� "NEW" RETURNING С������.
       INVOKE �г��� "NEW" RETURNING �г�����.
       INVOKE ���� "NEW" RETURNING �󳵶���.
       INVOKE ���� "NEW" RETURNING �󳵶���.
       DISPLAY ����Ļ.
       DISPLAY "�Ƿ���Ҫ�������ļ�(��Ҫ������1)".
       ACCEPT ���ļ�����.
       EVALUATE ���ļ�����
       WHEN 1 PERFORM �������ļ�
       WHEN OTHER CONTINUE
       END-EVALUATE
       SET �й˿� TO TRUE.
       PERFORM UNTIL �޹˿�
       DISPLAY ����Ļ
       DISPLAY "����Ҫ���е������𣿣���������1��"
       ACCEPT �˿�����
       EVALUATE �˿�����
       WHEN 1 PERFORM ִ��
       WHEN OTHER SET �޹˿� TO TRUE
       END-EVALUATE.
       DISPLAY "�����ѽ���".
       STOP RUN.

       �������ļ�.
       OPEN OUTPUT Ԥ��.
       CLOSE Ԥ��.
       OPEN OUTPUT �˵�.
       CLOSE �˵�.
       INVOKE �˿Ͷ��� "�����˿��ļ�".
       INVOKE С������ "����С���ļ�����ʼ��".
       INVOKE �г����� "�����г��ļ�����ʼ��".
       INVOKE �󳵶��� "�������ļ�����ʼ��".
       INVOKE �󳵶��� "�������ļ�����ʼ��".

       ִ��.
       INVOKE �˵��� "NEW" RETURNING �˵�����.
       MOVE 1 TO ѡ��.
       PERFORM UNTIL ѡ�� IS ZERO
       INVOKE �˵����� "�˵�" RETURNING ѡ��
       EVALUATE ѡ��
       WHEN 1 CALL "Ԥ��" USING �˵����� �˿Ͷ���
       WHEN 2 CALL "�⳵"
       WHEN 3 CALL "�س�"
       WHEN 4 CALL "�˵�"
       WHEN 5 CALL "��ӡ"
       WHEN OTHER MOVE ZERO TO ѡ��
       END-EVALUATE
       END-PERFORM.
