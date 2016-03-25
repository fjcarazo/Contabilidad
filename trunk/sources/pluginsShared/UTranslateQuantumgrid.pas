unit UTranslateQuantumgrid;

interface


procedure InitQuantumgridLang;

implementation
Uses

  UDMTCCoreLink ,cxGridStrs, cxFilterConsts,cxFilterControlStrs,
  cxClasses;


procedure InitQuantumgridLang;

  procedure CheckAndAdd(ANumber:Integer ;RecourcePointer: Pointer);
  var
   Language : String ;
  begin
       Language := DMTCCoreLink.GetTextLang(ANumber) ;
       if Language <> '' then
          cxclasses.cxSetResourceString(RecourcePointer,Language);
  end;

begin
     CheckAndAdd(20000, @scxGridRecursiveLevels);
     CheckAndAdd(20001, @scxGridDeletingConfirmationCaption);
     CheckAndAdd(20002, @scxGridDeletingFocusedConfirmationText);
     CheckAndAdd(20003, @scxGridDeletingSelectedConfirmationText);
     CheckAndAdd(20004, @scxGridNewItemRowInfoText);
     CheckAndAdd(20005, @scxGridFilterIsEmpty);
     CheckAndAdd(20006, @scxGridCustomizationFormCaption);
     CheckAndAdd(20007, @scxGridCustomizationFormColumnsPageCaption);
     CheckAndAdd(20008, @scxGridGroupByBoxCaption);

     CheckAndAdd(20009, @scxGridFilterCustomizeButtonCaption);
     CheckAndAdd(20010, @scxGridCustomizationFormBandsPageCaption);
     CheckAndAdd(20011, @scxGridConverterIntermediaryMissing);
     CheckAndAdd(20012, @scxGridConverterNotExistGrid);
     CheckAndAdd(20013, @scxGridConverterNotExistComponent);
     CheckAndAdd(20014, @scxImportErrorCaption);
     CheckAndAdd(20015, @scxNotExistGridView);
     CheckAndAdd(20016, @scxNotExistGridLevel);
     CheckAndAdd(20017, @scxCantCreateExportOutputFile);
     CheckAndAdd(20018, @cxSEditRepositoryExtLookupComboBoxItem);


CheckAndAdd(20093,@cxSFilterBoolOperatorAnd);
CheckAndAdd(20094,@cxSFilterBoolOperatorOr);
CheckAndAdd(20095,@cxSFilterBoolOperatorNotAnd);
CheckAndAdd(20096,@cxSFilterBoolOperatorNotOr);
CheckAndAdd(20097,@cxSFilterRootButtonCaption);
CheckAndAdd(20098,@cxSFilterAddCondition);
CheckAndAdd(20099,@cxSFilterAddGroup);
CheckAndAdd(20100,@cxSFilterRemoveRow );
CheckAndAdd(20101,@cxSFilterClearAll);
CheckAndAdd(20102,@cxSFilterFooterAddCondition);
CheckAndAdd(20103,@cxSFilterGroupCaption);
CheckAndAdd(20104,@cxSFilterRootGroupCaption );
CheckAndAdd(20105,@cxSFilterControlNullString );
CheckAndAdd(20106,@cxSFilterErrorBuilding);
CheckAndAdd(20107,@cxSFilterDialogCaption);
CheckAndAdd(20108,@cxSFilterDialogInvalidValue);
CheckAndAdd(20109,@cxSFilterDialogUse);
CheckAndAdd(20110,@cxSFilterDialogSingleCharacter);
CheckAndAdd(20111,@cxSFilterDialogCharactersSeries);
CheckAndAdd(20112,@cxSFilterDialogOperationAnd);
CheckAndAdd(20113,@cxSFilterDialogOperationOr);
CheckAndAdd(20114,@cxSFilterDialogRows);
CheckAndAdd(20115,@cxSFilterControlDialogCaption);
CheckAndAdd(20116,@cxSFilterControlDialogNewFile);
CheckAndAdd(20117,@cxSFilterControlDialogOpenDialogCaption);
CheckAndAdd(20118,@cxSFilterControlDialogSaveDialogCaption);
CheckAndAdd(20119,@cxSFilterControlDialogActionSaveCaption );
CheckAndAdd(20120,@cxSFilterControlDialogActionOpenCaption );
CheckAndAdd(20121,@cxSFilterControlDialogActionApplyCaption );
CheckAndAdd(167,@cxSFilterControlDialogActionOkCaption);
CheckAndAdd(168,@cxSFilterControlDialogActionCancelCaption);
CheckAndAdd(20122,@cxSFilterControlDialogFileExt);
CheckAndAdd(20123,@cxSFilterControlDialogFileFilter);

