       CLASS-ID.�˿��� INHERITS FROM BASE.

       CLASS-CONTROL.
       �˿��� IS CLASS "�˿���".

       OBJECT.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
        SELECT �˿� ASSIGN TO "�˿�.dat"
        ORGANIZATION IS INDEXED
        ACCESS IS DYNAMIC
        RECORD KEY IS �˿ͺ�.

       DATA DIVISION.
       FILE SECTION.
       FD �˿�.
       01 �˿ͼ�¼.
        05 �˿ͺ� PIC 99.
        05 �˿����� PIC BX(10).
        05 �˿ͺ��� PIC B9(4).

       METHOD-ID.�����˿��ļ�.
       PROCEDURE DIVISION.
       OPEN OUTPUT �˿�.
       CLOSE �˿�.
       END METHOD �����˿��ļ�.

       METHOD-ID.����˿���Ϣ.
       DATA DIVISION.
       LOCAL-STORAGE SECTION.
       01 �Ƿ���� PIC 9.
        88 ���� VALUE 1.
        88 û���� VALUE 0.
       77 ����˿ͺ� PIC 99.
       77 L PIC 9.
       LINKAGE SECTION.
       77 ���صĹ˿ͺ� PIC 99.
       SCREEN SECTION.
       01 ����Ļ.
        05 BLANK SCREEN.
       01 �������.
        05 LINE L.
        05 COLUMN 1 VALUE "��.".
        05 COLUMN 4 VALUE "����.".
        05 COLUMN 15 VALUE "����.".
       01 �Ӽ�¼.
        05 LINE L.
      * 05 COLUMN 6 PIC 99 TO �˿ͺ�.
        05 COLUMN 4 PIC X(10) TO �˿�����.
        05 COLUMN 14 PIC 9(4) TO �˿ͺ���.
       PROCEDURE DIVISION RETURNING ���صĹ˿ͺ�.
       OPEN INPUT �˿�.
       MOVE 1 TO ����˿ͺ�.
       SET û���� TO TRUE.
       PERFORM UNTIL ����
       READ �˿� NEXT RECORD
       AT END SET ���� TO TRUE
       NOT AT END IF ����˿ͺ� <= �˿ͺ�
                  THEN COMPUTE ����˿ͺ� = �˿ͺ� + 1
                  END-IF
       END-READ
       END-PERFORM
       CLOSE �˿�.
       OPEN I-O �˿�.
       MOVE 2 TO L.
       DISPLAY ����Ļ.
       DISPLAY "����˿���Ϣ(������һ����Ҽ�)".
       DISPLAY �������.
       DISPLAY SPACE.
       MOVE ����˿ͺ� TO �˿ͺ�.
       DISPLAY �˿ͺ�.
       MOVE 3 TO L.
       ACCEPT �Ӽ�¼.
       DISPLAY SPACE.
       MOVE �˿ͺ� TO ���صĹ˿ͺ�.
       WRITE �˿ͼ�¼.
       CLOSE �˿�.
       END METHOD ����˿���Ϣ.

       END OBJECT.

       END CLASS �˿���.
