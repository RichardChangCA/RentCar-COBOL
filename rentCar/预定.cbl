       IDENTIFICATION DIVISION.
       PROGRAM-ID.Ԥ��.
       AUTHOR.�����20152649.
       ENVIRONMENT DIVISION.
       OBJECT SECTION.
       CLASS-CONTROL.
        �˿��� IS CLASS "�˿���"
        �˵��� IS CLASS "�˵���"
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

        SELECT С�� ASSIGN TO "С��.dat"
        ORGANIZATION IS INDEXED
        ACCESS IS DYNAMIC
        RECORD KEY IS С����.

        SELECT �г� ASSIGN TO "�г�.dat"
        ORGANIZATION IS INDEXED
        ACCESS IS DYNAMIC
        RECORD KEY IS �г���.

        SELECT �� ASSIGN TO "��.dat"
        ORGANIZATION IS INDEXED
        ACCESS IS DYNAMIC
        RECORD KEY IS �󳵺�.

        SELECT �� ASSIGN TO "��.dat"
        ORGANIZATION IS INDEXED
        ACCESS IS DYNAMIC
        RECORD KEY IS �󳵺�.

        SELECT Ԥ�� ASSIGN TO "Ԥ��.dat"
        ORGANIZATION IS INDEXED
        ACCESS IS DYNAMIC
        RECORD KEY IS Ԥ���˿ͺ�.
       DATA DIVISION.
       FILE SECTION.
       FD �˿�.
       01 �˿ͼ�¼.
        05 �˿ͺ� PIC 99.
        05 �˿����� PIC BX(10).
        05 �˿ͺ��� PIC B9(4).
       FD С��.
       01 С����¼.
        05 С���� PIC 9.
        05 С�������� PIC BX(6).
        05 С������ PIC BX(10).
        05 С������ PIC BX(5).
        05 С������ PIC B9(6).
        05 С���ձ��� PIC B999.
       FD �г�.
       01 �г���¼.
        05 �г��� PIC 9.
        05 �г������� PIC BX(6).
        05 �г����� PIC BX(10).
        05 �г����� PIC BX(5).
        05 �г����� PIC B9(6).
        05 �г��ձ��� PIC B999.
       FD ��.
       01 �󳵼�¼.
        05 �󳵺� PIC 9.
        05 �󳵳����� PIC BX(6).
        05 �󳵳��� PIC BX(10).
        05 ������ PIC BX(5).
        05 �󳵹��� PIC B9(6).
        05 ���ձ��� PIC B999.
       FD ��.
       01 �󳵼�¼.
        05 �󳵺� PIC 9.
        05 �󳵳����� PIC BX(6).
        05 �󳵳��� PIC BX(10).
        05 ������ PIC BX(5).
        05 �󳵹��� PIC B9(6).
        05 ���ձ��� PIC B999.
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
       77 ѡ��-2 PIC 9.
       77 L PIC 9.
       77 ����Ԥ���� PIC 9(8).
       77 ���Թ黹�� PIC 9(8).
       01 �Ƿ���� PIC 9.
        88 ���� VALUE 1.
        88 û���� VALUE 0.
       01 С������ OBJECT REFERENCE.
       01 �г����� OBJECT REFERENCE.
       01 �󳵶��� OBJECT REFERENCE.
       01 �󳵶��� OBJECT REFERENCE.
       77 С��ѡ�� PIC 9.
       77 �г�ѡ�� PIC 9.
       77 ��ѡ�� PIC 9.
       77 ��ѡ�� PIC 9.
       77 ���Գ����� PIC BX(5).
       77 ���صĹ˿ͺ� PIC 99.
       LINKAGE SECTION.
       01 �˿Ͷ��� OBJECT REFERENCE.
       01 �˵����� OBJECT REFERENCE.
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
       PROCEDURE DIVISION USING �˵����� �˿Ͷ���.
       INVOKE �˿Ͷ��� "����˿���Ϣ" RETURNING ���صĹ˿ͺ�.
       OPEN INPUT �˿�.
       MOVE ���صĹ˿ͺ� TO �˿ͺ�.
       READ �˿� KEY IS �˿ͺ�.
       ������.
       INVOKE �˵����� "�˵�-2" RETURNING ѡ��-2.
       EVALUATE ѡ��-2
       WHEN 1 PERFORM ��С���ļ�
       WHEN 2 PERFORM ���г��ļ�
       WHEN 3 PERFORM �����ļ�
       WHEN 4 PERFORM �����ļ�
       WHEN OTHER
       CLOSE �˿�
       EXIT PROGRAM
       END-EVALUATE.
       �ı�����.
       DISPLAY ����Ļ.
       OPEN INPUT Ԥ��.
       SET û���� TO TRUE.
       MOVE 1 TO L.
       DISPLAY Ԥ������.
       DISPLAY SPACE.
       PERFORM UNTIL ����
       READ Ԥ�� NEXT RECORD
       AT END SET ���� TO TRUE
       NOT AT END
       DISPLAY Ԥ����¼
       END-READ
       END-PERFORM
       DISPLAY SPACE.
       DISPLAY "ȷ��Ԥ����(��ʽΪ��λ������20160917��ȡ������0)"
       ACCEPT ����Ԥ����.
       IF ����Ԥ����=0 THEN
       CLOSE Ԥ��
       EXIT PROGRAM
       END-IF.
       DISPLAY SPACE.
       DISPLAY "ȷ���黹��(��ʽΪ��λ������20160917��ȡ������0)".
       ACCEPT ���Թ黹��.
       IF ���Թ黹��=0
       THEN CLOSE Ԥ��
       EXIT PROGRAM
       END-IF.
       IF ����Ԥ����>���Թ黹��
       THEN DISPLAY "�����������"
            DISPLAY "����س���������������"
            STOP " "
            CLOSE Ԥ��
            GO TO �ı�����
       END-IF.
       CLOSE Ԥ��.
       ��Ԥ���ļ�.
       OPEN INPUT Ԥ��.
       SET û���� TO TRUE.
       PERFORM UNTIL ����
       READ Ԥ�� NEXT RECORD
       AT END SET ���� TO TRUE
       NOT AT END
       IF ���Գ����� = Ԥ��������
       THEN PERFORM ����ƥ��
       ELSE CONTINUE
       END-IF
       END-READ
       END-PERFORM.
       CLOSE Ԥ��.
       OPEN I-O Ԥ��.
       MOVE �˿ͺ� TO Ԥ���˿ͺ�.
       MOVE �˿����� TO Ԥ���˿�����.
       MOVE �˿ͺ��� TO Ԥ���˿ͺ���.
       CLOSE �˿�.
       MOVE ����Ԥ���� TO Ԥ����.
       MOVE ���Թ黹�� TO �黹��.
       EVALUATE ѡ��-2
       WHEN 1 PERFORM ����С���ļ�
       WHEN 2 PERFORM �����г��ļ�
       WHEN 3 PERFORM ���ʹ��ļ�
       WHEN 4 PERFORM ���͹��ļ�
       END-EVALUATE.
       WRITE Ԥ����¼.
       CLOSE Ԥ��.
       OPEN INPUT Ԥ��.
       DISPLAY ����Ļ.
       DISPLAY "Ԥ���ɹ�!".
       MOVE 3 TO L.
       DISPLAY Ԥ������.
       DISPLAY SPACE.
       SET û���� TO TRUE.
       PERFORM UNTIL ����
       READ Ԥ�� NEXT RECORD
       AT END SET ���� TO TRUE
       NOT AT END DISPLAY Ԥ����¼
       END-READ
       END-PERFORM
       DISPLAY "...����س�������".
       STOP " ".
       CLOSE Ԥ��.
       EXIT PROGRAM.

       ����ƥ��.
       IF (���Թ黹�� < Ԥ����) OR (����Ԥ���� > �黹��)
       THEN CONTINUE
       ELSE DISPLAY "���������޳�,���س����ı�����"
            STOP " "
            CLOSE Ԥ��
            GO TO �ı�����
       END-IF.


       ��С���ļ�.
       INVOKE С���� "NEW" RETURNING С������.
       INVOKE С������ "����С������".
       ACCEPT С��ѡ��.
       IF С��ѡ�� IS ZERO
       THEN GO TO ������.
       OPEN INPUT С��.
       MOVE С��ѡ�� TO С����.
       READ С�� KEY IS С����.
       MOVE С������ TO ���Գ�����.
       CLOSE С��.

       ����С���ļ�.
       MOVE "С��" TO Ԥ������.
       MOVE С��ѡ�� TO С����.
       OPEN INPUT С��.
       READ С�� KEY IS С����.
       MOVE С���� TO Ԥ������.
       MOVE С�������� TO Ԥ����������.
       MOVE С������ TO Ԥ��������.
       MOVE С������ TO Ԥ��������.
       MOVE С������ TO Ԥ��������.
       MOVE С���ձ��� TO Ԥ�����ձ���.
       CLOSE С��.

       ���г��ļ�.
       INVOKE �г��� "NEW" RETURNING �г�����.
       INVOKE �г����� "�����г�����".
       ACCEPT �г�ѡ��.
       IF �г�ѡ�� IS ZERO
       THEN GO TO ������.
       MOVE �г�ѡ�� TO �г���.
       OPEN INPUT �г�.
       READ �г� KEY IS �г���.
       MOVE �г����� TO ���Գ�����.
       CLOSE �г�.

       �����г��ļ�.
       MOVE "�г�" TO Ԥ������.
       MOVE �г�ѡ�� TO �г���.
       OPEN INPUT �г�.
       READ �г� KEY IS �г���.
       MOVE �г��� TO Ԥ������.
       MOVE �г������� TO Ԥ����������.
       MOVE �г����� TO Ԥ��������.
       MOVE �г����� TO Ԥ��������.
       MOVE �г����� TO Ԥ��������.
       MOVE �г��ձ��� TO Ԥ�����ձ���.
       CLOSE �г�.

       �����ļ�.
       INVOKE ���� "NEW" RETURNING �󳵶���.
       INVOKE �󳵶��� "���ô󳵷���".
       ACCEPT ��ѡ��.
       IF ��ѡ�� IS ZERO
       THEN GO TO ������.
       MOVE ��ѡ�� TO �󳵺�.
       OPEN INPUT ��.
       READ �� KEY IS �󳵺�.
       MOVE ������ TO ���Գ�����.
       CLOSE ��.

       ���ʹ��ļ�.
       MOVE "��" TO Ԥ������.
       MOVE ��ѡ�� TO �󳵺�.
       OPEN INPUT ��.
       READ �� KEY IS �󳵺�.
       MOVE �󳵺� TO Ԥ������.
       MOVE �󳵳����� TO Ԥ����������.
       MOVE �󳵳��� TO Ԥ��������.
       MOVE ������ TO Ԥ��������.
       MOVE �󳵹��� TO Ԥ��������.
       MOVE ���ձ��� TO Ԥ�����ձ���.
       CLOSE ��.

       �����ļ�.
       INVOKE ���� "NEW" RETURNING �󳵶���.
       INVOKE �󳵶��� "���ù󳵷���".
       ACCEPT ��ѡ��.
       IF ��ѡ�� IS ZERO
       THEN GO TO ������.
       MOVE ��ѡ�� TO �󳵺�.
       OPEN INPUT ��.
       READ �� KEY IS �󳵺�.
       MOVE ������ TO ���Գ�����.
       CLOSE ��.

       ���͹��ļ�.
       MOVE "��" TO Ԥ������.
       MOVE ��ѡ�� TO �󳵺�.
       OPEN INPUT ��.
       READ �� KEY IS �󳵺�.
       MOVE �󳵺� TO Ԥ������.
       MOVE �󳵳����� TO Ԥ����������.
       MOVE �󳵳��� TO Ԥ��������.
       MOVE ������ TO Ԥ��������.
       MOVE �󳵹��� TO Ԥ��������.
       MOVE ���ձ��� TO Ԥ�����ձ���.
       CLOSE ��.
