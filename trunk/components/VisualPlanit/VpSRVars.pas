{*********************************************************}
{*                    VPSR.INC 1.03                      *}
{*********************************************************}

{* ***** BEGIN LICENSE BLOCK *****                                            *}
{* Version: MPL 1.1                                                           *}
{*                                                                            *}
{* The contents of this file are subject to the Mozilla Public License        *}
{* Version 1.1 (the "License"); you may not use this file except in           *}
{* compliance with the License. You may obtain a copy of the License at       *}
{* http://www.mozilla.org/MPL/                                                *}
{*                                                                            *}
{* Software distributed under the License is distributed on an "AS IS" basis, *}
{* WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License   *}
{* for the specific language governing rights and limitations under the       *}
{* License.                                                                   *}
{*                                                                            *}
{* The Original Code is TurboPower Visual PlanIt                              *}
{*                                                                            *}
{* The Initial Developer of the Original Code is TurboPower Software          *}
{*                                                                            *}
{* Portions created by TurboPower Software Inc. are Copyright (c) 2002        *}
{* TurboPower Software Inc. All Rights Reserved.                              *}
{*                                                                            *}
{* Contributor(s):                                                            *}
{*                                                                            *}
{* ***** END LICENSE BLOCK *****                                              *}

{Visual PlanIt String Resources - To create language specific versions of
 Visual PlanIt controls, translate these strings to the desired language
 and re-compile your application.}
unit VpSRVars;
  {- Visual PlanIt String Resources}

interface
var
  RSNoneStr              : string   = '(None)';
  RSYes                  : string      = 'Y';
  RSNo                   : string      = 'N';
  RSTrue                 : string      = 'T';
  RSFalse                : string      = 'F';
  RSTallShortChars       : string      = 'Wy';
  RSDelete               : string      = 'Delete';
  RSNotDoneYet           : string      = 'This feature is not implemented at this time.';
  RSNoTimersAvail        : string      = 'No Window''s timers are available.';
  RSBadTriggerHandle     : string      = 'Invalid trigger handle.';
  RSEditingItems         : string      = 'Folder Items Editor.';
  RSEditingFolders       : string      = 'Folder Editor.';
  RSExclusiveEventConflict: string     = 'Conflicts with another exclusive event.';
  RSBackwardTimesError    : string     = 'The end time cannot precede the start time.';
  RSDBPostError           : string     = 'Error posting data to the database.';
  RSMonthConvertError     : string     = 'Error converting the month number.';
  RSInvalidDay            : string     = 'Error: Invalid Day.';
  RSInvalidDate           : string     = 'Error: Invalid Date.';
  RSInvalidMonth          : string     = 'Error: Invalid Month.';
  RSInvalidMonthName      : string     = 'Error: Invalid Month Name.';
  RSInvalidYear           : string     = 'Error: Invalid Year.';
  RSDayIsRequired         : string     = 'Error: Day is required.';
  RSMonthIsRequired       : string     = 'Error: Month Is Required.';
  RSYearIsRequired        : string     = 'Error: Year is required.';
  RSNameIsRequired        : string     = 'Error: Name cannot be empty.';
  RSFailToCreateTask      : string     = 'Error: Failure while creating Task.';
  RSFailToCreateEvent     : string     = 'Error: Failure while creating Event.';
  RSFailToCreateContact   : string     = 'Error: Failure while creating Contact.';
  RSFailToCreateResource  : string     = 'Error: Failure while creating Resource.';
  RSDuplicateResource     : string     = 'Error: Duplicate Resource.';
  RSInvalidTableSpecified : string     = 'Error: Invalid table specified.';
  RSUnableToOpen          : string     = 'Error: Unable to open ';
  RSSQLUpdateError        : string     = 'Error: Unable to update ';                {!!.01}

  RSPhoneTypeLabel1       : string     = 'Assistant';
  RSPhoneTypeLabel2       : string     = 'Callback';
  RSPhoneTypeLabel3       : string     = 'Car';
  RSPhoneTypeLabel4       : string     = 'Company';
  RSPhoneTypeLabel5       : string     = 'Home';
  RSPhoneTypeLabel6       : string     = 'Home Fax';
  RSPhoneTypeLabel7       : string     = 'ISDN';
  RSPhoneTypeLabel8       : string     = 'Mobile';
  RSPhoneTypeLabel9       : string     = 'Other';
  RSPhoneTypeLabel10      : string     = 'Other Fax';
  RSPhoneTypeLabel11      : string     = 'Pager';
  RSPhoneTypeLabel12      : string     = 'Primary';
  RSPhoneTypeLabel13      : string     = 'Radio';
  RSPhoneTypeLabel14      : string     = 'Telex';
  RSPhoneTypeLabel15      : string     = 'TTY/TDD';
  RSPhoneTypeLabel16      : string     = 'Work';
  RSPhoneTypeLabel17      : string     = 'Work Fax';

  RSCategoryLabel1        : string     = 'Business';
  RSCategoryLabel2        : string     = 'Clients';
  RSCategoryLabel3        : string     = 'Family';
  RSCategoryLabel4        : string     = 'Personal';
  RSCategoryLabel5        : string     = 'Other';

  RSWeekOf                : string     = 'Week of';
  RSThrough               : string     = 'Through';
  RSSunday                : string     = 'Sunday';
  RSMonday                : string     = 'Monday';
  RSTuesday               : string     = 'Tuesday';
  RSWednesday             : string     = 'Wednesday';
  RSThursday              : string     = 'Thursday';
  RSFriday                : string     = 'Friday';
  RSSaturday              : string     = 'Saturday';
  RSASunday               : string     = 'Sun';
  RSAMonday               : string     = 'Mon';
  RSATuesday              : string     = 'Tue';
  RSAWednesday            : string     = 'Wed';
  RSAThursday             : string     = 'Thu';
  RSAFriday               : string     = 'Fri';
  RSASaturday             : string     = 'Sat';
  RSLSunday               : string     = 'S';
  RSLMonday               : string     = 'M';
  RSLTuesday              : string     = 'T';
  RSLWednesday            : string     = 'W';
  RSLThursday             : string     = 'T';
  RSLFriday               : string     = 'F';
  RSLSaturday             : string     = 'S';
  RSNone                  : string     = 'None';
  RSDaily                 : string     = 'Daily';
  RSWeekly                : string     = 'Weekly';
  RSMonthlyByDay          : string     = 'Monthly By Day';
  RSMonthlyByDate         : string     = 'Monthly By Date';
  RSYearlyByDay           : string     = 'Yearly By Day';
  RSYearlyByDate          : string     = 'Yearly By Date';
  RSCustom                : string     = 'Custom';
  RSMinutes               : string     = 'Minutes';
  RSHours                 : string     = 'Hours';
  RSDays                  : string     = 'Days';

  {WARNINGS}
  RSPermanent             : string     = 'This operation cannot be undone!';

  {Contact Specific}
  RSFromContactList       : string     = 'from your list of contacts?';
  RSContactPopupAdd       : string     = 'Add Contact...';
  RSContactPopupEdit      : string     = 'Edit Contact...';
  RSContactPopupDelete    : string     = 'Delete Contact...';

  {Event Specific}
  RSFromSchedule          : string     = 'from your schedule?';

  {Task Specific}
  RSFromTaskList          : string     = 'from your task list?';
  RSTaskPopupAdd          : string     = 'Add Task...';
  RSTaskPopupEdit         : string     = 'Edit Task...';
  RSTaskPopupDelete       : string     = 'Delete Task...';
  RSTaskTitleResource     : string     = 'Task List - ';                            {!!.01}
  RSTaskTitleNoResource   : string     = 'Task List';                               {!!.01}

  {Month Specific}
  RSMonthPopupToday       : string     = 'Today';
  RSMonthPopupNextMonth   : string     = 'Next Month';
  RSMonthPopupPrevMonth   : string     = 'Previous Month';
  RSMonthPopupNextYear    : string     = 'Next Year';
  RSMonthPopupPrevYear    : string     = 'Previous Year';

  {Week Specific}
  RSWeekPopupAdd          : string     = 'Add Event...';
  RSWeekPopupEdit         : string     = 'Edit Event...';
  RSWeekPopupDelete       : string     = '&Delete Event...';
  RSWeekPopupNav          : string     = 'Change Date';
  RSWeekPopupNavToday     : string     = 'Today';
  RSWeekPopupNavNextWeek  : string     = 'Next Week';
  RSWeekPopupNavPrevWeek  : string     = 'Previous Week';
  RSWeekPopupNavNextMonth : string     = 'Next Month';
  RSWeekPopupNavPrevMonth : string     = 'Previous Month';
  RSWeekPopupNavNextYear  : string     = 'Next Year';
  RSWeekPopupNavPrevYear  : string     = 'Previous Year';

  { Print Preview Specific }
  RSPrintPrvPrevPage      : string     = 'Previous Page';
  RSPrintPrvNextPage      : string     = 'Next Page';
  RSPrintPrvFirstPage     : string     = 'First Page';
  RSPrintPrvLastPage      : string     = 'Last Page';

  { DayView Specific }
  RSDayPopupAdd           : string     = 'Add Event...';
  RSDayPopupEdit          : string     = 'Edit Event...';
  RSDayPopupDelete        : string     = 'Delete Event...';
  RSDayPopupNav           : string     = 'Change Date';
  RSDayPopupNavToday      : string     = 'Today';
  RSDayPopupNavTomorrow   : string     = 'Tomorrow';
  RSDayPopupNavYesterday  : string     = 'Yesterday';
  RSDayPopupNavNextDay    : string     = 'Next Day';
  RSDayPopupNavPrevDay    : string     = 'Previous Day';
  RSDayPopupNavNextWeek   : string     = 'Next Week';
  RSDayPopupNavPrevWeek   : string     = 'Previous Week';
  RSDayPopupNavNextMonth  : string     = 'Next Month';
  RSDayPopupNavPrevMonth  : string     = 'Previous Month';
  RSDayPopupNavNextYear   : string     = 'Next Year';
  RSDayPopupNavPrevYear   : string     = 'Previous Year';
  RSHintToday             : string     = 'Today';                                   {!!.01}
  RSHintTomorrow          : string     = 'Tomorrow';                                {!!.01}
  RSHintYesterday         : string     = 'Yesterday';                               {!!.01}
  RSHintNextWeek          : string     = 'Next Week';                               {!!.01}
  RSHintPrevWeek          : string     = 'Previous Week';                           {!!.01}

  { field names }
  RSPosition              : string     = 'Position';
  RSCompany               : string     = 'Company';
  RSTitle                 : string     = 'Title';
  RSEMail                 : string     = 'E-Mail';
  RSCountry               : string     = 'Country';
  RSCategory              : string     = 'Category';
  RSNotes                 : string     = 'Notes';

  RSCustom1               : string     = 'Custom 1';
  RSCustom2               : string     = 'Custom 2';
  RSCustom3               : string     = 'Custom 3';
  RSCustom4               : string     = 'Custom 4';

  { Generic Dialog Captions }
  RSOKBtn                 : string     = 'OK';
  RSCancelBtn             : string     = 'Cancel';
  RSCloseBtn              : string     = '&Close';
  RSPrintBtn              : string     = '&Print';
  RSUntitled              : string     = 'Untitled';

  {Sound Selection Dialog}
  RSSelectASound          : string     = 'Select A Sound';
  RSSoundFinder           : string     = 'Sound Finder';
  RSDefaultSound          : string     = 'Use the default sound';

  { Event Edit Dialog Captions }
  RSDlgEventEdit          : string     = 'Event';
  RSAppointmentGroupBox   : string     = 'Appointment';
  RSDescriptionLbl        : string     = 'Subject:';
  RSCategoryLbl           : string     = 'Category:';
  RSStartTimeLbl          : string     = 'Start Time:';
  RSEndTimeLbl            : string     = 'End Time:';
  RSAlarmSet              : string     = '&Reminder';
  RSRecurringLbl          : string     = 'Appointment Recurrence:';
  RSIntervalLbl           : string     = 'Interval (days):';
  RSRecurrenceEndsLbl     : string     = 'Repeat Until:';
  RSAllDayEvent           : string     = '&All Day Event';
  RSNotesLbl              : string     = 'Notes:';

  { Contact Edit Dialog Captions }
  RSDlgContactEdit        : string     = 'Contact';
  RSPhone1                : string     = 'Telephone 1';
  RSPhone2                : string     = 'Telephone 2';
  RSFax                   : string     = 'Fax';
  RSNameLbl               : string     = 'Name:';
  RSTitleLbl              : string     = 'Title:';
  RSAddressLbl            : string     = 'Address:';
  RSCityLbl               : string     = 'City:';
  RSStateLbl              : string     = 'State:';
  RSCountryLbl            : string     = 'Country:';
  RSZipCodeLbl            : string     = 'Zip Code:';
  RSCompanyLbl            : string     = 'Company:';
  RSPositionLbl           : string     = 'Position:';

  { Print Preview dialog captions }
  RSDlgPrintPreview       : string    = 'Print Preview';

  { Task Edit Dialog Captions }
  RSDlgTaskEdit           : string    = 'Task';
  RSDueDate               : string    = 'Due Date:';
  RSDetails               : string    = 'Details:';
  RSComplete              : string    = 'Task complete';
  RSDaysOverdue           : string    = ' Days overdue';
  RSCreatedOn             : string    = 'Created on';
  RSCompletedOn           : string    = 'Completed on';

  { Reminder Dialog Captions}
  RSReminder              : string    = 'Reminder';
  RSOverdue               : string    = 'OVERDUE!';
  RSSnoozeCaption         : string    = 'Click &Snooze to be reminded again in:';
  RSSubjectCaption        : string    = 'Subject:';
  RSNotesCaption          : string    = 'Notes:';
  RSDismissBtn            : string    = '&Dismiss';
  RSSnoozeBtn             : string    = '&Snooze';
  RSOpenItemBtn           : string    = '&Open Item';
  RS5Minutes              : string    = '5 Minutes';
  RS10Minutes             : string    = '10 Minutes';
  RS15Minutes             : string    = '15 Minutes';
  RS30Minutes             : string    = '30 Minutes';
  RS45Minutes             : string    = '45 Minutes';
  RS1Hour                 : string    = '1 Hour';
  RS2Hours                : string    = '2 Hours';
  RS3Hours                : string    = '3 Hours';
  RS4Hours                : string    = '4 Hours';
  RS5Hours                : string    = '5 Hours';
  RS6Hours                : string    = '6 Hours';
  RS7Hours                : string    = '7 Hours';
  RS8Hours                : string    = '8 Hours';
  RS1Days                 : string    = '1 Day';
  RS2Days                 : string    = '2 Days';
  RS3Days                 : string    = '3 Days';
  RS4Days                 : string    = '4 Days';
  RS5Days                 : string    = '5 Days';
  RS6Days                 : string    = '6 Days';
  RS1Week                 : string    = '1 Week';

  { Calendar }
  RSCalendarPrevMonth     : string    = 'Previous Month';
  RSCalendarNextMonth     : string    = 'Next Month';
  RSCalendarPrevYear      : string    = 'Previous Year';
  RSCalendarNextYear      : string    = 'Next Year';
  RSCalendarToday         : string    = 'Today';
  RSCalendarRevert        : string    = 'Revert';

  RSCalendarPopupToday    : string    = 'Today';
  RSCalendarPopupNextMonth: string    = 'Next Month';
  RSCalendarPopupPrevMonth: string    = 'Previous Month';
  RSCalendarPopupNextYear : string    = 'Next Year';
  RSCalendarPopupPrevYear : string    = 'Previous Year';
  RSCalendarPopupRevert   : string    = 'Revert';

  { XML }
  sIENotInstalled    : string   = 'Cannot open WININET, Microsoft IE required';
  sOpenFileFailed    : string   = 'Unable to open file ';
  sFileNotFound      : string   = 'File %s could not be found';
  sAllocSrcMemFailed : string   = 'Unable to allocate memory for XML source';
  sHttpReadReqFailed : string   = 'Http read request failed';
  sHttpDataNotAvail  : string   = 'Http data not available';
  sHttpReqSendFailed : string   = 'Unable to send http request';
  sHttpReqOpenFailed : string   = 'Unable to open http request';
  sInetConnectFailed : string   = 'Unable to make Internet connection';
  sInetOpenFailed    : string   = 'Unable to open Internet';
  sInvalidFtpLoc     : string   = 'Invalid ftp location';
  sInvalidFtpDir     : string   = 'Invalid ftp directory';
  sFtpReadReqFailed  : string   = 'Ftp read request failed';
  sFtpDataNotAvail   : string   = 'Ftp data not available';
  sFtpOpenFileFailed : string   = 'Unable to open ftp file';
  sFtpPutFileFailed  : string   = 'Could not save file via ftp to %s';
  sSrcLoadFailed     : string   = 'Unable to load source ';
  sInvalidMemPtr     : string   = 'Invalid memory Pointer';
  sFmtErrorMsg       : string   = 'Line: %d Col: %d Error: %s';
  sIndexOutOfBounds  : string   = 'ERROR INDEX OUT OF BOUNDS';
  sExpMarkupDecl     : string   = 'Expected markup declaration, but found: ';
  sIllAttrType       : string   = 'Illegal attribute type: ';
  sIllAttrDefKeyw    : string   = 'Illegal keyword for attribute default value: ';
  sSysIdMissing      : string   = 'System identifier missing ';
  sExtModifMissing   : string   = 'External modifier missing: ';
  sIllCondSectStart  : string   = 'Conditional section must begin with INCLUDE or IGNORE';
  sBadSepInModel     : string   = 'Bad separator in content model: ';
  sExpCommentOrCDATA : string   = 'Expected comment or CDATA section ';
  sUnexpectedEof     : string   = 'Unexpected end of file ';
  sMismatchEndTag    : string   = 'Mismatched end tag: ';
  sIllCharInRef      : string   = 'Illegal character in reference';
  sUndeclaredEntity  : string   = 'Reference to undeclared entity: ';
  sExpectedString    : string   = 'Expected String: ';
  sSpaceExpectedAt   : string   = 'Whitespace expected at byte ';
  sUnexpEndOfInput   : string   = 'End of input while looking for delimiter: ';
  sQuoteExpected     : string   = 'Expected " or ' + Chr (39);
  sInvalidXMLVersion : string   = 'XMLPartner does not support XML specification greater than %s';
  sUnableCreateStr   : string   = 'Unable to create stream for input.';
  sInvalidName       : string   = 'Invalid XML name: ';
  sInvalidCommentText: string   = 'Invalid comment text';
  sCommentBeforeXMLDecl: string    = 'Document cannot start with a comment if it also contains an XML declaration';
  sInvalidCDataSection : string   = 'Invalid characters in CDATA section';
  sRedefinedAttr     : string   = 'Attributes cannot be redefined in a start tag';
  sCircularEntRef    : string   = 'Circular reference to: ';
  sInvAttrChar       : string   = 'Invalid character in attribute value: ';
  sInvPCData         : string   = 'Invalid characters in element''s character data: ';
  sDataAfterValDoc   : string   = 'There is invalid data after valid XML document';
  sNoIntConditional  : string   = 'Conditional sections not allowed in internal subset of document type declaration';
  sNotationNotDeclared: string    = 'Notation not declared: ';
  sInvPubIDChar      : string   = 'Invalid PublicID character: ';
  sNoNDATAInPeDecl   : string   = 'NDATA not allowed in parameter entity declaration';
  sInvStandAloneVal  : string   = 'Standalone value must equal ''yes'' or ''no''';
  sInvEncName        : string   = 'Invalid encoding declaration: ';
  sInvVerNum         : string   = 'Invalid XML version number: ';
  sInvEntityValue    : string   = 'Invalid character in entity value: ';
  sNoCommentInMarkup : string   = 'Comments can not be placed within other markup';
  sNoPEInIntDTD      : string   = 'Parameter entities not allowed in DTD internal subset';
  sXMLDecNotAtBeg   : string   =  'The XML declaration must appear before the first element';
  sInvalidElementName: string    = 'Invalid element name: ';
  sBadParamEntNesting: string    = 'Parameter-entity text must be properly nested: ';
  sInvalidCharEncoding: string    = 'Invalid character encoding specified.';
  sAttrNotNum        : string   = 'Attribute %s of element %s does not have an integer value.';
  sUnknownAxis       : string   = 'Unknown axis specifier: %s';

  {xpchrstm related errors}
  sInvalidXMLChar   : string    = 'Invalid XML Character found';
  sInvalidBEChar    : string    = 'Invalid (big-endian) UTF-16 character encoding';
  sInvalidLEChar    : string    = 'Invalid (little-endian) UTF-16 character encoding';
  sBadUTF8Char      : string    = 'Badly formed UTF-8 character in stream';
  sErrEndOfDocument : string    = 'Unexpected end of document stream';
  sUCS_ISOConvertErr: string    = 'Cannot convert UCS-4 character to ISO-8859-1';
  sUCS_U16ConvertErr: string    = 'Cannot convert UCS-4 character to UTF-16';
  sUCS_U8ConverErr  : string    = 'Cannot convert UCS-4 character to UTF-8';

  { Misc Exceptions and Errors }

  RSOutOfRange      : string    = 'Out of range';
  RSNotSupported    : string    = 'not supported';
  RSNeedElementName : string    = 'Please supply an Element Name';
  RSNeedFormatName  : string    = 'FormatName cannot be blank';
  RSPrtControlOwner : string    = 'Print controller is not owned by a TVpControlLink!';
  RSBadPrintFormat  : string    = 'Invalid print format ';
  RSBadItemType     : string    = 'Invalid item type ';
  RSBadMeasurement  : string    = 'Invalid measurement';
  RSOwnerNotWinCtrl : string    = 'Owner must be a TWinControl descendent';
  RSNoControlLink   : string    = 'Component must be linked to a TVpControlLink';
  RSNoPrintFormats  : string    = 'No print formats have been defined';             {!!.01}
  RSNoCanvas        : string    = 'TCanvas not assigned';                           {!!.01}
  RSNoLocalizationFile : string   = 'Localization file not found.';                 {!!.02}

  { Misc strings }

  RSCategoryDesc0   : string    = 'Category 0';                                     {!!.01}
  RSCategoryDesc1   : string    = 'Category 1';                                     {!!.01}
  RSCategoryDesc2   : string    = 'Category 2';                                     {!!.01}
  RSCategoryDesc3   : string    = 'Category 3';                                     {!!.01}
  RSCategoryDesc4   : string    = 'Category 4';                                     {!!.01}
  RSCategoryDesc5   : string    = 'Category 5';                                     {!!.01}
  RSCategoryDesc6   : string    = 'Category 6';                                     {!!.01}
  RSCategoryDesc7   : string    = 'Category 7';                                     {!!.01}
  RSCategoryDesc8   : string    = 'Category 8';                                     {!!.01}
  RSCategoryDesc9   : string    = 'Category 9';                                     {!!.01}

  { Print Format Editor }

  RSEditPrintFormat : string    = 'Edit Print Formats...';

  { Automatic resource adding/selection}                               {!!.01}

  RSAddNewResource  : string    = 'No resources have been defined. Would you ' +  {!!.01}
                       'like to add one now?';                         {!!.01}
  RSSelectResource  : string    = 'No resource has been selected. Would you ' +   {!!.01}
                       'like to select one now?';
implementation

end.