CheckAndAdd(20019,@cxSFilterOperatorEqual);


CheckAndAdd(20020,@cxSFilterOperatorNotEqual);
CheckAndAdd(20021,@cxSFilterOperatorLess);
CheckAndAdd(20022,@cxSFilterOperatorLessEqual);
CheckAndAdd(20023,@cxSFilterOperatorGreater);
CheckAndAdd(20024,@cxSFilterOperatorGreaterEqual);
CheckAndAdd(20025,@cxSFilterOperatorLike);
CheckAndAdd(20026,@cxSFilterOperatorNotLike);
CheckAndAdd(20027,@cxSFilterOperatorBetween);
CheckAndAdd(20028,@cxSFilterOperatorNotBetween);
CheckAndAdd(20029,@cxSFilterOperatorInList);
CheckAndAdd(20030,@cxSFilterOperatorNotInList);
CheckAndAdd(20031,@cxSFilterOperatorYesterday);
CheckAndAdd(20032,@cxSFilterOperatorToday);
CheckAndAdd(20033,@cxSFilterOperatorTomorrow);
CheckAndAdd(20034,@cxSFilterOperatorLastWeek);
CheckAndAdd(20035,@cxSFilterOperatorLastMonth);
CheckAndAdd(20036,@cxSFilterOperatorLastYear);
CheckAndAdd(20037,@cxSFilterOperatorThisWeek);
CheckAndAdd(20038,@cxSFilterOperatorThisMonth);
CheckAndAdd(20039,@cxSFilterOperatorThisYear);
CheckAndAdd(20040,@cxSFilterOperatorNextWeek);
CheckAndAdd(20041,@cxSFilterOperatorNextMonth);
CheckAndAdd(20042,@cxSFilterOperatorNextYear);
CheckAndAdd(20043,@cxSFilterAndCaption);
CheckAndAdd(20044,@cxSFilterOrCaption);
CheckAndAdd(20045,@cxSFilterNotCaption);
CheckAndAdd(20046,@cxSFilterBlankCaption);
CheckAndAdd(20047,@cxSFilterOperatorIsNull);
CheckAndAdd(20048,@cxSFilterOperatorIsNotNull);
CheckAndAdd(20049,@cxSFilterOperatorBeginsWith);
CheckAndAdd(20050,@cxSFilterOperatorDoesNotBeginWith);
CheckAndAdd(20051,@cxSFilterOperatorEndsWith);
CheckAndAdd(20052,@cxSFilterOperatorDoesNotEndWith);
CheckAndAdd(20053,@cxSFilterOperatorContains);
CheckAndAdd(20054,@cxSFilterOperatorDoesNotContain);
CheckAndAdd(20055,@cxSFilterBoxAllCaption);
CheckAndAdd(20056,@cxSFilterBoxCustomCaption);
CheckAndAdd(20057,@cxSFilterBoxBlanksCaption);
CheckAndAdd(20058,@cxSFilterBoxNonBlanksCaption);
CheckAndAdd(20124, @scxGridNoDataInfoText);
end;
end.
