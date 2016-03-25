object dmWorkflowData: TdmWorkflowData
  OldCreateOrder = False
  Height = 556
  Width = 606
  object ZQWorkflow: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'select * from WORKFLOWTYPES')
    UpdateObject = ZUSQLWorkflow
    AfterInsert = ZQWorkflowAfterInsert
    BeforePost = ZQWorkflowBeforePost
    BeforeDelete = ZQWorkflowBeforeDelete
    Left = 36
    Top = 12
    object ZQWorkflowWWORKFLOWTYPEID: TIntegerField
      FieldName = 'WWORKFLOWTYPEID'
      Required = True
    end
    object ZQWorkflowSWORFLOWNAME: TStringField
      FieldName = 'SWORFLOWNAME'
      Size = 64
    end
    object ZQWorkflowBDISABLE: TIntegerField
      FieldName = 'BDISABLE'
    end
    object ZQWorkflowSTARTSTEP: TIntegerField
      FieldName = 'STARTSTEP'
    end
    object ZQWorkflowGUID: TStringField
      FieldName = 'GUID'
      Size = 60
    end
    object ZQWorkflowWGROUPID: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'WGROUPID'
      OnGetText = ZQWorkflowWGROUPIDGetText
      OnSetText = ZQWorkflowWGROUPIDSetText
    end
  end
  object ZUSQLWorkflow: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO WORKFLOWTYPES'
      
        '  (WWORKFLOWTYPEID, SWORFLOWNAME, BDISABLE, STARTSTEP, GUID, WGR' +
        'OUPID)'
      'VALUES'
      
        '  (:WWORKFLOWTYPEID, :SWORFLOWNAME, :BDISABLE, :STARTSTEP, :GUID' +
        ', :WGROUPID)')
    DeleteSQL.Strings = (
      'DELETE FROM WORKFLOWTYPES'
      'WHERE'
      '  WORKFLOWTYPES.WWORKFLOWTYPEID = :OLD_WWORKFLOWTYPEID')
    ModifySQL.Strings = (
      'UPDATE WORKFLOWTYPES SET'
      '  WWORKFLOWTYPEID = :WWORKFLOWTYPEID,'
      '  SWORFLOWNAME = :SWORFLOWNAME,'
      '  BDISABLE = :BDISABLE,'
      '  STARTSTEP = :STARTSTEP,'
      '  GUID = :GUID,'
      '  WGROUPID = :WGROUPID'
      'WHERE'
      '  WORKFLOWTYPES.WWORKFLOWTYPEID = '
      ':OLD_WWORKFLOWTYPEID')
    Left = 32
    Top = 68
  end
  object ZQSteps: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'select * from WORKFLOWSTEPS where WSTEPTYPEID = :WSTEPTYPEID')
    UpdateObject = ZUSQLSteps
    Left = 328
    Top = 20
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WSTEPTYPEID'
      end>
    object ZQStepsWWORKFLOWSTEPID: TIntegerField
      FieldName = 'WWORKFLOWSTEPID'
      Required = True
    end
    object ZQStepsSSTEPNAME: TStringField
      FieldName = 'SSTEPNAME'
      Size = 64
    end
    object ZQStepsWSTEPTYPEID: TIntegerField
      FieldName = 'WSTEPTYPEID'
      Required = True
    end
    object ZQStepsSPARAMS: TBlobField
      FieldName = 'SPARAMS'
    end
    object ZQStepsWSTATUSID: TSmallintField
      FieldName = 'WSTATUSID'
      Required = True
    end
    object ZQStepsWDURATIONTYPE: TIntegerField
      FieldName = 'WDURATIONTYPE'
    end
    object ZQStepsWDURATIONINTERVAL: TIntegerField
      FieldName = 'WDURATIONINTERVAL'
    end
    object ZQStepsWUSERID: TIntegerField
      FieldName = 'WUSERID'
    end
    object ZQStepsWXPOS: TIntegerField
      FieldName = 'WXPOS'
    end
    object ZQStepsWYPOS: TIntegerField
      FieldName = 'WYPOS'
    end
    object ZQStepsWWIDTH: TIntegerField
      FieldName = 'WWIDTH'
    end
    object ZQStepsWHEIGHT: TIntegerField
      FieldName = 'WHEIGHT'
    end
    object ZQStepsSREMARK: TBlobField
      FieldName = 'SREMARK'
    end
    object ZQStepsSSQLSTEP: TBlobField
      FieldName = 'SSQLSTEP'
    end
    object ZQStepsSSQLBACK: TBlobField
      FieldName = 'SSQLBACK'
    end
    object ZQStepsSTATUSTEXT: TBlobField
      FieldName = 'STATUSTEXT'
    end
  end
  object ZUSQLSteps: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO WORKFLOWSTEPS'
      
        '  (WWORKFLOWSTEPID, SSTEPNAME, WSTEPTYPEID, SPARAMS, WSTATUSID, ' +
        'WDURATIONTYPE, '
      
        '   WDURATIONINTERVAL, WUSERID, WXPOS, WYPOS, WWIDTH, WHEIGHT, SR' +
        'EMARK, '
      '   SSQLSTEP, SSQLBACK, STATUSTEXT)'
      'VALUES'
      
        '  (:WWORKFLOWSTEPID, :SSTEPNAME, :WSTEPTYPEID, :SPARAMS, :WSTATU' +
        'SID, :WDURATIONTYPE, '
      
        '   :WDURATIONINTERVAL, :WUSERID, :WXPOS, :WYPOS, :WWIDTH, :WHEIG' +
        'HT, :SREMARK, '
      '   :SSQLSTEP, :SSQLBACK, :STATUSTEXT)')
    DeleteSQL.Strings = (
      'DELETE FROM WORKFLOWSTEPS'
      'WHERE'
      '  WORKFLOWSTEPS.WWORKFLOWSTEPID = :OLD_WWORKFLOWSTEPID')
    ModifySQL.Strings = (
      'UPDATE WORKFLOWSTEPS SET'
      '  WWORKFLOWSTEPID = :WWORKFLOWSTEPID,'
      '  SSTEPNAME = :SSTEPNAME,'
      '  WSTEPTYPEID = :WSTEPTYPEID,'
      '  SPARAMS = :SPARAMS,'
      '  WSTATUSID = :WSTATUSID,'
      '  WDURATIONTYPE = :WDURATIONTYPE,'
      '  WDURATIONINTERVAL = :WDURATIONINTERVAL,'
      '  WUSERID = :WUSERID,'
      '  WXPOS = :WXPOS,'
      '  WYPOS = :WYPOS,'
      '  WWIDTH = :WWIDTH,'
      '  WHEIGHT = :WHEIGHT,'
      '  SREMARK = :SREMARK,'
      '  SSQLSTEP = :SSQLSTEP,'
      '  SSQLBACK = :SSQLBACK,'
      '  STATUSTEXT = :STATUSTEXT'
      'WHERE'
      '  WORKFLOWSTEPS.WWORKFLOWSTEPID = '
      ':OLD_WWORKFLOWSTEPID')
    Left = 328
    Top = 68
  end
  object ZQTransisions: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      
        'SELECT a.WWORKFLOWTRANSID, a.STRANSNAME, a.SCONDITION, a.WFROMWO' +
        'RKFLOWSTEPID, a.WTOWORKFLOWSTEPID, a.WLEFTMARK, a.WTOPMARK'
      ',a.WLEFTENDMARK, a.WTOPENDMARK'
      'FROM WORKFLOWTRANSITIONS a '
      'where '
      
        'exists (select * from WORKFLOWSTEPS x where x.WWORKFLOWSTEPID = ' +
        'a.WFROMWORKFLOWSTEPID and x.WSTEPTYPEID =:PARM1)'
      'or'
      
        'exists (select * from WORKFLOWSTEPS x where x.WWORKFLOWSTEPID = ' +
        'a.WTOWORKFLOWSTEPID and x.WSTEPTYPEID =:PARM2)')
    UpdateObject = ZUsqltransitions
    Left = 428
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PARM1'
      end
      item
        DataType = ftUnknown
        Name = 'PARM2'
      end>
    object ZQTransisionsWWORKFLOWTRANSID: TIntegerField
      FieldName = 'WWORKFLOWTRANSID'
      Required = True
    end
    object ZQTransisionsSTRANSNAME: TStringField
      FieldName = 'STRANSNAME'
      Size = 64
    end
    object ZQTransisionsSCONDITION: TBlobField
      FieldName = 'SCONDITION'
    end
    object ZQTransisionsWFROMWORKFLOWSTEPID: TIntegerField
      FieldName = 'WFROMWORKFLOWSTEPID'
      Required = True
    end
    object ZQTransisionsWTOWORKFLOWSTEPID: TIntegerField
      FieldName = 'WTOWORKFLOWSTEPID'
      Required = True
    end
    object ZQTransisionsWLEFTMARK: TIntegerField
      FieldName = 'WLEFTMARK'
    end
    object ZQTransisionsWTOPMARK: TIntegerField
      FieldName = 'WTOPMARK'
    end
    object ZQTransisionsWLEFTENDMARK: TIntegerField
      FieldName = 'WLEFTENDMARK'
    end
    object ZQTransisionsWTOPENDMARK: TIntegerField
      FieldName = 'WTOPENDMARK'
    end
  end
  object ZUsqltransitions: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO WORKFLOWTRANSITIONS'
      
        '  (WWORKFLOWTRANSID, STRANSNAME, SCONDITION, WFROMWORKFLOWSTEPID' +
        ', WTOWORKFLOWSTEPID, '
      '   WLEFTMARK, WTOPMARK, WLEFTENDMARK, WTOPENDMARK)'
      'VALUES'
      
        '  (:WWORKFLOWTRANSID, :STRANSNAME, :SCONDITION, :WFROMWORKFLOWST' +
        'EPID, :WTOWORKFLOWSTEPID, '
      '   :WLEFTMARK, :WTOPMARK, :WLEFTENDMARK, :WTOPENDMARK)')
    DeleteSQL.Strings = (
      'DELETE FROM WORKFLOWTRANSITIONS'
      'WHERE'
      '  WORKFLOWTRANSITIONS.WWORKFLOWTRANSID = :OLD_WWORKFLOWTRANSID')
    ModifySQL.Strings = (
      'UPDATE WORKFLOWTRANSITIONS SET'
      '  WWORKFLOWTRANSID = :WWORKFLOWTRANSID,'
      '  STRANSNAME = :STRANSNAME,'
      '  SCONDITION = :SCONDITION,'
      '  WFROMWORKFLOWSTEPID = :WFROMWORKFLOWSTEPID,'
      '  WTOWORKFLOWSTEPID = :WTOWORKFLOWSTEPID,'
      '  WLEFTMARK = :WLEFTMARK,'
      '  WTOPMARK = :WTOPMARK,'
      '  WLEFTENDMARK = :WLEFTENDMARK,'
      '  WTOPENDMARK = :WTOPENDMARK'
      'WHERE'
      '  WORKFLOWTRANSITIONS.WWORKFLOWTRANSID = '
      ':OLD_WWORKFLOWTRANSID')
    Left = 428
    Top = 68
  end
  object ZQTasks: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      
        'select * from WORKFLOWWORK where WWORKFLOWWORKID = :WWORKFLOWWOR' +
        'KID')
    AfterInsert = ZQTasksAfterInsert
    Left = 132
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WWORKFLOWWORKID'
      end>
    object ZQTasksWWORKFLOWWORKID: TIntegerField
      FieldName = 'WWORKFLOWWORKID'
      Required = True
    end
    object ZQTasksWUSERID: TIntegerField
      FieldName = 'WUSERID'
      Required = True
    end
    object ZQTasksWSTATUS: TIntegerField
      FieldName = 'WSTATUS'
      Required = True
    end
    object ZQTasksWWORKFLOWSTEPID: TIntegerField
      FieldName = 'WWORKFLOWSTEPID'
      Required = True
    end
    object ZQTasksWLINKID: TIntegerField
      FieldName = 'WLINKID'
    end
    object ZQTasksDDATEACTION: TDateTimeField
      FieldName = 'DDATEACTION'
    end
    object ZQTasksPARAMS: TBlobField
      FieldName = 'PARAMS'
    end
  end
  object ZUSQLTask: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO WORKFLOWWORK'
      
        '  (WWORKFLOWWORKID, WUSERID, WSTATUS, WWORKFLOWSTEPID, WLINKID, ' +
        'DDATEACTION, '
      '   PARAMS)'
      'VALUES'
      
        '  (:WWORKFLOWWORKID, :WUSERID, :WSTATUS, :WWORKFLOWSTEPID, :WLIN' +
        'KID, :DDATEACTION, '
      '   :PARAMS)')
    DeleteSQL.Strings = (
      'DELETE FROM WORKFLOWWORK'
      'WHERE'
      '  WORKFLOWWORK.WWORKFLOWWORKID = :OLD_WWORKFLOWWORKID')
    ModifySQL.Strings = (
      'UPDATE WORKFLOWWORK SET'
      '  WWORKFLOWWORKID = :WWORKFLOWWORKID,'
      '  WUSERID = :WUSERID,'
      '  WSTATUS = :WSTATUS,'
      '  WWORKFLOWSTEPID = :WWORKFLOWSTEPID,'
      '  WLINKID = :WLINKID,'
      '  DDATEACTION = :DDATEACTION,'
      '  PARAMS = :PARAMS'
      'WHERE'
      '  WORKFLOWWORK.WWORKFLOWWORKID = '
      ':OLD_WWORKFLOWWORKID')
    Left = 136
    Top = 68
  end
  object ZQGetStep: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'select * from WORKFLOWSTEPS where '
      'WWORKFLOWSTEPID= :ID')
    Left = 132
    Top = 132
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
      end>
    object ZQGetStepWWORKFLOWSTEPID: TIntegerField
      FieldName = 'WWORKFLOWSTEPID'
      Required = True
    end
    object ZQGetStepSSTEPNAME: TStringField
      FieldName = 'SSTEPNAME'
      Size = 64
    end
    object ZQGetStepWSTEPTYPEID: TIntegerField
      FieldName = 'WSTEPTYPEID'
      Required = True
    end
    object ZQGetStepSPARAMS: TBlobField
      FieldName = 'SPARAMS'
    end
    object ZQGetStepWSTATUSID: TSmallintField
      FieldName = 'WSTATUSID'
      Required = True
    end
    object ZQGetStepWDURATIONTYPE: TIntegerField
      FieldName = 'WDURATIONTYPE'
    end
    object ZQGetStepWDURATIONINTERVAL: TIntegerField
      FieldName = 'WDURATIONINTERVAL'
    end
    object ZQGetStepWUSERID: TIntegerField
      FieldName = 'WUSERID'
    end
    object ZQGetStepWXPOS: TIntegerField
      FieldName = 'WXPOS'
    end
    object ZQGetStepWYPOS: TIntegerField
      FieldName = 'WYPOS'
    end
    object ZQGetStepWWIDTH: TIntegerField
      FieldName = 'WWIDTH'
    end
    object ZQGetStepWHEIGHT: TIntegerField
      FieldName = 'WHEIGHT'
    end
    object ZQGetStepSREMARK: TBlobField
      FieldName = 'SREMARK'
    end
    object ZQGetStepSSQLSTEP: TBlobField
      FieldName = 'SSQLSTEP'
    end
    object ZQGetStepSSQLBACK: TBlobField
      FieldName = 'SSQLBACK'
    end
    object ZQGetStepSTATUSTEXT: TBlobField
      FieldName = 'STATUSTEXT'
    end
  end
  object ZQHist: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      
        'select first 1 * from WORKFLOWWORKHIS where WWORKFLOWWORKID=:WWO' +
        'RKFLOWWORKID'
      'order by 1 desc')
    UpdateObject = ZUSQLHist
    AfterInsert = ZQHistAfterInsert
    Left = 236
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WWORKFLOWWORKID'
      end>
    object ZQHistWWORKFLOWWORKHISID: TIntegerField
      FieldName = 'WWORKFLOWWORKHISID'
      Required = True
    end
    object ZQHistWWORKFLOWWORKID: TIntegerField
      FieldName = 'WWORKFLOWWORKID'
    end
    object ZQHistWUSERID: TIntegerField
      FieldName = 'WUSERID'
      Required = True
    end
    object ZQHistWSTATUS: TIntegerField
      FieldName = 'WSTATUS'
      Required = True
    end
    object ZQHistWWORKFLOWSTEPID: TIntegerField
      FieldName = 'WWORKFLOWSTEPID'
      Required = True
    end
    object ZQHistWLINKID: TIntegerField
      FieldName = 'WLINKID'
    end
    object ZQHistDDATEACTION: TDateTimeField
      FieldName = 'DDATEACTION'
    end
  end
  object ZUSQLHist: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO WORKFLOWWORKHIS'
      
        '  (WWORKFLOWWORKHISID, WWORKFLOWWORKID, WUSERID, WSTATUS, WWORKF' +
        'LOWSTEPID, '
      '   WLINKID, DDATEACTION)'
      'VALUES'
      
        '  (:WWORKFLOWWORKHISID, :WWORKFLOWWORKID, :WUSERID, :WSTATUS, :W' +
        'WORKFLOWSTEPID, '
      '   :WLINKID, :DDATEACTION)')
    DeleteSQL.Strings = (
      'DELETE FROM WORKFLOWWORKHIS'
      'WHERE'
      '  WORKFLOWWORKHIS.WWORKFLOWWORKHISID = :OLD_WWORKFLOWWORKHISID')
    ModifySQL.Strings = (
      'UPDATE WORKFLOWWORKHIS SET'
      '  WWORKFLOWWORKHISID = :WWORKFLOWWORKHISID,'
      '  WWORKFLOWWORKID = :WWORKFLOWWORKID,'
      '  WUSERID = :WUSERID,'
      '  WSTATUS = :WSTATUS,'
      '  WWORKFLOWSTEPID = :WWORKFLOWSTEPID,'
      '  WLINKID = :WLINKID,'
      '  DDATEACTION = :DDATEACTION'
      'WHERE'
      '  WORKFLOWWORKHIS.WWORKFLOWWORKHISID = '
      ':OLD_WWORKFLOWWORKHISID')
    Left = 236
    Top = 68
  end
  object ZQGetTransitions: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      
        'SELECT a.WWORKFLOWTRANSID, a.STRANSNAME, a.SCONDITION, a.WFROMWO' +
        'RKFLOWSTEPID, a.WTOWORKFLOWSTEPID, a.WLEFTMARK, a.WTOPMARK'
      'FROM WORKFLOWTRANSITIONS a where '
      'a.WFROMWORKFLOWSTEPID =:PARM1')
    Left = 236
    Top = 132
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PARM1'
      end>
    object ZQGetTransitionsWWORKFLOWTRANSID: TIntegerField
      FieldName = 'WWORKFLOWTRANSID'
      Required = True
    end
    object ZQGetTransitionsSTRANSNAME: TStringField
      FieldName = 'STRANSNAME'
      Size = 64
    end
    object ZQGetTransitionsSCONDITION: TBlobField
      FieldName = 'SCONDITION'
    end
    object ZQGetTransitionsWFROMWORKFLOWSTEPID: TIntegerField
      FieldName = 'WFROMWORKFLOWSTEPID'
      Required = True
    end
    object ZQGetTransitionsWTOWORKFLOWSTEPID: TIntegerField
      FieldName = 'WTOWORKFLOWSTEPID'
      Required = True
    end
    object ZQGetTransitionsWLEFTMARK: TIntegerField
      FieldName = 'WLEFTMARK'
    end
    object ZQGetTransitionsWTOPMARK: TIntegerField
      FieldName = 'WTOPMARK'
    end
  end
  object ZQTaskList: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'SELECT a.*,b.SSTEPNAME,c.SWORFLOWNAME ,c.WGroupid,'
      'b.statustext ,b.WDURATIONTYPE,b.WDURATIONINTERVAL'
      
        'from  WORKFLOWWORK a join WORKFLOWSTEPS b on  a.WWORKFLOWSTEPID ' +
        '=  b.WWORKFLOWSTEPID'
      'join WORKFLOWTYPES c on b.WSTEPTYPEID= c.WWORKFLOWTYPEID'
      'where a.WSTATUS <> -1')
    AfterInsert = ZQTasksAfterInsert
    OnCalcFields = ZQTaskListCalcFields
    Left = 44
    Top = 140
    object ZQTaskListWWORKFLOWWORKID: TIntegerField
      FieldName = 'WWORKFLOWWORKID'
      Required = True
    end
    object ZQTaskListWUSERID: TIntegerField
      FieldName = 'WUSERID'
      Required = True
    end
    object ZQTaskListWSTATUS: TIntegerField
      FieldName = 'WSTATUS'
      Required = True
    end
    object ZQTaskListWWORKFLOWSTEPID: TIntegerField
      FieldName = 'WWORKFLOWSTEPID'
      Required = True
    end
    object ZQTaskListWLINKID: TIntegerField
      FieldName = 'WLINKID'
    end
    object ZQTaskListDDATEACTION: TDateTimeField
      FieldName = 'DDATEACTION'
    end
    object ZQTaskListSSTEPNAME: TStringField
      FieldName = 'SSTEPNAME'
      Size = 64
    end
    object ZQTaskListSWORFLOWNAME: TStringField
      FieldName = 'SWORFLOWNAME'
      Size = 64
    end
    object ZQTaskListPARAMS: TBlobField
      FieldName = 'PARAMS'
    end
    object ZQTaskListSTATUSTEXT: TBlobField
      FieldName = 'STATUSTEXT'
    end
    object ZQTaskListDISPLAYTEXT: TStringField
      FieldKind = fkCalculated
      FieldName = 'DISPLAYTEXT'
      Size = 255
      Calculated = True
    end
    object ZQTaskListUSER: TStringField
      FieldKind = fkCalculated
      FieldName = 'USER'
      Size = 80
      Calculated = True
    end
    object ZQTaskListWDURATIONTYPE: TIntegerField
      FieldName = 'WDURATIONTYPE'
    end
    object ZQTaskListWDURATIONINTERVAL: TIntegerField
      FieldName = 'WDURATIONINTERVAL'
    end
    object ZQTaskListWGROUPID: TIntegerField
      FieldName = 'WGROUPID'
      OnGetText = ZQWorkflowWGROUPIDGetText
    end
    object ZQTaskListFPERCENTCOMP: TFloatField
      FieldKind = fkCalculated
      FieldName = 'FPERCENTCOMP'
      Calculated = True
    end
  end
  object ZQTaskHist: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'SELECT a.*,b.SSTEPNAME,c.SWORFLOWNAME , c.WGroupid,'
      
        'b.statustext,b.WDURATIONTYPE,b.WDURATIONINTERVAL from  WORKFLOWW' +
        'ORKHIS a join WORKFLOWSTEPS b on  a.WWORKFLOWSTEPID =  b.WWORKFL' +
        'OWSTEPID'
      'join WORKFLOWTYPES c on b.WSTEPTYPEID= c.WWORKFLOWTYPEID'
      'where a.WWORKFLOWWORKID = :ID'
      '')
    UpdateObject = ZUSQLTask
    OnCalcFields = ZQTaskListCalcFields
    Left = 40
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
      end>
    object ZQTaskHistWWORKFLOWWORKID: TIntegerField
      FieldName = 'WWORKFLOWWORKID'
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'WUSERID'
      Required = True
    end
    object IntegerField3: TIntegerField
      FieldName = 'WSTATUS'
      Required = True
    end
    object ZQTaskHistWWORKFLOWSTEPID: TIntegerField
      FieldName = 'WWORKFLOWSTEPID'
      Required = True
    end
    object IntegerField5: TIntegerField
      FieldName = 'WLINKID'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DDATEACTION'
    end
    object StringField1: TStringField
      FieldName = 'SSTEPNAME'
      Size = 64
    end
    object StringField2: TStringField
      FieldName = 'SWORFLOWNAME'
      Size = 64
    end
    object BlobField1: TBlobField
      FieldName = 'PARAMS'
    end
    object BlobField2: TBlobField
      FieldName = 'STATUSTEXT'
    end
    object StringField3: TStringField
      FieldKind = fkCalculated
      FieldName = 'DISPLAYTEXT'
      Size = 255
      Calculated = True
    end
    object StringField4: TStringField
      FieldKind = fkCalculated
      FieldName = 'USER'
      Size = 80
      Calculated = True
    end
    object ZQTaskHistWWORKFLOWWORKHISID: TIntegerField
      FieldName = 'WWORKFLOWWORKHISID'
      Required = True
    end
    object ZQTaskHistFPERCENTAGECOMP: TFloatField
      FieldKind = fkCalculated
      FieldName = 'FPERCENTCOMP'
      Calculated = True
    end
    object ZQTaskHistWGROUPID: TIntegerField
      FieldName = 'WGROUPID'
      OnGetText = ZQWorkflowWGROUPIDGetText
    end
    object ZQTaskHistWDURATIONTYPE: TIntegerField
      FieldName = 'WDURATIONTYPE'
    end
    object ZQTaskHistWDURATIONINTERVAL: TIntegerField
      FieldName = 'WDURATIONINTERVAL'
    end
  end
  object ZqUsers: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'Select * from users')
    Left = 416
    Top = 244
    object ZqUsersWUSERID: TIntegerField
      FieldName = 'WUSERID'
      Required = True
    end
    object ZqUsersSPASSWORD: TStringField
      FieldName = 'SPASSWORD'
      Size = 8
    end
    object ZqUsersSUSERNAME: TStringField
      FieldName = 'SUSERNAME'
    end
    object ZqUsersSCREDITNOTENEXTNUMBER: TStringField
      FieldName = 'SCREDITNOTENEXTNUMBER'
      Size = 8
    end
    object ZqUsersSINVOICENEXTNUMBER: TStringField
      FieldName = 'SINVOICENEXTNUMBER'
      Size = 8
    end
    object ZqUsersSPURCHASENEXTNUMBER: TStringField
      FieldName = 'SPURCHASENEXTNUMBER'
      Size = 8
    end
    object ZqUsersSGOODSRETURNEDNEXTNUMBER: TStringField
      FieldName = 'SGOODSRETURNEDNEXTNUMBER'
      Size = 8
    end
    object ZqUsersSRECEIPTNEXTNUMBER: TStringField
      FieldName = 'SRECEIPTNEXTNUMBER'
      Size = 8
    end
    object ZqUsersSQUOTENEXTNUMBER: TStringField
      FieldName = 'SQUOTENEXTNUMBER'
      Size = 8
    end
    object ZqUsersSORDERNEXTNUMBER: TStringField
      FieldName = 'SORDERNEXTNUMBER'
      Size = 8
    end
    object ZqUsersSNEXTBATCHNUMBER: TStringField
      FieldName = 'SNEXTBATCHNUMBER'
      Size = 8
    end
    object ZqUsersBDISABLED: TSmallintField
      FieldName = 'BDISABLED'
    end
    object ZqUsersBACCOUNTS: TSmallintField
      FieldName = 'BACCOUNTS'
    end
    object ZqUsersBSTOCK: TSmallintField
      FieldName = 'BSTOCK'
    end
    object ZqUsersBBATCHENTRY: TSmallintField
      FieldName = 'BBATCHENTRY'
    end
    object ZqUsersBCREDITNOTE: TSmallintField
      FieldName = 'BCREDITNOTE'
    end
    object ZqUsersBINVOICES: TSmallintField
      FieldName = 'BINVOICES'
    end
    object ZqUsersBPURCHASES: TSmallintField
      FieldName = 'BPURCHASES'
    end
    object ZqUsersBSTOCKRETURNS: TSmallintField
      FieldName = 'BSTOCKRETURNS'
    end
    object ZqUsersBRECONCILIATION: TSmallintField
      FieldName = 'BRECONCILIATION'
    end
    object ZqUsersBCREDITORREPORTS: TSmallintField
      FieldName = 'BCREDITORREPORTS'
    end
    object ZqUsersBDEBTORREPORTS: TSmallintField
      FieldName = 'BDEBTORREPORTS'
    end
    object ZqUsersBLEDGERREPORTS: TSmallintField
      FieldName = 'BLEDGERREPORTS'
    end
    object ZqUsersBSTOCKREPORTS: TSmallintField
      FieldName = 'BSTOCKREPORTS'
    end
    object ZqUsersBUSERREPORTS: TSmallintField
      FieldName = 'BUSERREPORTS'
    end
    object ZqUsersBPOSTING: TSmallintField
      FieldName = 'BPOSTING'
    end
    object ZqUsersBGLOBALPROCESSES: TSmallintField
      FieldName = 'BGLOBALPROCESSES'
    end
    object ZqUsersBSYSTEMSETUP: TSmallintField
      FieldName = 'BSYSTEMSETUP'
    end
    object ZqUsersUSEREMAIL: TStringField
      FieldName = 'USEREMAIL'
      Size = 30
    end
    object ZqUsersBONLINE: TSmallintField
      FieldName = 'BONLINE'
    end
    object ZqUsersSPCIPADDRESS: TStringField
      FieldName = 'SPCIPADDRESS'
    end
    object ZqUsersDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZqUsersBEDITPRICES: TSmallintField
      FieldName = 'BEDITPRICES'
    end
    object ZqUsersBGLOBALSEQ: TSmallintField
      FieldName = 'BGLOBALSEQ'
    end
    object ZqUsersBCASHBOOK: TSmallintField
      FieldName = 'BCASHBOOK'
    end
    object ZqUsersBONLYPOS: TSmallintField
      FieldName = 'BONLYPOS'
    end
    object ZqUsersBPOSSUPER: TSmallintField
      FieldName = 'BPOSSUPER'
    end
    object ZqUsersBSEARCH: TSmallintField
      FieldName = 'BSEARCH'
    end
    object ZqUsersBEMAIL: TSmallintField
      FieldName = 'BEMAIL'
    end
    object ZqUsersBNOTUSED1: TSmallintField
      FieldName = 'BNOTUSED1'
    end
  end
  object ZQRights: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'select * from WORKFLOWRIGHTS'
      'where WWORKFLOWTYPEID =:WWORKFLOWTYPEID')
    UpdateObject = ZUsqlRights
    AfterInsert = ZQRightsAfterInsert
    Left = 232
    Top = 204
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WWORKFLOWTYPEID'
      end>
    object ZQRightsWWORKFLOWTYPEID: TIntegerField
      FieldName = 'WWORKFLOWTYPEID'
      Required = True
    end
    object ZQRightsWUSERID: TIntegerField
      FieldName = 'WUSERID'
      Required = True
    end
    object ZQRightsUSERLOOKUP: TStringField
      FieldKind = fkLookup
      FieldName = 'USERLOOKUP'
      LookupDataSet = ZqUsers
      LookupKeyFields = 'WUSERID'
      LookupResultField = 'SUSERNAME'
      KeyFields = 'WUSERID'
      Size = 40
      Lookup = True
    end
  end
  object ZUsqlRights: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO WORKFLOWRIGHTS'
      '  (WWORKFLOWTYPEID, WUSERID)'
      'VALUES'
      '  (:WWORKFLOWTYPEID, :WUSERID)')
    DeleteSQL.Strings = (
      'DELETE FROM WORKFLOWRIGHTS'
      'WHERE'
      '  WORKFLOWRIGHTS.WWORKFLOWTYPEID = :OLD_WWORKFLOWTYPEID AND'
      '  WORKFLOWRIGHTS.WUSERID = :OLD_WUSERID')
    ModifySQL.Strings = (
      'UPDATE WORKFLOWRIGHTS SET'
      '  WWORKFLOWTYPEID = :WWORKFLOWTYPEID,'
      '  WUSERID = :WUSERID'
      'WHERE'
      '  WORKFLOWRIGHTS.WWORKFLOWTYPEID = '
      ':OLD_WWORKFLOWTYPEID AND'
      '  WORKFLOWRIGHTS.WUSERID = :OLD_WUSERID')
    Left = 232
    Top = 252
  end
  object sqlTasklist: TSQLHOLDER
    SQL.Strings = (
      ' a.*,b.SSTEPNAME,c.SWORFLOWNAME ,c.WGroupid,'
      'b.statustext ,b.WDURATIONTYPE,b.WDURATIONINTERVAL'
      
        'from  WORKFLOWWORK a join WORKFLOWSTEPS b on  a.WWORKFLOWSTEPID ' +
        '=  b.WWORKFLOWSTEPID'
      'join WORKFLOWTYPES c on b.WSTEPTYPEID= c.WWORKFLOWTYPEID'
      '')
    Left = 508
    Top = 236
  end
  object ZSQLProcessor1: TUniScript
    SQL.Strings = (
      'CREATE TABLE WORKFLOWTYPES'
      '('
      '  WWORKFLOWTYPEID Integer NOT NULL,'
      '  SWORFLOWNAME Varchar(64),'
      '  BDISABLE Integer,'
      '  STARTSTEP Integer,'
      '  GUID Varchar(60),'
      '  PRIMARY KEY (WWORKFLOWTYPEID)'
      ');'
      'CREATE TABLE WORKFLOWSTEPS'
      '('
      '  WWORKFLOWSTEPID Integer NOT NULL,'
      '  SSTEPNAME Varchar(64),'
      '  WSTEPTYPEID Integer NOT NULL,'
      '  SPARAMS Blob sub_type 0,'
      '  WSTATUSID Smallint NOT NULL,'
      '  WDURATIONTYPE Integer,'
      '  WDURATIONINTERVAL Integer,'
      '  WUSERID Integer,'
      '  WXPOS Integer,'
      '  WYPOS Integer,'
      '  WWIDTH Integer,'
      '  WHEIGHT Integer,'
      '  SREMARK Blob sub_type 0,'
      '  SSQLSTEP Blob sub_type 0,'
      '  SSQLBACK Blob sub_type 0,'
      '  STATUSTEXT Blob sub_type 0,'
      '  PRIMARY KEY (WWORKFLOWSTEPID)'
      ');'
      ''
      'ALTER TABLE WORKFLOWSTEPS ADD CONSTRAINT FK_WORKFLOWSTEPS_TYPES'
      
        '  FOREIGN KEY (WSTEPTYPEID) REFERENCES WORKFLOWTYPES (WWORKFLOWT' +
        'YPEID) ON UPDATE CASCADE ON DELETE CASCADE;'
      'CREATE TABLE WORKFLOWTRANSITIONS'
      '('
      '  WWORKFLOWTRANSID Integer NOT NULL,'
      '  STRANSNAME Varchar(64),'
      '  SCONDITION Blob sub_type 0,'
      '  WFROMWORKFLOWSTEPID Integer NOT NULL,'
      '  WTOWORKFLOWSTEPID Integer NOT NULL,'
      '  PRIMARY KEY (WWORKFLOWTRANSID)'
      ');'
      'CREATE TABLE WORKFLOWWORK'
      '('
      '  WWORKFLOWWORKID Integer NOT NULL,'
      '  WUSERID Integer NOT NULL,'
      '  WSTATUS Integer NOT NULL,'
      '  WWORKFLOWSTEPID Integer NOT NULL,'
      '  WLINKID Integer,'
      '  DDATEACTION Timestamp,'
      '  PARAMS Blob sub_type 0,'
      '  PRIMARY KEY (WWORKFLOWWORKID)'
      ');'
      ''
      'ALTER TABLE WORKFLOWWORK ADD CONSTRAINT FK_WORKFLOWWORK_STEP'
      
        '  FOREIGN KEY (WWORKFLOWSTEPID) REFERENCES WORKFLOWSTEPS (WWORKF' +
        'LOWSTEPID) ON UPDATE SET NULL ON DELETE SET NULL;'
      'CREATE TABLE WORKFLOWWORKHIS'
      '('
      '  WWORKFLOWWORKHISID Integer NOT NULL,'
      '  WWORKFLOWWORKID Integer,'
      '  WUSERID Integer NOT NULL,'
      '  WSTATUS Integer NOT NULL,'
      '  WWORKFLOWSTEPID Integer NOT NULL,'
      '  WLINKID Integer,'
      '  DDATEACTION Timestamp,'
      '  PARAMS Blob sub_type 0,'
      '  PRIMARY KEY (WWORKFLOWWORKHISID)'
      ');'
      ''
      'ALTER TABLE WORKFLOWWORKHIS ADD CONSTRAINT FK_WORKFLOWWORKHIS_WF'
      
        '  FOREIGN KEY (WWORKFLOWWORKID) REFERENCES WORKFLOWWORK (WWORKFL' +
        'OWWORKID) ON UPDATE CASCADE ON DELETE CASCADE;'
      'CREATE GENERATOR GEN_WF_WORK;'
      'CREATE GENERATOR GEN_WF_TRANS;'
      'CREATE GENERATOR GEN_WF_HIST;'
      'CREATE GENERATOR GEN_WF_STEP;')
    Left = 128
    Top = 204
  end
  object ZSQLProcessor2: TUniScript
    SQL.Strings = (
      'CREATE TABLE WORKFLOWRIGHTS'
      '('
      '  WWORKFLOWTYPEID Integer NOT NULL,'
      '  WUSERID Integer NOT NULL,'
      '  PRIMARY KEY (WWORKFLOWTYPEID,WUSERID)'
      ');'
      'ALTER TABLE WORKFLOWTYPES ADD '
      'WGROUPID Integer;'
      'ALTER TABLE WORKFLOWRIGHTS ADD CONSTRAINT FK_WORKFLOWRIGHTS_USER'
      
        '  FOREIGN KEY (WUSERID) REFERENCES USERS (WUSERID) ON UPDATE CAS' +
        'CADE ON DELETE CASCADE;'
      'ALTER TABLE WORKFLOWRIGHTS ADD CONSTRAINT FK_WORKFLOWRIGHTS_WORK'
      
        '  FOREIGN KEY (WWORKFLOWTYPEID) REFERENCES WORKFLOWTYPES (WWORKF' +
        'LOWTYPEID) ON UPDATE CASCADE ON DELETE CASCADE;'
      ''
      
        'INSERT INTO TYPES (WTYPEID, SDESCRIPTION, WTYPEPARENT) VALUES ('#39 +
        '120'#39', '#39'Workflowtypes'#39', '#39'2'#39');')
    Left = 128
    Top = 256
  end
  object ZSQLProcessor3: TUniScript
    SQL.Strings = (
      'CREATE TABLE WORKFLOW_ENTITYLINK'
      '('
      '  WWORKFLOWWORKID Integer NOT NULL,'
      '  WENTITYID Integer NOT NULL,'
      '  ENTITYTYPE Integer NOT NULL,'
      '  PRIMARY KEY (WWORKFLOWWORKID,WENTITYID,ENTITYTYPE)'
      ') ;'
      
        'ALTER TABLE WORKFLOW_ENTITYLINK ADD CONSTRAINT FK_WORKFLOW_ENTIT' +
        '_WORKFLOW'
      
        '  FOREIGN KEY (WWORKFLOWWORKID) REFERENCES WORKFLOWWORK (WWORKFL' +
        'OWWORKID) ON UPDATE CASCADE ON DELETE CASCADE'
      ';')
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    Left = 132
    Top = 336
  end
  object UniScript1: TUniScript
    SQL.Strings = (
      'ALTER TABLE WORKFLOWTRANSITIONS ADD '
      'WLEFTMARK Integer, add '
      'WTOPMARK Integer, ADD '
      'WLEFTENDMARK Integer, add '
      'WTOPENDMARK Integer'
      ';')
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    Left = 160
    Top = 400
  end
end
