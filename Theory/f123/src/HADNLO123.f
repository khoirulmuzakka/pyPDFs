      SUBROUTINE HADNLO123(Isch,Ihad,XBJ,Q,F1M,F2M,
     >   GLQ1,GRQ1,GLQ2,GRQ2,XMU,ISET,HMASS,XNLO123)
      Implicit Double Precision (A-H, O-Z)
      Dimension XNLO123(3), XNLOLR(-1:1)

       CALL HADNLO(Isch,Ihad,XBJ,Q,F1M,F2M,
     >   GLQ1,GRQ1,GLQ2,GRQ2,XMU,ISET,HMASS,XNLOLR)
       CALL HEL2TEN(XBJ,Q,HMASS,XNLOLR,XNLO123)

      RETURN
      END
